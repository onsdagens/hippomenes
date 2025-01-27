// tb_n_clic
`timescale 1ns / 1ps

module tb_n_clic;
  import decoder_pkg::*;
  import config_pkg::*;

  logic clk;
  logic reset;

  logic csr_enable;
  csr_addr_t csr_addr;
  r rs1_zimm;
  word rs1_data;
  csr_op_t csr_op;
  word out;

  logic [IMemAddrWidth-1:0] pc_in;
  logic [IMemAddrWidth-1:0] n_clic_pc_out;
  n_clic dut (
      // in
      .clk,
      .reset,
      .csr_enable,
      .csr_addr,
      .rs1_zimm,
      .rs1_data,
      .csr_op,
      //
      .pc_in(pc_reg_out),
      .pc_out(n_clic_pc_out),
      // out
      .out(out)
  );

  logic [IMemAddrWidth-1:0] pc_reg_out;
  reg_n #(
      .DataWidth(IMemAddrWidth)
  ) pc_reg (
      // in
      .clk,
      .reset,
      .in (pc_mux_out),
      // out
      .out(pc_reg_out)
  );

  pc_mux_t pc_mux_sel;
  logic [IMemAddrWidth-1:0] pc_branch;
  logic [IMemAddrWidth-1:0] pc_mux_out;
  pc_mux #(
      .AddrWidth(IMemAddrWidth)
  ) pc_mux (
      // in
      .sel(pc_mux_sel),
      .pc_next(n_clic_pc_out),
      .pc_branch(pc_branch),
      // out
      .out(pc_mux_out)
  );

  always #10 clk = ~clk;

  // logic [4:0] entry;
  function void clic_dump();
    $display("mintresh %d, level (nesting depth) %d", dut.m_int_thresh.data, dut.level_out);
    for (integer i = 0; i < 8; i++) begin
      $display("%d, is_int %b max_prio %d, max_vec %d, pc_in %d, pc_out %d", i, dut.is_int[i],
               dut.max_prio[i], dut.max_vec[i], dut.pc_in, dut.pc_out);
    end
  endfunction

  initial begin
    $dumpfile("n_clic.fst");
    $dumpvars;

    clk   = 0;
    reset = 1;
    #15 $display("time ", $time());  // force clock

    reset = 0;

    dut.m_int_thresh.data = 0;  // initial prio, minthresh

    dut.gen_vec[0].csr_entry.data = (1 << 2) | (1 << 1);  // 0, prio 1, enabled
    dut.gen_vec[2].csr_entry.data = (2 << 2) | (1 << 1);  // 2, prio 2, enabled
    dut.gen_vec[4].csr_entry.data = (1 << 2) | (1 << 1);  // 4, prio 1, enabled
    dut.gen_vec[7].csr_entry.data = (7 << 2) | (1 << 1);  // 7, prio 7, enabled

    dut.gen_vec[0].csr_vec.data = 2;  // 8 in byte addr
    dut.gen_vec[2].csr_vec.data = 4;  // 16
    dut.gen_vec[4].csr_vec.data = 8;  // 32 
    dut.gen_vec[7].csr_vec.data = 14;  // 56

    pc_mux_sel = PC_NEXT;

    #20 $display("time ", $time());  // force clocking

    clic_dump();
    assert (dut.is_int[7] == 0 && dut.max_prio[7] == 0 && dut.max_vec[7] == 0);

    $display("pend vec 4");
    dut.gen_vec[4].csr_entry.data |= (1 << 0);  // pended
    #1;
    clic_dump();

    #19 $display("time ", $time());  // force clock
    assert (dut.pc_out == 32);
    clic_dump();

    $display("pend vec 0 no interrupt");
    dut.gen_vec[0].csr_entry.data |= (1 << 0);  // pended
    #1;
    clic_dump();

    #19 $display("time ", $time());  // force clock
    assert (dut.pc_out == 32);
    clic_dump();

    $display("pend vec 2");
    dut.gen_vec[2].csr_entry.data |= (1 << 0);  // pended
    #1;
    clic_dump();

    #19 $display("time ", $time());  // force clock
    assert (dut.pc_out == 16);
    clic_dump();

    $display("no pend, no interrupt");
    #1;
    clic_dump();

    #1;
    clic_dump();

    #18 $display("time ", $time());  // force clock
    assert (dut.pc_out == 16);
    clic_dump();

    $display("no pend, no interrupt");
    #20 $display("time ", $time());  // force clock
    assert (dut.pc_out == 16);
    clic_dump();

    $display("pend vec 7");
    dut.gen_vec[7].csr_entry.data |= (1 << 0);  // pended
    #20 $display("time ", $time());  // force clock
    assert (dut.pc_out == 56);
    clic_dump();

    pc_mux_sel = PC_BRANCH;
    pc_branch  = ~0;
    dut.gen_vec[7].csr_entry.data ^= (1 << 0);  // unpend
    #20 $display("time ", $time());  // force clock
    $display("jal ff");
    pc_mux_sel = PC_NEXT;
    // assert (dut.pc_out == ~0);
    // assert (dut.m_int_thresh.data == 0);
    clic_dump();


    #20 $display("time ", $time());  // force clock
    clic_dump();










    // // simple test of limited size csr
    // csr_addr = 'hb00;
    // csr_enable = 1;
    // rs1_zimm = 0;
    // rs1_data = 0;
    // csr_op = CSRRSI;


    // $display("out %h", out);
    // rs1_zimm = 31;

    // #19;
    // $display("out %h", out);
    // rs1_data = 'hffff_ff0f;
    // csr_op   = CSRRW;

    // #20;
    // $display("out %h", out);



    // // dut.stack_depth.data = 2;

    // // dut.gen_csr[0].csr.data = 23;

    // csr_addr = 'h305;
    // csr_enable = 1;
    // rs1_zimm = 0;
    // rs1_data = 0;
    // csr_op = CSRRSI;

    // #1;
    // $display("305 out %h", out);

    // csr_addr = 'h350;
    // #1;
    // $display("350 out %h", out);


    // #18;
    // $display("out %h", out);
    // // $display("mstatus data %h", dut.mstatus.data);
    // // $display("stack_depth data %h", dut.stack_depth.data);

    // $display("[0] data %h", dut.gen_csr[0].csr.data);
    // $display("[1] data %h", dut.gen_csr[1].csr.data);
    // $display("[2] data %h", dut.gen_csr[2].csr.data);



    // // assert (dut.regs[1][3] == 'h00001111);

    $finish;

  end
endmodule
