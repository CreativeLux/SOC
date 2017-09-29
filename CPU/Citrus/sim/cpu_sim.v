`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2017/09/25 10:43:31
// Design Name:
// Module Name: cpu_sim
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


module cpu_sim(

       );
reg clk,clrn;
reg [7:0] vector;
reg intr;
wire inta;
cpu cpu(
        .clk(clk),
        .clrn(clrn),
        .vector(vector),
        .intr(intr),
        .inta(inta)
        //      .pc(pc),
        //      .inst(inst),
        ////      .wpcir(no)
        //      .aluc(aluc),
        //      .ealuc(ealuc),
        //      .ern0(ern0),
        //      .fwda(fwda),
        //      .fwdb(fwdb),
        //      .mm2reg(mm2reg),
        //      .ewreg(ewreg),
        //      .wwreg(wwreg),
        //      .wreg(wreg),
        //      .m2reg(m2reg),
        //      .wmem(wmem),
        //      .jal(jal),
        //      .aluimm(aluimm),
        //      .shift(shift),
        //      .em2reg(em2reg),
        //      .ewmem(ewmem),
        //      .ejal(ejal),
        //      .ealuimm(ealuimm),
        //      .eshift(eshift),
        //      .mwreg(mwreg),
        //      .mwmem(mwmem),
        //      .wm2reg(wm2reg)
    );
initial begin
    clrn=0;
    clk=0;
    vector = 8'b01010101;
    intr = 0;
    //              no=1;
    #1 clrn=1;
    #50 clrn=0;
    #100 intr = 1;
    //         #500 clrn = 1;
end
always #5 clk=~clk;
endmodule
