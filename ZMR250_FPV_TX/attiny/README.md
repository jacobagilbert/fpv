# ATTiny Related Documents

The ATTiny84 firmware was written in Arduino because it's quick and easy, and I want the project to be approachable by non-professionals. I'll try to upload a hex file at some point though for those who are not Arduino inclined. Programming instructions are based on the [work by HighLowTech](http://highlowtech.org/?p=1695) and are pretty straightforward. A dedicated programming header is located on the board, but that might be removed in future versions since firmware should not need to change very often.

I targeted an ATTiny84 because it fit and they are still relatively inexpensive, and it let me be lazy in programming and layout, and it does not require dual-purposing pins. The sketch will compile for an ATTiny44, and shouldn't be too hard to get into an ATTiny24. Currently the Arduino IDE reports the program size as 2,156 bytes (26% of the ATTiny84).

### Files:

- attiny84_transmitter.ino	Arduino 1.6 sketch for ATTiny84
- attiny_arduino_1.6.zip	ATTiny support for Arduino 1.6
- TX_Channel_Calculator.xlsx	Excel spreadsheet for calculating register values

### Programming the ATTiny

It is important to note that the ATTiny runs from the same 3.3V supply as the video transmitter, and the VTX will be powered anytime the ATTiny is! Be sure to connect an antenna, or terminate the SMA connector so the RFIC output stage is not damaged by reflected power. The board has a dedicated programming port and current-limiting resistors on MOSI and SCK lines to allow for programming from a 5V arduino device. I don't have a dedicated Atmel programmer, so this is what I do.

This is what I do to program: connect RST, MOSI, MISO, SCK, and GND from connector X3 to pins 10-13 + GND on an Arduino board with the Arduino ISP sketch loaded. Terminate the antenna port and then apply power to VBATT on connector X2. Then hit the upload button on the Arduino IDE. The first time you program the chip, before you program, you need to make sure "internal 8MHz" is selected for clock source and burn the bootloader. The link above covers this in much better detail.

### Register Settings

The RTC6705 RFIC has two 20-bit registers that control the frequency synthesizer, 0x00 and 0x01. The 0x00 (Synthesizer Register A) register contains the R-counter divider in the low 15 bits. The 0x01 register contains the N-counter divider in the upper 13 bits and the A-counter divider in the lower 7 bits.

The default R-counter divider value (0x190 = 400d) provides for 40kHz tuning resolution, which is more than sufficient, so it is not changed. The values for the 0x01 register for each channel are pre-calculated and stored in PROGMEM. These values were derived from the equations in the TX_Channel_Calculator spreadsheet.

At initial turn-on, the registers are set to the last stored frequency which is written to onboard EEPROM after every successful channel change. This initial frequency setting procedure is performed several times at startup after varying delay. This is to reduce the amount of interference the default settings might cause to other FPV fliers in the area. 100ms delay proved too short to reliably tune the TX chip, so we attempt to tune it to the last known frequency after 100ms, 300ms, and 500ms - if it's stupid and it works it's not stupid :).
