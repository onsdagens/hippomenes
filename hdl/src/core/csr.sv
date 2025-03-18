// csr, individual register

// CsrWidth     The width of the register
// ResetValue   Reset value (only in case of Write)
// Read         A readable register
// Write        A writable register


module csr
  import config_pkg::*;
  import decoder_pkg::*;
#(
    parameter integer unsigned CsrWidth = 32,  // default to word
    localparam type CsrDataT = logic [CsrWidth-1:0],  // derived
    parameter CsrDataT ResetValue = CsrDataT'(0),
    parameter CsrAddrT Addr = CsrAddrT'(0),
    parameter logic Read = 1,
    parameter logic Write = 1
) (
    input logic clk,
    input logic reset,
    input logic csr_enable,
    input CsrAddrT csr_addr,
    input csr_op_t csr_op,
    input r rs1_zimm,
    input word rs1_data,

    // VCSR signals
    input CsrAddrT vcsr_addr,
    input vcsr_width_t vcsr_width,
    input vcsr_offset_t vcsr_offset,
    // external access for side effects
    input CsrDataT ext_data,
    input logic ext_write_enable,
    output word direct_out,  // to use for pend and other immediate side effects
    output word out  // to use for read/write operations, returns old value
);
  CsrDataT data;
  CsrDataT tmp;
  r mask;
  word masked_imm;
  word masked_reg;
  word masked_data;
  always_comb begin
    tmp = data;
    mask = 0;
    masked_reg = 0;
    masked_imm = 0;
    masked_data = 0;
    if (vcsr_addr == Addr && csr_enable && Write) begin
      mask = (1 << vcsr_width) - 1;
      masked_reg = (rs1_data & word'(mask)) << vcsr_offset;
      masked_imm = (word'(rs1_zimm) & word'(mask)) << word'(vcsr_offset);
      masked_data = data & ~(word'(mask) << vcsr_offset);
      $display("@ %h", vcsr_addr);
      case (csr_op)
        CSRRW: begin
          tmp = masked_data | masked_reg;
          $display("VCSR CSRRW %b", tmp);
        end
        CSRRS: begin
          tmp = data | masked_reg;
          $display("VCSR CSRRS %b", tmp);
        end
        CSRRC: begin
          tmp = data & ~masked_reg;
          $display("VCSR CSRRC %b", tmp);
        end
        CSRRWI: begin
          tmp = masked_data | masked_imm;
          $display("VCSR CSRRWI %b", tmp);
        end
        CSRRSI: begin
          tmp = data | masked_imm;
          $display("VCSR CSRRSI %b", tmp);
        end
        CSRRCI: begin
          tmp = data & ~masked_imm;
          $display("VCSR CSRRCI %b", tmp);
        end
        default: ;
      endcase
    end else if (csr_enable && (csr_addr == Addr) && Write) begin
      $display("@ %h", csr_addr);
      case (csr_op)
        CSRRW: begin
          // side effect on read/write here
          $display("CSR CSRRW %h", rs1_data);
          tmp = CsrDataT'(rs1_data);
        end
        CSRRS: begin  // set only if rs1 != x0
          if (rs1_zimm != 0) begin
            // side effect here
            $display("CSR CSRRS %h", rs1_data);
            tmp = data | CsrDataT'(rs1_data);
          end
        end
        CSRRC: begin  // clear only if rs1 != x0
          if (rs1_zimm != 0) begin
            // write side effect here
            $display("CSR CSRRC %h", rs1_data);
            tmp = data & ~(CsrDataT'(rs1_data));
          end
        end
        CSRRWI: begin
          // use rs1_zimm as immediate
          // write side effect here
          $display("CSR CSRRWI %h", rs1_zimm);
          tmp = CsrDataT'($unsigned(rs1_zimm));
        end
        CSRRSI: begin
          // use rs1_zimm as immediate
          if (rs1_zimm != 0) begin
            // write side effect here
            $display("CSR CSRRSI %h", rs1_zimm);
            tmp = data | CsrDataT'($unsigned(rs1_zimm));
          end
        end
        CSRRCI: begin
          // use rs1_zimm as immediate
          if (rs1_zimm != 0) begin
            // write side effect here
            $display("CSR CSRRCI %h", rs1_zimm);
            tmp = data & (~CsrDataT'($unsigned(rs1_zimm)));
          end
        end
        default: ;
      endcase
    end
  end

  assign direct_out = 32'($unsigned(tmp));
  assign out = (Read) ? 32'($unsigned(data)) : 0;

  always_ff @(posedge clk) begin
    if (Write) begin
      if (reset) begin
        data <= ResetValue;
      end else if (ext_write_enable) begin
        // here we do side effect write
        $display("--- ext data ---");
        data <= ext_data;
      end else data <= tmp;
    end
  end

endmodule
