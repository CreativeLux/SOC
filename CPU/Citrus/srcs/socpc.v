`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/06 16:08:58
// Design Name: 
// Module Name: socpc  pcģ��
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


module socpc (
    input reg [31:0] pc,//pc
	//input reg [31:0]  ,//npc0
	input reg [31:0] bpc,//npc1
	input reg [31:0] dpc,//npc2
	input reg [31:0] jpc,//npc3
	input reg [1:0] pcsource,//pc��Դ
	output reg [31:0] pc4,//pc+4
	output reg [31:0] ins,//ins
);
		

endmodule
