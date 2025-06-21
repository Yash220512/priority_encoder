// IC Compiler II Version W-2024.09 Verilog Writer
// Generated on 6/2/2025 at 5:32:52
// Library Name: ysh_LIBB11
// Block Name: no_ADD
// User Label: 
// Write Command: write_verilog ./results/pri_enc.routed.v
module pri_enc ( Clock , d , q , v ) ;
input  Clock ;
input  [3:0] d ;
output [1:0] q ;
output v ;

DFFX1_RVT v_reg ( .D ( N7 ) , .CLK ( ctosc_drc_0 ) , .Q ( v ) ) ;
DFFX1_RVT \q_reg[0] ( .D ( N5 ) , .CLK ( ctosc_drc_0 ) , .Q ( q[0] ) ) ;
DFFSSRX1_RVT \q_reg[1] ( .D ( 1'b0 ) , .SETB ( N6 ) , .RSTB ( 1'b1 ) , 
    .CLK ( ctosc_drc_0 ) , .QN ( q[1] ) ) ;
NBUFFX2_RVT ctosc_drc_inst_338 ( .A ( ctosc_drc_1 ) , .Y ( ctosc_drc_0 ) ) ;
INVX1_RVT ctmTdsLR_1_1 ( .A ( d[2] ) , .Y ( tmp_net0 ) ) ;
NAND2X0_RVT ctmTdsLR_1_432 ( .A1 ( tmp_net4 ) , .A2 ( tmp_net3 ) , .Y ( N5 ) ) ;
NBUFFX16_RVT ctosc_drc_inst_429 ( .A ( Clock ) , .Y ( ctosc_drc_1 ) ) ;
NAND2X0_RVT ctmTdsLR_2_431 ( .A1 ( d[1] ) , .A2 ( tmp_net0 ) , 
    .Y ( tmp_net3 ) ) ;
OR3X1_RVT U14 ( .A1 ( d[1] ) , .A2 ( d[0] ) , .A3 ( N6 ) , .Y ( N7 ) ) ;
INVX1_RVT ctmTdsLR_2_433 ( .A ( d[3] ) , .Y ( tmp_net4 ) ) ;
OR2X1_RVT U18 ( .A1 ( d[3] ) , .A2 ( d[2] ) , .Y ( N6 ) ) ;
endmodule


