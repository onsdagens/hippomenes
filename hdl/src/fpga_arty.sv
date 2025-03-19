// fpga_top


// This is just illustrative
module fpga_arty (
    input sysclk,
    output logic [3:0] led,

    output logic [3:0] led_r,

    output logic [3:0] led_g,

    output logic [3:0] led_b,

    output logic rx,  // host 
    input  logic tx,  // host

    input logic [2:0] sw,

    input logic [3:0] btn
    // input logic btn1,
    // input logic btn2,
    // input logic btn3
);

  logic clk;

  logic [31:0] r_count;
  // logic reset;
  logic locked;

  logic tmp_sw0;
  logic tmp_sw1;

  logic tmp_btn0;
  logic tmp_btn1;
  logic tmp_btn2;
  logic tmp_btn3;

  assign tmp_sw0  = sw[0];
  assign tmp_sw1  = sw[1];
  assign tmp_btn0 = btn[0];
  assign tmp_btn1 = btn[1];
  assign tmp_btn2 = btn[2];
  assign tmp_btn3 = btn[3];

  //assign led2 = tmp_sw0;
  //assign led3 = tmp_sw1;

  //assign led_r[0]   = 0;
  assign led_r[1] = 0;
  assign led_r[2] = 0;
  //assign led_r[3] = 0;

  assign led_g[0] = 0;
  assign led_g[1] = 0;
  assign led_g[2] = 0;

  assign led_b[0] = 0;
  assign led_b[1] = 0;
  assign led_b[2] = 0;
  assign led_b[3] = 0;

  logic debug_active;
  assign led_r[3] = debug_active;
  logic [7:0] debug_data;
  // we should make this parametric in the jtag...
  logic [13:0] debug_addr;
  jtag #(
    .ADDR_WIDTH(14)
  ) programmer (
      .clk_i(clk),
      .rst_i(tmp_sw1),
      .we_o(debug_active),
      .data_o(debug_data),
      .write_addr_o(debug_addr)
  );

  // just zero-extend for now, this needs to be fixed....
  logic [IMemAddrWidth-1:0] hippo_debug_addr;
  assign hippo_debug_addr = {{(IMemAddrWidth - 14) {1'b0}}, debug_addr};

  // this shouldn't be hard coded either
  logic hippo_debug_imem;
  assign hippo_debug_imem = (debug_addr < 4096);

  logic hippo_debug_reset;
  assign hippo_debug_reset = debug_active | tmp_sw1;

  top_arty #(
      .INIT_B0_IMEM("./text_0.mem"),
      .INIT_B1_IMEM("./text_1.mem"),
      .INIT_B2_IMEM("./text_2.mem"),
      .INIT_B3_IMEM("./text_3.mem"),
      .INIT_B0_DMEM("./data_0.mem"),
      .INIT_B1_DMEM("./data_1.mem"),
      .INIT_B2_DMEM("./data_2.mem"),
      .INIT_B3_DMEM("./data_3.mem")
  ) hippo (
      .clk,
      // this should be a physical reset OR debug signal
      // making sure everything resets whenever we reflash
      .reset(hippo_debug_reset | sw[2]),
      // input
      .btn  (btn),

      // programming interface
      .debug_i(debug_active),
      .debug_addr_i(hippo_debug_addr),
      .debug_data_i(debug_data),
      // this is high when we are targetting instruction memory.
      // otherwise low (then it's data memory).
      .debug_imem_i(hippo_debug_imem),
      // this should be just the switch.
      .debug_full_reset_i(tmp_sw1),

      // output
      .led(led),
      .tx (rx)
  );

  clk_wiz_0 clk_gen (
      // Clock in ports
      .clk_in1(sysclk),
      // Clock out ports
      .clk_out1(clk),
      // Status and control signals
      .reset(tmp_sw0),
      .locked
  );

  // clock devider
  always @(posedge clk) begin
    r_count  <= r_count + 1;
    led_r[0] <= r_count[22];
  end

endmodule

