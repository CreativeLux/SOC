`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/30 00:21:26
// Design Name: 
// Module Name: nxorgate
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


module nxorgate
#(parameter WIDTH=8)           //ָ�����ݿ�Ȳ�����ȱʡֵ��8
   (
    input [(WIDTH-1):0] a,     // ����λ���ɲ���WIDTH����
    input [(WIDTH-1):0] b,
    output [(WIDTH-1):0] c
    );

    assign c = ~(a ^ b);       //  2����������

endmodule
