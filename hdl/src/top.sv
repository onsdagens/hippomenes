// top module


module top (
    input clk,
    input logic reset,
    output logic led
);
  import config_pkg::*;
  import decoder_pkg::*;
  import mem_pkg::*;

  // registers
  word pc_reg_out;
  reg_n pc_reg (
      .clk(clk),
      .reset(reset),
      .in(pc_mux_out),
      .out(pc_reg_out)
  );

  word wb_data_reg_out;
  reg_n wb_data_reg (
      .clk(clk),
      .reset(reset),
      .in(wb_mux_out),
      .out(wb_data_reg_out)
  );

  // 5 bit register
  r wb_rd_reg_out;
  reg_n #(
      .DataWidth(5)
  ) wb_rd_reg (
      .clk(clk),
      .reset(reset),
      .in(decoder_rd),
      .out(wb_rd_reg_out)
  );

  logic wb_enable_reg_out;
  reg_n #(
      .DataWidth(1)
  ) wb_write_enable_reg (
      .clk(clk),
      .reset(reset),
      .in(decoder_wb_write_enable),
      .out(wb_enable_reg_out)
  );

  // pc related
  word pc_branch_mux_out;
  pc_mux pc_branch_mux (
      .sel(branch_logic_out),
      .pc_next(pc_adder_out),
      .pc_branch(alu_res),
      .out(pc_mux_out)
  );

  // adder
  word pc_adder_out;
  pc_adder pc_adder (
      .in (pc_reg_out),
      .out(pc_adder_out)
  );

  // instruction memory
  word imem_data_out;

  rom #(
      .MemSize(IMemSize)
  ) imem (
      // in
      .clk(clk),
      .address(pc_reg_out[IMemAddrWidth-1:0]),
      // out
      .data_out(imem_data_out)
  );

  // decoder
  wb_mux_t decoder_wb_mux_sel;
  logic decoder_wb_write_enable;
  alu_a_mux_t decoder_alu_a_mux_sel;
  alu_b_mux_t decoder_alu_b_mux_sel;
  alu_op_t decoder_alu_op;
  logic decoder_sub_arith;
  word decoder_imm;
  r decoder_rs1;
  r decoder_rs2;
  r decoder_rd;

  // mem
  logic decoder_dmem_write_enable;
  logic decoder_dmem_sign_extend;

  // branch
  logic decoder_branch_instr;
  branch_op_t decoder_branch_op;
  logic decoder_branch_always;

  // decoder
  logic decoder_csr_enable;
  csr_op_t decoder_csr_op;
  CsrAddrT decoder_csr_addr;
  mem_width_t decoder_dmem_width;

  decoder decoder (
      // in
      .instr(imem_data_out),
      // out
      .csr_addr(decoder_csr_addr),
      // register file
      .rs1(decoder_rs1),
      .rs2(decoder_rs2),
      .imm(decoder_imm),
      // branch logic
      .branch_always(decoder_branch_always),
      .branch_instr(decoder_branch_instr),
      .branch_op(decoder_branch_op),
      // alu
      .alu_a_mux_sel(decoder_alu_a_mux_sel),
      .alu_b_mux_sel(decoder_alu_b_mux_sel),
      .alu_op(decoder_alu_op),
      .sub_arith(decoder_sub_arith),
      // data memory
      .dmem_write_enable(decoder_dmem_write_enable),
      .dmem_sign_extend(decoder_dmem_sign_extend),
      .dmem_width(decoder_dmem_width),
      // csr
      .csr_enable(decoder_csr_enable),
      .csr_op(decoder_csr_op),
      // write back
      .wb_mux_sel(decoder_wb_mux_sel),
      .rd(decoder_rd),
      .wb_write_enable(decoder_wb_write_enable)
  );

  // register file
  word rf_rs1;
  word rf_rs2;
  register_file rf (
      // in
      .clk(clk),
      .reset(reset),
      .writeEn(wb_enable_reg_out),
      .writeAddr(wb_rd_reg_out),
      .writeData(wb_data_reg_out),
      .readAddr1(decoder_rs1),
      .readAddr2(decoder_rs2),
      // out
      .readData1(rf_rs1),
      .readData2(rf_rs2)
  );

  // branch logic
  pc_branch_mux_t branch_logic_out;
  branch_logic branch_logic (
      // in
      .a(rf_rs1),
      .b(rf_rs2),
      .branch_always(decoder_branch_always),
      .branch_instr(decoder_branch_instr),
      .op(decoder_branch_op),
      // out
      .out(branch_logic_out)
  );

  // Alu related
  word alu_a_mux_out;
  alu_a_mux alu_a_mux (
      // in
      .sel (decoder_alu_a_mux_sel),
      .imm (decoder_imm),
      .rs1 (rf_rs1),
      .zero(32'(0)),
      // out
      .out (alu_a_mux_out)
  );

  word alu_b_mux_out;
  alu_b_mux alu_b_mux (
      // in
      .sel(decoder_alu_b_mux_sel),
      // out
      .rs2(rf_rs2),
      .imm(decoder_imm),
      .pc_plus_4(pc_adder_out),
      .pc(pc_reg_out),
      .out(alu_b_mux_out)
  );

  word alu_res;
  alu alu (
      .a(alu_a_mux_out),
      .b(alu_b_mux_out),
      .sub_arith(decoder_sub_arith),
      .op(decoder_alu_op),
      .res(alu_res)
  );

  word  dmem_data_out;
  logic dmem_alignment_error;
  mem #(
      .MemSize(DMemSize)
  ) dmem (
      // in
      .clk(clk),
      .write_enable(decoder_dmem_write_enable),
      .width(decoder_dmem_width),
      .sign_extend(decoder_dmem_sign_extend),
      .address(alu_res[DMemAddrWidth-1:0]),
      .data_in(rf_rs2),
      // out
      .data_out(dmem_data_out),
      .alignment_error(dmem_alignment_error)
  );

  word  csr_led_out;
  logic csr_led_match;
  csr_led csr_led (
      // in
      .clk,
      .reset,
      .csr_enable(decoder_csr_enable),
      .csr_addr(decoder_csr_addr),
      .rs1_zimm(decoder_rs1),
      .rs1_data(rf_rs1),
      .csr_op(decoder_csr_op),
      .ext_data(0),
      .ext_write_enable(0),
      // out
      .out(csr_led_out),
      .led(led)
  );

  word wb_mux_out;
  wb_mux wb_mux (
      .sel(decoder_wb_mux_sel),
      .dm(dmem_data_out),
      .alu(alu_res),
      .csr(csr_led_out),
      .pc_plus_4(pc_adder_out),
      .out(wb_mux_out)
  );

endmodule
