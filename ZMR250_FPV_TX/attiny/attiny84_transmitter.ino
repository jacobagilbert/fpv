/*
 *  BOSCAM TX5823-based 5.8Ghz 200mW FPV transmitter
 *
 *  Author: J. A. Gilbert
 *  Date:   April 2015
 *  Info:   https://github.com/mrjacobagilbert/fpv
 *  
 *  Description:
 *    This code is designed for the ATTiny44/84, with optimization it may run on a 24. It
 *    will display the current band/channel on startup, set the frequency and wait for
 *    user input. The operator can change frequency with a long button press and a quick
 *    release after the LED turns on.
 *
 *
 *  Programming Information:
 *    Using ArduinoISP sketch, connect the following pins. 3.3k resistors should be used
 *    if the output is higher voltage than the input (eg: on RST/SCK/MOSI if Arduino is +5V
 *    and ATTiny is +3.3v, MISO does not need one).
 *
 *       ARDUINO              ATTINY
 *         D10 ----------->> RST  (4)
 *         D11 ----------->> MOSI (7)
 *         D12 <<----------- MISO (8)
 *         D13 ----------->> SCK  (9)
 *         GND ------------- GND (14)
 *
 *  This sketch is designed to run with an 8MHz oscillator. Burn appropriate bootloader.
 */
 
#include <EEPROM.h>

static const uint8_t SPI_ENABLE_PIN = 9;        // ATTiny Pin 3
static const uint8_t SPI_CLOCK_PIN = 8;         // ATTiny Pin 5
static const uint8_t SPI_DATA_PIN = 10;         // ATTiny Pin 2
static const uint8_t SWITCH_PIN = 2;            // ATTiny Pin 11
static const uint8_t LED_PIN = 7;               // ATTiny Pin 6
static const uint8_t REMOTE_PIN = 0;            // ATTiny Pin 13

static const uint8_t EEPROM_ADDR_LAST_FREQ = 1;
static const uint8_t NUM_BANDS = 5;

/* These frequencies are for RichWave transmitters - this table is the lower 16 bits - upper 4 bits are 0x4 */
static const uint16_t channelTable[] PROGMEM = {
//   CH 1       CH 2       CH 3       CH 4       CH 5       CH 6       CH 7       CH 8
    0x7981,    0x758D,    0x7199,    0x6DA5,    0x69B1,    0x65BD,    0x6209,    0x5E15,    // Band A
    0x5F9D,    0x6338,    0x6713,    0x6AAE,    0x6E89,    0x7224,    0x75BF,    0x799A,    // Band B
    0x5A21,    0x562D,    0x5239,    0x4E85,    0x7D35,    0x8129,    0x851D,    0x8911,    // Band E
    0x610C,    0x6500,    0x68B4,    0x6CA8,    0x709C,    0x7490,    0x7884,    0x7C38,    // Band F / Airwave
    0x510A,    0x5827,    0x5F84,    0x66A1,    0x6DBE,    0x751B,    0x7C38,    0x8395     // Band R / Raceband
};
const uint16_t rCounter = 0x0190;    // default value, provides 40kHz frequency resolution

/* Frequency mapping for channelTable (values in MHz):
 *   CH 1       CH 2       CH 3       CH 4       CH 5       CH 6       CH 7       CH 8
 *   5865       5845       5825       5805       5785       5765       5745       5725      // Band A
 *   5733       5752       5771       5790       5809       5828       5847       5866      // Band B
 *   5705       5685       5665       5645       5885       5905       5925       5945      // Band E
 *   5740       5760       5780       5800       5820       5840       5860       5880      // Band F / Airwave
 *   5658       5695       5732       5769       5806       5843       5880       5917      // Band R / RaceBand
 */

enum STATE { WAITING, HOLDOFF, SHOW_FREQ, RELEASE_TIMER, BAND_COUNTING, CHANNEL_COUNTING, SET_FREQ } current_state;
uint16_t count;
uint8_t current_freq, previous_val, band, channel;

void setup() {
  
  // set pin directions
  pinMode(SPI_ENABLE_PIN, OUTPUT);
  pinMode(SPI_CLOCK_PIN, OUTPUT);
  pinMode(SPI_DATA_PIN, OUTPUT);
  pinMode(SWITCH_PIN, INPUT_PULLUP);
  pinMode(LED_PIN, OUTPUT);
  pinMode(REMOTE_PIN, INPUT_PULLUP);
  
  // initialize SPI bus
  digitalWrite(SPI_CLOCK_PIN, LOW);
  digitalWrite(SPI_ENABLE_PIN, HIGH);
  
  // LED is OFF by default
  digitalWrite(LED_PIN, LOW);
  
  // give transmitter time to power up
  delay(250);
  
  // set the R counter-divider which does not change
  spi_write(0x00, rCounter);                                 // write R counter-divider (fixed value)
  // read previous channel and set module
  current_freq = EEPROM.read(EEPROM_ADDR_LAST_FREQ) & 0x3f;  // mask by 0b0011.1111 = 0b xx xx B2 B1 . B0 C2 C1 C0
  set_5823_freq(current_freq);
  
  //flash current frequency to user on boot
  flashFreq(current_freq);
  
  current_state = WAITING;
}

void loop() {
  
  // main loop is just a switch statement
  switch (current_state) {
    
//----------------------- WAITING FOR USER INPUT ----------------------------//
    case WAITING:
      if (button_read(10)) {
        current_state = HOLDOFF;
        count = 0;
      }
      break;
      
//----------------------- CHECKING DURATION OF BUTTON PRESS -----------------//
    // must hold button for two seconds
    case HOLDOFF:
      if (count > 200) {
        digitalWrite(LED_PIN, HIGH);
        count = 0;
        current_state = RELEASE_TIMER;
      } else {
        if (!button_read(10)) {
          // if just a quick press, flash the frequency
          if (count < 25) {
            current_state = SHOW_FREQ;
            digitalWrite(LED_PIN, LOW);
          } else {
            current_state = WAITING;
            digitalWrite(LED_PIN, LOW);
          }
        }
      }
      count++;
      break;
      
//----------------------- DISPLAY FREQUENCY FOR SHORT PRESS -----------------//
    case SHOW_FREQ:
      flashFreq(current_freq);
      current_state = WAITING;
      break;
      
//----------------------- CHECKING FOR BUTTON RELEASE -----------------------//
    // must release button within 350 ms of LED going off
    case RELEASE_TIMER:
      if (!button_read(10)) {
        if (count > 35) {
          digitalWrite(LED_PIN, LOW);
          current_state = WAITING;
        } else {
          digitalWrite(LED_PIN, LOW);
          
          // indicate band-setting mode when released
          delay(500);
          blink_led(25,75,5);
          count = 0;
          band = 0;
          previous_val = 0;
          current_state = BAND_COUNTING;
        }
      } else {
        if (count > 30) {
          digitalWrite(LED_PIN, LOW);
        }
      }
      count++;
      break;
      
//----------------------- USER BAND SELECTION -------------------------------//
    case BAND_COUNTING:
      if (button_read(10)) {
        if (previous_val == 0) {
          blink_led(20,0,1);
          count = 0;    // reset the counter if button was pressed
          band++;
          // not all bands are valid, loop back around if too many presses
          if (band > NUM_BANDS) {  
            band -= NUM_BANDS;
            delay(100);
            blink_led(20,0,1);
          }
        }
        previous_val = 1;
      } else {
        previous_val = 0;
        count++;
      }
      // after 2 seconds of no button presses, continue
      if (count >= 200) {
        // if band is still zero, flash error sequence and go back to start
        if (band > 0) {
          // indicate band-setting mode when released
          delay(500);
          blink_led(75,25,5);
          count = 0;
          channel = 0;
          previous_val = 0;
          current_state = CHANNEL_COUNTING;
        } else {
          flashError();  // flash error sequence
          current_state = WAITING;
        }
      }
      break;
      
//----------------------- USER CHANNEL SELECTION ----------------------------//
    case CHANNEL_COUNTING:
      if (button_read(10)) {
        if (previous_val == 0) {
          blink_led(20,0,1);
          count = 0;    // reset the counter if button was pressed
          channel++;
          // only 8 possible channels, reset if too many presses
          if (channel > 8) {
            channel -= 8;
            delay(100);
            blink_led(20,0,1);
          }
        }
        previous_val = 1;
      } else {
        previous_val = 0;
        count++;
      }
      // after 2 seconds of no button presses, continue
      if (count >= 200) {
        // if band is still zero, flash error sequence and go back to start
        if (channel > 0) {
          delay(500);
          current_state = SET_FREQ;
        } else {
          flashError();     // flash error sequence
          current_state = WAITING;
        }
      }
      break;
      
//----------------------- SETTING FREQUENCY ---------------------------------//
    case SET_FREQ:
      current_freq = (band - 1) * 8 + (channel - 1);
      
      // save current freq to EEPROM
      EEPROM.write(EEPROM_ADDR_LAST_FREQ, current_freq);
      
      // set the current frequency of the module
      set_5823_freq(current_freq);
      
      // display the frequency to the user
      flashFreq(current_freq);
      
      current_state = WAITING;
      break;
      
//----------------------- BY DEFAULT, RETURN TO WAITING ---------------------//
    default:
      current_state = WAITING;
      break;
  }
}


/////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////     SUBROUTINES     //////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

/*
 *  read the button applying a very simple software-debounce routine accepts
 *  configurable debounce time, favor unpressed ('1' due to internal pullup)
 */
byte button_read(uint16_t time)
{
  if (digitalRead(SWITCH_PIN) == 0) {
    delay(time);
    if (digitalRead(SWITCH_PIN) == 0) {
      return 1;
    }
  } else {
    delay(time);
  }
  return 0;
}


/*
 *  blink the LED with definable duty cycle and number of times
 */
void blink_led(uint16_t ms_on, uint16_t ms_off, uint16_t n_times)
{
  uint16_t ii;
  
  for (ii = n_times; ii > 0; ii--) {
    digitalWrite(LED_PIN, HIGH);
    delay(ms_on);
    digitalWrite(LED_PIN, LOW);
    delay(ms_off);
  }  
}


/*
 *  show the current frequency by blinking the LED
 */
void flashFreq(uint8_t freq)
{
  //blink_led(750,0,1);                        // long blink
  delay(750);                                // delay
  blink_led(100,200,((freq >> 3) + 1));      // band is bits 3-5
  delay(1000);                               // delay
  blink_led(100,200,((freq & 0x07) + 1));    // channel is bits 0-2
  delay(750);                                // delay
  //blink_led(750,0,1);                        // long blink
}


/*
 * display predefined LED error sequence - 16 fast blinks
 */
void flashError(void)
{
  blink_led(20, 30, 16);  // LED error sequence
}


/*
 *  update the frequency registers on TX5823
 */
void set_5823_freq(uint8_t freq)
{
  uint8_t i;
  uint32_t channelData;
  
  // if the band value is illegal, flash error sequence only
  if (freq >= (NUM_BANDS*8)) {
    flashError();  // flash LED error sequence
  } else {
    // read in the channel information from the table, and add 0x00 04 00 00 to it
    channelData = (pgm_read_word_near(channelTable + freq)) + 0x00040000;
    
    // Do we actually need to set register 0x00??
    //spi_write(0x00, rCounter);      // write R counter-divider (fixed value)
    spi_write(0x01, channelData);   // write N and A counter-dividers (from channel table)
  }
}


/*
 * execute a complete SPI write operation
 */
void spi_write(uint8_t addr, uint32_t data)
{
  uint8_t i;
  uint32_t output;
  
  //              FIRST  -  -  -  -  -  -  -  -  -  -  -  LAST
  // Data Format: A0  A1  A2  A3  R/W  D0  D1  D2 ... D18  D19
  output = ((data << 5) | 0x10) + (addr & 0x0f);
  
  // start SPI transaction
  digitalWrite(SPI_CLOCK_PIN, LOW);
  digitalWrite(SPI_ENABLE_PIN, LOW);

  // clock out data LSB first
  for (i = 25; i > 0; i--) {
    if (output & 0x01) {
      digitalWrite(SPI_DATA_PIN, HIGH);  // output 1
    } else {
      digitalWrite(SPI_DATA_PIN, LOW);   // output 0
    }
    digitalWrite(SPI_CLOCK_PIN, HIGH);   // data latched by 5823 here
    digitalWrite(SPI_CLOCK_PIN, LOW);    // clock ends low
    output >>= 1;                        // shift output data
  }
  
  // terminate SPI transaction and set data low
  digitalWrite(SPI_ENABLE_PIN, HIGH);
  digitalWrite(SPI_DATA_PIN, LOW);
}
