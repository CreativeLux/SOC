`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/22 13:38:43
// Design Name: 
// Module Name: pipemwreg
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


module pipemwreg(
	input reg [31:0] malu,
	input reg [31:0] mmo,
	input reg [4:0] mrn,
	input reg mwerg,
	input reg mm2reg,
	input clk,
	input clrn,
	output reg [31:0] walu,
	output reg [31:0] wmo,
	output reg [4:0] wrn,
	output reg wwerg,
	output reg wm2reg,

    );
	always @ ( posedge clk ) begin
	    if ( clrn != 0 ) begin
		    walu   <= 32h'00;
	        wmo    <= 32h'00;
	        wrn    <= 5b'00000;
	        wwerg  <= 0;
	        wm2reg <= 0;
		end else begin
		    walu   <= malu;
	        wmo    <= mmo;
	        wrn    <= mrn;
	        wwerg  <= mwerg;
	        wm2reg <= mm2reg;
		end
	end
		
endmodule