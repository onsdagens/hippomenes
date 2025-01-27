// rf_stack
`timescale 1ns / 1ps

module rf_stack #(
    parameter integer unsigned DataWidth  = 32,
    parameter integer unsigned NumRegs    = 32,
    parameter integer unsigned NumLevels = 8,
    parameter integer unsigned IndexWidth = $clog2(NumRegs),
    parameter integer unsigned IndexLevels = $clog2(NumLevels)
) (
    input  logic                   clk,
    input  logic                   reset,
    input  logic                   writeEn,
    input  logic                   writeRaEn,
    input  logic [  DataWidth-1:0] writeRaData,
    input  logic [IndexLevels-1:0] level,
    input  logic [ IndexWidth-1:0] writeAddr,
    input  logic [  DataWidth-1:0] writeData,
    input  logic [ IndexWidth-1:0] readAddr1,
    input  logic [ IndexWidth-1:0] readAddr2,
    output logic [  DataWidth-1:0] readData1,
    output logic [  DataWidth-1:0] readData2,
    output logic [  DataWidth-1:0] readRa
);

  logic [NumLevels-1:0][NumRegs-1:0][DataWidth-1:0] regs;

  logic [IndexLevels-1:0] level_minus_1;

  always_comb level_minus_1 = level - 1;

  always_ff @(posedge clk) begin
    // do not write to register 0
    if (reset) begin
      regs <= 0;
    end else begin
      if (writeEn && (writeAddr != 0)) begin
        // is this a bug in verilator?
        // regs[(writeAddr==2)?0 : 11'(level)][writeAddr] <= writeData;
        if (writeAddr == 2) regs[0][writeAddr] <= writeData;
        else regs[level][writeAddr] <= writeData;
      end
      if (writeRaEn) regs[level_minus_1][1] <= writeRaData;
    end
  end

  always_comb begin
    // is this a bug in verilator?
    //   readData1 = (writeEn && (readAddr1==writeAddr) && writeAddr != 0) ?
    // writeData : regs[(readAddr1==2)? 0 : 11'(level)][readAddr1];
    //   readData2 = (writeEn && (readAddr2==writeAddr) && writeAddr != 0) ?
    // writeData : regs[(readAddr2==2)? 0 : 11'(level)][readAddr2];

    if (readAddr1 == 0) begin

      readData1 = 0;
    end else if (writeEn && (readAddr1 == writeAddr)) begin
      readData1 = writeData;  // read write through
    end else if (readAddr1 == 2) begin
      readData1 = regs[0][readAddr1];  // sp on level 0
    end else begin
      readData1 = regs[level][readAddr1];
    end

    if (readAddr2 == 0) begin
      readData2 = 0;
    end else if (writeEn && (readAddr2 == writeAddr)) begin
      readData2 = writeData;  // read write through
    end else if (readAddr2 == 2) begin
      readData2 = regs[0][readAddr2];  // sp on level 0
    end else readData2 = regs[level][readAddr2];

    readRa = regs[level][1];  // always output current ra

  end
endmodule
