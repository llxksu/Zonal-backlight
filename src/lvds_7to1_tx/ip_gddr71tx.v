
`include "lvds_7to1_tx_defines.v"

module ip_gddr71tx 
(
    input        refclk, 
    input        sclk, 
`ifdef TX_ONE_CHANNEL
    `ifdef TX_RGB888
        input  [6:0] data0, 
        input  [6:0] data1, 
        input  [6:0] data2, 
        input  [6:0] data3,
        output       clkout_p    ,
        output       clkout_n    ,
        output [3:0] dout_p      ,
        output [3:0] dout_n      ,
    `endif 
`endif 

    input        reset
);

//=======================================================
`ifdef TX_CLK_PATTERN_1100011
    localparam TX_CLK_PT = 7'b1100011;
`endif

`ifdef TX_CLK_PATTERN_1100001
    localparam TX_CLK_PT = 7'b1100001;
`endif

//=======================================================
`ifdef TX_ONE_CHANNEL
        wire       buf_clkout;
        wire       buf_dout0 ;
        wire       buf_dout1 ;
        wire       buf_dout2 ;
    `ifdef TX_RGB888
        wire       buf_dout3 ;
    `endif 
`endif 


//=====================================================
`ifdef TX_ONE_CHANNEL 
    //clock pattern 7'b1100011
    OVIDEO ODDR71B_clk_inst  
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(TX_CLK_PT[6]), 
        .D5(TX_CLK_PT[5]), 
        .D4(TX_CLK_PT[4]), 
        .D3(TX_CLK_PT[3]), 
        .D2(TX_CLK_PT[2]), 
        .D1(TX_CLK_PT[1]), 
        .D0(TX_CLK_PT[0]), 
        .Q(buf_clkout)
    );
    defparam ODDR71B_clk_inst.GSREN="true";
    defparam ODDR71B_clk_inst.LSREN ="false";

    `ifdef TX_RGB888
        OVIDEO ODDR71B_d3_inst 
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(data3[6]), 
            .D5(data3[5]), 
            .D4(data3[4]), 
            .D3(data3[3]), 
            .D2(data3[2]), 
            .D1(data3[1]), 
            .D0(data3[0]), 
            .Q(buf_dout3)
        );
        defparam ODDR71B_d3_inst.GSREN="true";
        defparam ODDR71B_d3_inst.LSREN ="false";
    `endif
        
    OVIDEO ODDR71B_d2_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data2[6]), 
        .D5(data2[5]), 
        .D4(data2[4]), 
        .D3(data2[3]), 
        .D2(data2[2]), 
        .D1(data2[1]), 
        .D0(data2[0]), 
        .Q(buf_dout2)
    );
    defparam ODDR71B_d2_inst.GSREN="true";
    defparam ODDR71B_d2_inst.LSREN ="false";
        
    OVIDEO ODDR71B_d1_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data1[6]), 
        .D5(data1[5]), 
        .D4(data1[4]), 
        .D3(data1[3]), 
        .D2(data1[2]), 
        .D1(data1[1]), 
        .D0(data1[0]), 
        .Q(buf_dout1)
    );
    defparam ODDR71B_d1_inst.GSREN="true";
    defparam ODDR71B_d1_inst.LSREN ="false";
        
    OVIDEO ODDR71B_d0_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data0[6]), 
        .D5(data0[5]), 
        .D4(data0[4]), 
        .D3(data0[3]), 
        .D2(data0[2]), 
        .D1(data0[1]), 
        .D0(data0[0]), 
        .Q(buf_dout0)
    );
    defparam ODDR71B_d0_inst.GSREN="true";
    defparam ODDR71B_d0_inst.LSREN ="false";
    
    `ifdef USE_TLVDS_OBUF
        TLVDS_OBUF Inst_OB  (.O(clkout_p),  .OB(clkout_n),  .I(buf_clkout));
        TLVDS_OBUF Inst_OB0 (.O(dout_p[0]), .OB(dout_n[0]), .I(buf_dout0));
        TLVDS_OBUF Inst_OB1 (.O(dout_p[1]), .OB(dout_n[1]), .I(buf_dout1));
        TLVDS_OBUF Inst_OB2 (.O(dout_p[2]), .OB(dout_n[2]), .I(buf_dout2));
        `ifdef TX_RGB888
            TLVDS_OBUF Inst_OB3 (.O(dout_p[3]), .OB(dout_n[3]), .I(buf_dout3));
        `endif
    `endif
    
`endif




endmodule
