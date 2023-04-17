`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input clk,
    input btn_incrPWM,
	input btn_decrPWM,
    output inled,
	output deled,
	output led,
	output clock_1hz
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {5'b0, btn_decrPWM, btn_incrPWM, clk};
    wire [7:0] outputs;
    assign inled = outputs[0];
    assign deled = outputs[1];
    assign led = outputs[2];
    assign clock_1hz = outputs[3];

    // instantiate the DUT
    pwm dut(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
