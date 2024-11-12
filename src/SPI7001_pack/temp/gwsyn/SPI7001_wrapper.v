//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Wrapper pack file for instantiation
//Tool Version: V1.9.10 (64-bit)
//Created Time: Mon Sep  2 15:51:35 2024

module SPI7001_gowin_top (
    clock,
    clk_1M,
    rst_n,
    frame_f,
    rgb_f,
    rgb_data,
    cnt_s,
    cnt_ms,
    cnt_us,
    cntlatch,
    LE,
    DCLK,
    SDI,
    GCLK,
    scan1,
    scan2,
    scan3,
    scan4,
    scan1_wire
);
input clock;
input clk_1M;
input rst_n;
input frame_f;
input rgb_f;
input [95:0] rgb_data;
input [9:0] cnt_s;
input [9:0] cnt_ms;
input [9:0] cnt_us;
input [6:0] cntlatch;
output LE;
output DCLK;
output SDI;
output GCLK;
output scan1;
output scan2;
output scan3;
output scan4;
output scan1_wire;
SPI7001 SPI7001_ins (
    .clock(clock),
    .clk_1M(clk_1M),
    .rst_n(rst_n),
    .frame_f(frame_f),
    .rgb_f(rgb_f),
    .rgb_data(rgb_data[95:0]),
    .cnt_s(cnt_s[9:0]),
    .cnt_ms(cnt_ms[9:0]),
    .cnt_us(cnt_us[9:0]),
    .cntlatch(cntlatch[6:0]),
    .LE(LE),
    .DCLK(DCLK),
    .SDI(SDI),
    .GCLK(GCLK),
    .scan1(scan1),
    .scan2(scan2),
    .scan3(scan3),
    .scan4(scan4),
    .scan1_wire(scan1_wire)
);
endmodule
