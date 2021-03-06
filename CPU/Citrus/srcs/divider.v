`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:IceTesla
//
// Create Date: 2017/09/19 19:14:38
// Design Name:
// Module Name: divider
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


module divider(
    a,
    b,
    symbol,
    start,
    clock,
    reset,
    q,
    r,
    busy,
    busy2
    );
    integer i=0;
    input [31:0] a;
    input [31:0] b;
    input start;
    input clock,reset;
    wire [31:0] out;
    output [31:0] r;
    output busy;
    output busy2;
    reg [31:0] reg_q;
    reg [31:0] reg_r;
    reg [31:0] reg_b;
    reg busy, busy2;

    input symbol;
    reg [31:0] unsigned_a;
    reg [31:0] unsigned_b;
    wire ab_symbol;
    output[31:0] q;

    always @ ( * ) begin
        if(symbol == 0) begin
            unsigned_a <= a;
            unsigned_b <= b;
        end else begin
            unsigned_a <= a[31]?(~a+1):a;
            unsigned_b <= b[31]?(~b+1):b;
        end
    end

    always @ (posedge clock or posedge reset) begin
        if (reset == 1) begin
            busy <= 0;
            busy2 <= 0;
            i = 0;
        end else begin
            if(start) begin
                reg_r <= 16'h0;
                reg_q <= unsigned_a;
                reg_b <= unsigned_b;
                busy <= 1'b1;
                i = 0;
            end else if (busy) begin
                reg_r <= mux_out;
                reg_q <= {reg_q[30:0],~sub_out[32]};
                i = i+1;
                if (i == 32) begin
                    busy <= 0;
                    i = 0;
                end
            end
        end
    end

    always @ ( negedge clock ) begin
        busy2 <= busy;
    end

    xor(ab_symbol,a[31],b[31]);

    assign q = (symbol == 0 || symbol&&~ab_symbol)?out:(~out + 1);

wire [32:00] sub_out = {r,out[31]} - {1'b0,reg_b};
wire [31:00] mux_out = sub_out[32]?{r[30:0],out[31]} : sub_out[31:0];
assign out = reg_q;
assign r = reg_r;

endmodule
