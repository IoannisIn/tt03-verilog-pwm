`default_nettype none
`timescale 1ns/1ps

module tb (
    input clk,
    input btn_incrPWM,
    input btn_decrPWM,
    output inled,
    output deled,
    output led,
    output clock_1hz
    );

    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    wire [7:0] inputs = {5'b0, btn_decrPWM, btn_incrPWM, clk};
    wire [7:0] outputs = {4'b0, inled, deled, led, clock_1hz};

    // instantiate the DUT
    pwm dut(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
