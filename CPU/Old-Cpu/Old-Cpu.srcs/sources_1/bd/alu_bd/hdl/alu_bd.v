//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Oct 18 15:15:37 2016
//Host        : ThinkPad running 64-bit Arch Linux
//Command     : generate_target alu_bd.bd
//Design      : alu_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "alu_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=alu_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=14,numReposBlks=14,numNonXlnxBlks=14,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "alu_bd.hwdef" *) 
module alu_bd
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

  wire [3:0]ALUctr_1;
  wire [31:0]A_1;
  wire [31:0]B_1;
  wire addsub_1_cf;
  wire addsub_1_of;
  wire addsub_1_sf;
  wire [31:0]addsub_1_sum;
  wire addsub_1_zf;
  wire [0:0]andgate_0_c;
  wire [31:0]andgate_1_c;
  wire [31:0]input0_0_zero;
  wire [31:0]input1_1_one;
  wire [0:0]mux2to1_0_q;
  wire [31:0]mux2to1_1_q;
  wire [31:0]mux8to1_0_q;
  wire my_alu_ctr_input_1_ALGctr;
  wire [2:0]my_alu_ctr_input_1_OPctr;
  wire my_alu_ctr_input_1_OVctr;
  wire my_alu_ctr_input_1_SIGctr;
  wire my_alu_ctr_input_1_SLctr;
  wire my_alu_ctr_input_1_SUBctr;
  wire [31:0]my_shift_1_Result;
  wire [31:0]norgate_0_c;
  wire [31:0]orgate_0_c;
  wire [0:0]xorgate_0_c;
  wire [0:0]xorgate_1_c;

  assign ALUctr_1 = ALUctr[3:0];
  assign A_1 = A[31:0];
  assign B_1 = B[31:0];
  assign Overflow[0] = andgate_0_c;
  assign Result[31:0] = mux8to1_0_q;
  assign Zero = addsub_1_zf;
  alu_bd_addsub_1_0 addsub_1
       (.a(A_1),
        .b(B_1),
        .cf(addsub_1_cf),
        .of(addsub_1_of),
        .sf(addsub_1_sf),
        .sub(my_alu_ctr_input_1_SUBctr),
        .sum(addsub_1_sum),
        .zf(addsub_1_zf));
  alu_bd_andgate_0_0 andgate_0
       (.a(addsub_1_of),
        .b(my_alu_ctr_input_1_OVctr),
        .c(andgate_0_c));
  alu_bd_andgate_1_0 andgate_1
       (.a(A_1),
        .b(B_1),
        .c(andgate_1_c));
  alu_bd_input0_0_0 input0_0
       (.zero(input0_0_zero));
  alu_bd_input1_1_1 input1_1
       (.one(input1_1_one));
  alu_bd_mux2to1_0_0 mux2to1_0
       (.a0(xorgate_0_c),
        .a1(xorgate_1_c),
        .q(mux2to1_0_q),
        .s(my_alu_ctr_input_1_SIGctr));
  alu_bd_mux2to1_1_0 mux2to1_1
       (.a0(input0_0_zero),
        .a1(input1_1_one),
        .q(mux2to1_1_q),
        .s(mux2to1_0_q));
  alu_bd_mux8to1_0_0 mux8to1_0
       (.a0(addsub_1_sum),
        .a1(mux2to1_1_q),
        .a2(andgate_1_c),
        .a3(orgate_0_c),
        .a4(input0_0_zero),
        .a5(norgate_0_c),
        .a6(input0_0_zero),
        .a7(my_shift_1_Result),
        .q(mux8to1_0_q),
        .s(my_alu_ctr_input_1_OPctr));
  alu_bd_my_alu_ctr_input_1_0 my_alu_ctr_input_1
       (.ALGctr(my_alu_ctr_input_1_ALGctr),
        .ALUctr(ALUctr_1),
        .OPctr(my_alu_ctr_input_1_OPctr),
        .OVctr(my_alu_ctr_input_1_OVctr),
        .SIGctr(my_alu_ctr_input_1_SIGctr),
        .SLctr(my_alu_ctr_input_1_SLctr),
        .SUBctr(my_alu_ctr_input_1_SUBctr));
  alu_bd_my_shift_1_0 my_shift_1
       (.A(A_1),
        .ALGctr(my_alu_ctr_input_1_ALGctr),
        .B(B_1),
        .Result(my_shift_1_Result),
        .SLctr(my_alu_ctr_input_1_SLctr));
  alu_bd_norgate_0_0 norgate_0
       (.a(A_1),
        .b(B_1),
        .c(norgate_0_c));
  alu_bd_orgate_0_0 orgate_0
       (.a(A_1),
        .b(B_1),
        .c(orgate_0_c));
  alu_bd_xorgate_0_0 xorgate_0
       (.a(my_alu_ctr_input_1_SUBctr),
        .b(addsub_1_cf),
        .c(xorgate_0_c));
  alu_bd_xorgate_1_0 xorgate_1
       (.a(addsub_1_of),
        .b(addsub_1_sf),
        .c(xorgate_1_c));
endmodule
