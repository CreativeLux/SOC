`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2016/07/06 16:08:58
// Design Name:
// Module Name: socexe  exeģ��
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


module socexe (
           input [31:0] epc4,
           input [31:0] ea,
           input [31:0] eb,
           input [31:0] eimm,
           input [4:0] ern0,
           input ealuimm,
           input eshift,
           input ejal,
           input [3:0] ealuc,
           output reg [31:0] ealu,
           output reg [4:0] ern,
           output ov,

           input esta,
           input ecau,
           input eepc,
           input [1:0] emfc0

       );
wire epc8 = epc4 + 3'b100;//pc+4
reg [31:0] ia,ib;
wire [31:0]out;
wire ov,zero;

wire mfc0_out;

always @ (ea or eimm or eshift) begin//shift
    case(eshift)
        0:ia <= ea;
        1:ia <= eimm;
        default:ia <= 32'h0000_0000;
    endcase
end

always @ (eb or eimm or ealuimm) begin//imme
    case(ealuimm)
        0:ib <= eb;
        1:ib <= eimm;
        default:ib <= 32'h0000_0000;
    endcase
end

always @ ( emfc0 or epc8 or esta or ecau or eepc ) begin
    case(emfc0)
        2'b00:mfc0_out <= epc8;
        2'b01:mfc0_out <= esta;
        2'b10:mfc0_out <= ecau;
        2'b11:mfc0_out <= eepc;
        default:mfc0_out <=32'h0000_0000;
end

always @ (mfc0_out or out or ejal) begin //jal
    if(ejal|emfc0[1]|emfc0[0])begin
        ealu <= mfc0_out;
    end else begin
        ealu <= out;
    end
end

always @ (ern0 or ejal) begin//f
    case(ejal)
        0:ern <= ern0;
        1:ern <= 5'b11111;
        default:ern <= 32'h0000_0000;
    endcase
end
alu_impl alu(
             .A(ia),
             .ALUctr(ealuc),
             .B(ib),
             .Overflow(ov),
             .Result(out),
             .Zero(zero)
         );


endmodule
