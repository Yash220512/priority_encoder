module pri_enc (
    input   Clock,
    input [3:0] d,
    output reg [1:0] q,
    output reg       v
);

    always @(posedge Clock) begin
        if (d[3]) begin
            q <= 2'd3;
            v <= 1;
        end else if (d[2]) begin
            q <= 2'd2;
            v <= 1;
        end else if (d[1]) begin
            q <= 2'd1;
            v <= 1;
        end else if (d[0]) begin
            q <= 2'd0;
            v <= 1;
        end else begin
            q <= 2'd0;
            v <= 0;
        end
    end

endmodule

