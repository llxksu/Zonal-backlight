//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Wrapper pack file for instantiation
//Tool Version: V1.9.10.02
//Created Time: Thu Oct 24 11:17:06 2024

module lvds_video_top_gowin_top (
    I_clk,
    I_rst_n,
    O_led,
    I_clkin_p,
    I_clkin_n,
    I_din_p,
    I_din_n,
    O_clkout_p,
    O_clkout_n,
    O_dout_p,
    O_dout_n
);
input I_clk;
input I_rst_n;
output [3:0] O_led;
input I_clkin_p;
input I_clkin_n;
input [3:0] I_din_p;
input [3:0] I_din_n;
output O_clkout_p;
output O_clkout_n;
output [3:0] O_dout_p;
output [3:0] O_dout_n;
lvds_video_top lvds_video_top_ins (
    .I_clk(I_clk),
    .I_rst_n(I_rst_n),
    .O_led(O_led[3:0]),
    .I_clkin_p(I_clkin_p),
    .I_clkin_n(I_clkin_n),
    .I_din_p(I_din_p[3:0]),
    .I_din_n(I_din_n[3:0]),
    .O_clkout_p(O_clkout_p),
    .O_clkout_n(O_clkout_n),
    .O_dout_p(O_dout_p[3:0]),
    .O_dout_n(O_dout_n[3:0])
);
endmodule
