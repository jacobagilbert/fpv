# ATTiny Related Documents

The ATTiny84 firmware was written in Arduino because it's quick and easy. I'll try to upload a hex file at some point. Programming instructions are based on the [work by HighLowTech](http://highlowtech.org/?p=1695) and are pretty straightforward. A dedicated programming header is located on the board, but that might be removed in future versions since firmware should not need to change very often.

### Files:

- attiny84_transmitter.ino	Arduino sketch for ATTiny84
- attiny_arduino_1.6.zip	ATTiny support for Arduino 1.6

### Programming the ATTiny

It is important to note that the ATTiny runs from the same 3.3V supply as the video transmitter, and the VTX will be powered anytime the ATTiny is! Be sure to connect an antenna, or terminate the SMA connector so it is not damaged. The board has a dedicated programming port and current-limiting resistors on MOSI and SCK lines to allow for programming from a 5V arduino device. I don't have a dedicated Atmel programmer, so this is what I do.
