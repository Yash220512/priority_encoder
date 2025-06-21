# priority_encoder
4-Bit Priority Encoder
Aim
Write synthesizable Verilog for a 4‑input priority encoder (active‑high), create a self‑checking test‑bench, simulate the design, and (optionally) synthesize it for an FPGA/ASIC target.
Tools used for the flow
Step	Tool (suggested)	Purpose
Functional sim.	Cadence NCLaunch / ModelSim	Compile, elaborate and simulate RTL
Waveform view	GTKWave	Inspect test‑bench activity
Synthesis	Synopsys DC / Vivado	Convert RTL to gate‑level net‑list
Timing & Area	Synopsys PT / Vivado	Post‑synth reports
Design information & block diagram
A priority encoder asserts a binary code that corresponds to the highest‑order ‘1’ on its data inputs. The 4‑bit version maps inputs D3 … D0 onto a 2‑bit code Y[1:0] and a Valid flag.
           +---------------------------+
  D3 ----->|                           |---- Y1
  D2 ----->|    4-Bit Priority Encoder |---- Y0
  D1 ----->|                           |---- Valid
  D0 ----->|                           |
           +---------------------------+
At gate level:
 
Truth table
D3  D2  D1  D0  Valid  Y1  Y0
0   0   0   0   0      X   X
0   0   0   1   1      0   0
0   0   1   0   1      0   1
0   1   X   X   1      1   0
1   X   X   X   1      1   1

X = don’t‑care.
Creating a workspace
$ mkdir priority_encoder_4b
$ cd priority_encoder_4b

Tip: keep RTL (src/) and TB (tb/) in separate sub‑directories for clean library mappings.
Source code (Verilog)
// -------------------------
// 4-Bit Priority Encoder
// -------------------------
module prio_enc4 (
    input  logic [3:0] d,  // D3 = MSB (highest priority)
    output logic [1:0] y,  // Encoded result
    output logic       v   // Valid flag
);
    always_comb begin
        unique casez (d)      // ? = don’t‑care (Verilog‑2001)
            4'b1???: begin y = 2'b11; v = 1; end
            4'b01??: begin y = 2'b10; v = 1; end
            4'b001?: begin y = 2'b01; v = 1; end
            4'b0001: begin y = 2'b00; v = 1; end
            default : begin y = 2'bxx; v = 0; end
        endcase
    end
endmodule
Test‑bench highlights
* Drives all 16 input combinations in ascending order.
* Uses $fatal on any mis‑match between DUT and reference model for self‑checking.
* Dumps VCD/FST for waveform inspection.
initial begin
    for (int i = 0; i < 16; i++) begin
        d = i[3:0];
        #5;
        assert({v,y} == golden(d)) else
            $fatal("Mismatch: d=%b exp=%b%b got=%b%b", d, v_ref, y_ref, v, y);
    end
    $display("SIM PASS");
    $finish;
end

Launching the simulation tool
1. Compile both RTL and TB into worklib.
2. Elaborate top module tb_prio_enc4.
3. Simulate, then open wave viewer and verify that Y follows the truth‑table, and Valid is high only when any input bit is 1.
(Optional) Synthesis results
Metric	Typical value*	Notes
LUTs / Gates	8 LUTs (Artix‑7)	4‑input case statement maps to simple LUTs
Fmax	>600 MHz (ASIC 28 nm)	No sequential elements ⇒ timing limited by routing
Area	27 µm²	For standard‑cell library example

* Replace with actual numbers from your run.
Result
The 4‑Bit Priority Encoder design functionally simulated with zero assertion failures, meeting synthesis timing with minimal area. All project objectives were achieved.
References
* Digital Design – M. M. Mano
* Cadence NCLaunch user guide
* Xilinx UG901 – Vivado Design Suite User Guide: Synthesis

How to use this README
1. Drop it into README.md in your GitHub repo.
2. Add screenshots of your waveform (docs/img/), block diagram or synthesis reports.
3. Push & enjoy a professional‑looking project page!
