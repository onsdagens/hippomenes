// tb_top_arty
//`timescale 1ns / 1ps

module tb_top_arty;
  import config_pkg::*;
  import arty_pkg::*;
  logic clk;
  logic reset;


  BtnT  btn;
  LedT  led;
  logic tx;

  top_arty #(
      .INIT_B0_IMEM("../../rust_examples/text_0.mem"),
      .INIT_B1_IMEM("../../rust_examples/text_1.mem"),
      .INIT_B2_IMEM("../../rust_examples/text_2.mem"),
      .INIT_B3_IMEM("../../rust_examples/text_3.mem"),
      .INIT_B0_DMEM("../../rust_examples/data_0.mem"),
      .INIT_B1_DMEM("../../rust_examples/data_1.mem"),
      .INIT_B2_DMEM("../../rust_examples/data_2.mem"),
      .INIT_B3_DMEM("../../rust_examples/data_3.mem")
  ) top (
      // in
      .clk,
      .reset,
      .btn,
      // debug interface, in this case dont cares
      .debug_i('0),
      .debug_addr_i('0),
      .debug_data_i('0),
      .debug_imem_i('0),
      .debug_full_reset_i(reset),
      // out
      .led,
      .tx
  );

  // clock and reset
  initial begin
    $display($time, " << Starting the Simulation >>");
    //$display("memsize %h", IMemSize >> 2);
    reset = 1;
    clk   = 0;
    #15 reset = 0;
  end

  always #10 begin
    clk = ~clk;
    if (clk) $display(">>>>>>>>>>>>> clk posedge", $time);
  end

  initial begin
    $dumpfile("top_arty.fst");
    $dumpvars;
    #100000;
    $finish;
  end

endmodule
