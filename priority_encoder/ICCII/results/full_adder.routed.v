// IC Compiler II Version W-2024.09 Verilog Writer
// Generated on 6/2/2025 at 3:11:32
// Library Name: ysh_LIBB
// Block Name: pri_enc
// User Label: 
// Write Command: write_verilog ./results/full_adder.routed.v
module pri_enc ( Clock , d , q , v ) ;
input  Clock ;
input  [3:0] d ;
output [1:0] q ;
output v ;

DFFX1_RVT v_reg ( .D ( N7 ) , .CLK ( Clock ) , .Q ( v ) ) ;
DFFX1_RVT \q_reg[1] ( .D ( N6 ) , .CLK ( Clock ) , .Q ( q[1] ) ) ;
DFFX1_RVT \q_reg[0] ( .D ( N5 ) , .CLK ( Clock ) , .Q ( q[0] ) ) ;
OR3X1_RVT U14 ( .A1 ( d[1] ) , .A2 ( d[0] ) , .A3 ( N6 ) , .Y ( N7 ) ) ;
INVX0_RVT U15 ( .A ( d[1] ) , .Y ( n9 ) ) ;
OR2X1_RVT U16 ( .A1 ( d[3] ) , .A2 ( d[2] ) , .Y ( N6 ) ) ;
NOR2X0_RVT U17 ( .A1 ( d[2] ) , .A2 ( n9 ) , .Y ( n10 ) ) ;
OR2X1_RVT U18 ( .A1 ( d[3] ) , .A2 ( n10 ) , .Y ( N5 ) ) ;
endmodule


