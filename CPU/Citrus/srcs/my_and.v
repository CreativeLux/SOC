`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2017/09/20 14:59:42
// Design Name:
// Module Name: my_and
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


module my_and(
           out,
           a,
           b
       );
output[31:0]out;
input [31:0]a;
input [31:0]b;
assign out = a & b;
endmodule
