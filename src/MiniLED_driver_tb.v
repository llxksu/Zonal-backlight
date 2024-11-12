`timescale 1ns/1ns
module MiniLED_driver_tb();
reg clk,rst_n;
wire LE,DCLK,SDI,ROW,scan1,scan2,scan3,scan4;
MiniLED_driver MiniLED_driver_inst(clk,rst_n,LE,DCLK,SDI,ROW,scan1,scan2,scan3,scan4);
initial clk = 1;
always #10 clk = ~clk;
initial
    begin
        rst_n = 0;
        #21 rst_n = 1;
        #999999 $stop;
    end

endmodule