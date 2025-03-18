// time_stamp


//  Monotonically increasing timer
module mono_timer
  import config_pkg::*;
(
    input logic clk,
    input logic reset,

    output MonoTimerT mono_timer
);
  always_ff @(posedge clk) begin
    if (reset) mono_timer <= 0;
    else mono_timer <= mono_timer + 1;
  end
endmodule
