`timescale 1ns / 1ps
`include "pri_enc_rtl.v"

module pri_enc_tb;

    reg Clock;
    reg [3:0] d;
    wire [1:0] q;
    wire v;

    pri_enc uut (
        .Clock(Clock),
        .d(Clock),
        .q(q),
        .v(v)
    );

    // Clock: 10ns period
    initial Clock = 0;
    always #5 Clock = ~ Clock;

    initial begin
        $display("Starting Priority Encoder Test...");

        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, pri_enc_tb);

        $monitor("Time=%0t Clock=%b d=%b => q=%b v=%b", $time, Clock, d, q, v);

        d = 4'b0000; @(posedge Clock); #1;
        d = 4'b0001; @(posedge Clock); #1;
        d = 4'b0010; @(posedge Clock); #1;
        d = 4'b0100; @(posedge Clock); #1;
        d = 4'b1000; @(posedge Clock); #1;
        d = 4'b0011; @(posedge Clock); #1;
        d = 4'b1111; @(posedge Clock); #1;

        $display("Test complete.");
        $finish;
    end

endmodule
