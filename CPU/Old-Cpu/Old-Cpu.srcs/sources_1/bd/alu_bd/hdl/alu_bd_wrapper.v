//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Oct 18 15:15:37 2016
//Host        : ThinkPad running 64-bit Arch Linux
//Command     : generate_target alu_bd_wrapper.bd
//Design      : alu_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module alu_bd_wrapper
   (A,
    ALUctr,
    B,
    Overflow,
    Result,
    Zero);
  input [31:0]A;
  input [3:0]ALUctr;
  input [31:0]B;
  output [0:0]Overflow;
  output [31:0]Result;
  output Zero;

  wire [31:0]A;
  wire [3:0]ALUctr;
  wire [31:0]B;
  wire [0:0]Overflow;
  wire [31:0]Result;
  wire Zero;

  alu_bd alu_bd_i
       (.A(A),
        .ALUctr(ALUctr),
        .B(B),
        .Overflow(Overflow),
        .Result(Result),
        .Zero(Zero));
endmodule
