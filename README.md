![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# PWM circuit for LED dimming for Tiny Tapeout

# Implementation details

This Verilog module generates Pulse Width Modulation (PWM) signals using an input clock with a frequency of 12500Hz. The module includes two buttons for controlling the duty cycle of the PWM signal: one button for increasing the duty cycle and another for decreasing it. To prevent false triggering, the module also has debounce logic implemented for the buttons.

The module produces four output signals: inled, deled, led, and clock_1hz. The inled and deled signals are used to indicate when the duty cycle is at its maximum and minimum values, respectively. The led signal generates the actual PWM signal with a duty cycle controlled by the two buttons. Finally, the clock_1hz signal is a 1Hz clock signal generated from the input clock using a divisor of 12500.

The PWM signal is generated using an always block triggered by the input clock. The duty cycle is updated when the corresponding button is pressed, and the count for the PWM period is incremented at each clock cycle. The duty cycle value is used to control the led signal, which generates the PWM signal by toggling between 1 and 0 based on the count value. When the count reaches the maximum value, the PWM period is reset to zero.

The debounce logic for the buttons is implemented using two separate always blocks triggered by the input clock. The button count is incremented when the button is pressed, and it is reset to zero when the button is not pressed. Once the button count reaches a certain value, the corresponding debounced button signal is set to 1 to indicate a valid button press.

Overall, this Verilog module provides a simple and efficient way to generate PWM signals with adjustable duty cycles using buttons and debounce logic.

The verilog code was tested in a DE1-soc FPGA development board and found to be functional. The next step is to see if it works in the ASIC implementation.

# GDS Viewer

https://gds-viewer.tinytapeout.com/?model=https%3A%2F%2Fioannisin.github.io%2Ftt03-verilog-pwm%2F%2Ftinytapeout.gds.gltf

# Original README.md follows

# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip!

Go to https://tinytapeout.com for instructions!

## How to change the Wokwi project

Edit the [info.yaml](info.yaml) and change the wokwi_id to match your project.

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

* [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
* [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## How does it work?

When you edit the info.yaml to choose a different ID, the [GitHub Action](.github/workflows/gds.yaml) will fetch the digital netlist of your design from Wokwi.

After that, the action uses the open source ASIC tool called [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/) to build the files needed to fabricate an ASIC.

## Resources

* [FAQ](https://tinytapeout.com/faq/)
* [Digital design lessons](https://tinytapeout.com/digital_design/)
* [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
* [Join the community](https://discord.gg/rPK2nSjxy8)

## What next?

* Share your GDS on Twitter, tag it [#tinytapeout](https://twitter.com/hashtag/tinytapeout?src=hashtag_click) and [link me](https://twitter.com/matthewvenn)!


