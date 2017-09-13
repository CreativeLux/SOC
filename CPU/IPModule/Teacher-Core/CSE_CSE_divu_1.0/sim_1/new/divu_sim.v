`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/03/12 22:57:55
// Design Name: 
// Module Name: divu_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divu_sim(

    );
  // input
  reg [31:0] a = 32'd16;
  reg [15:0] b = 16'd4;
  reg clk = 0;
  reg start = 0; 
  reg resetn = 0; 
  // output
  wire [31:0] q;
  wire [15:0] r;
  wire busy;
  
  divu #(32) u(a,b,clk,start,resetn,q,r,busy);
  initial begin
   #30 begin resetn = 1;start = 1;end
   #50 start = 0;
   #1400 begin start = 1; a = 31'd18;b = 16'd5;end
   #50 start = 0;
  end
  always  #20  clk = ~clk;
endmodule
