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
    assign inled = inled;
	assign deled = deled;
	assign led = led;
	assign clock_1hz = clock_1hz;

    // instantiate the DUT
    pwm pwm(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
