//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Wrapper pack file for instantiation
//Tool Version: V1.9.10 (64-bit)
//Created Time: Mon Sep  2 10:33:42 2024

module sram_top_gowin_top (
    clka,
    clkb,
    sdbpflag,
    wtaddr,
    wtdina,
    rst_n,
    promdout,
    latch_flag,
    frame_flag,
    doutb,
    datain,
    cntlatch
);
input clka;
input clkb;
input sdbpflag;
input [9:0] wtaddr;
input [15:0] wtdina;
input rst_n;
output [9:0] promdout;
output latch_flag;
output frame_flag;
output [15:0] doutb;
output [95:0] datain;
output [6:0] cntlatch;
sram_top sram_top_ins (
    .clka(clka),
    .clkb(clkb),
    .sdbpflag(sdbpflag),
    .wtaddr(wtaddr[9:0]),
    .wtdina(wtdina[15:0]),
    .rst_n(rst_n),
    .promdout(promdout[9:0]),
    .latch_flag(latch_flag),
    .frame_flag(frame_flag),
    .doutb(doutb[15:0]),
    .datain(datain[95:0]),
    .cntlatch(cntlatch[6:0])
);
endmodule
