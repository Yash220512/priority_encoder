/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09
// Date      : Mon Jun  2 06:12:00 2025
/////////////////////////////////////////////////////////////


module pri_enc ( Clock, d, q, v );
  input [3:0] d;
  output [1:0] q;
  input Clock;
  output v;
  wire   N5, N6, N7, n3, n4, n5, n6, n7, n8, n9, n10;

  DFFX1_RVT v_reg ( .D(N7), .CLK(Clock), .Q(v) );
  DFFX1_RVT \q_reg[1]  ( .D(N6), .CLK(Clock), .Q(q[1]) );
  DFFX1_RVT \q_reg[0]  ( .D(N5), .CLK(Clock), .Q(q[0]) );
  INVX0_RVT U8 ( .A(d[1]), .Y(n3) );
  INVX0_RVT U9 ( .A(n3), .Y(n4) );
  INVX0_RVT U10 ( .A(d[2]), .Y(n5) );
  INVX0_RVT U11 ( .A(n5), .Y(n6) );
  INVX0_RVT U12 ( .A(d[3]), .Y(n7) );
  INVX0_RVT U13 ( .A(n7), .Y(n8) );
  OAI21X1_RVT U14 ( .A1(n6), .A2(n9), .A3(n10), .Y(N5) );
  OR3X1_RVT U15 ( .A1(n4), .A2(d[0]), .A3(N6), .Y(N7) );
  INVX1_RVT U16 ( .A(n4), .Y(n9) );
  INVX1_RVT U17 ( .A(n8), .Y(n10) );
  OR2X1_RVT U18 ( .A1(n8), .A2(n6), .Y(N6) );
endmodule

