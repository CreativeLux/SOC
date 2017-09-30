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
	input [31:0] malu,
	input [31:0] mmo,
	input [4:0] mrn,
	input mwreg,
	input mm2reg,
	input clk,
	input clrn,
    input[31:0] msta,
    input[31:0] mcau,
    input[31:0] mepc,
    output reg [31:0] wsta,
    output reg [31:0] wcau,
    output reg [31:0] wepc,
	output reg [31:0] walu,
	output reg [31:0] wmo,
	output reg [4:0] wrn,
	output reg wwreg,
	output reg wm2reg

    );
	always @ ( posedge clk ) begin
	    if ( clrn != 0 ) begin
		    walu   <= 32'h0000_0000;
	        wmo    <= 32'h0000_0000;
	        wrn    <= 5'b00000;
	        wwreg  <= 1'b0;
	        wm2reg <= 1'b0;
            wsta    <= 32'h0000_0000;
            wcau    <= 32'h0000_0000;
            wepc    <= 32'h0000_0000;
		end else begin
		    walu   <= malu;
	        wmo    <= mmo;
	        wrn    <= mrn;
	        wwreg  <= mwreg;
	        wm2reg <= mm2reg;
            wsta    <= msta;
            wcau    <= mcau;
            wepc    <= mepc;
		end
	end

endmodule
