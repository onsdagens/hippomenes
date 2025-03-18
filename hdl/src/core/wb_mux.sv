// wb_mux


import decoder_pkg::*;
module wb_mux (
    input wb_mux_t sel,
    input word alu,
    input word csr,
    input word pc_plus_4,
    input word mul,
    output word out
);

  always_comb begin
    case (sel)
      WB_ALU: out = alu;
      WB_CSR: out = csr;
      WB_PC_PLUS_4: out = pc_plus_4;
      WB_MUL: out = mul;
      default: out = alu;
    endcase
  end

endmodule
