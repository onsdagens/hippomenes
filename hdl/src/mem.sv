// Program memory

module mem
  import config_pkg::*;
  import mem_pkg::*;
#(
    parameter integer MemSize = 'h0000_1000,
    localparam integer MemAddrWidth = $clog2(MemSize)  // derived
) (
    input reg clk,
    input reg write_enable,
    input mem_width_t width,
    input reg sign_extend,
    input reg [MemAddrWidth-1:0] address,
    input reg [31:0] data_in,
    output reg [31:0] data_out,
    output reg alignment_error
);

  reg [31:0] mem[MemSize >> 2];
  reg [3:0][7:0] read_word;
  reg [3:0][7:0] write_word;

  always @(posedge clk) begin
    // do not write to register 0
    if (write_enable) begin
      write_word = mem[address[DMemAddrWidth-1:2]];
      // $display("clk: write_word = %h", write_word);
      case (width)
        BYTE: begin
          write_word[address[1:0]] = data_in[7:0];
          // $display("data_in = %h, data_in[7:0] = %h, write_word = %h", data_in, data_in[7:0], write_word);
        end

        HALFWORD: begin
          // NOTICE, will write even in case of alignment error
          write_word[{address[1:1], 1'(1)}] = data_in[15:8];
          write_word[{address[1:1], 1'(0)}] = data_in[7:0];
        end
        WORD: begin
          write_word = data_in;
        end
        default: begin
        end
      endcase
      mem[address[DMemAddrWidth-1:2]] = write_word;
    end

  end

  always_comb begin
    read_word = mem[address[DMemAddrWidth-1:2]];

    case (width)
      BYTE: begin
        alignment_error = 0;
        data_out = {
          24'($signed(read_word[address[1:0]][7:7] && sign_extend)), read_word[address[1:0]]
        };
      end
      HALFWORD: begin
        alignment_error = address[0:0];
        data_out = {
          16'($signed(read_word[{address[1:1], 1'(1)}][7:7] && sign_extend)),
          read_word[{address[1:1], 1'(1)}],
          read_word[{address[1:1], 1'(0)}]
        };
      end
      WORD: begin
        alignment_error = (address[1:0] != 0);
        data_out = read_word;
      end
      default: data_out = 0;
    endcase

    // $display("data = %h", data_out);
  end

endmodule
