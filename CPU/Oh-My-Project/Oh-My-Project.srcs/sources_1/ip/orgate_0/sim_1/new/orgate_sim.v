`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/29 22:50:22
// Design Name: 
// Module Name: orgate_sim
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


module orgate_sim(  );
    // input 
reg [31:0] a=32'h00000000;
reg [31:0] b=32'h00000000;

//outbut
wire [31:0] c;
 orgate #(32) u(a,b,c);    // ʵ�������ŵ�ʱ���趨���Ϊ32

initial begin
#100  a=32'hffffffff;
#100  begin a=32'h00000000;b=32'hffffffff;end
#100  b = 32'h007fa509;
#100  begin a=32'hffffffff;b=32'hffffffff;end
end
endmodule
