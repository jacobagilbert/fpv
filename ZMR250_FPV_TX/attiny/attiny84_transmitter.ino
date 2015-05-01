// code for transmitter
#include <EEPROM.h>

//port manipulation macros
#define CLR(x,y) (x&=(~(1<<y))) //CLR(PORTB,0) sets pin10 low
#define SET(x,y) (x|=(1<<y))	//SET(PORTB,0) sets pin10 high
//using port manipulations cuts time taken in setting pins by 96%

static const uint8_t SPI_ENABLE_PIN = 9;//PB1
static const uint8_t SPI_CLOCK_PIN = 8;	//PB2
static const uint8_t SPI_DATA_PIN = 10;	//PB0
static const uint8_t SWITCH_PIN = 2; 	//PA2
static const uint8_t LED_PIN = 7;	 	//PA7
static const uint8_t REMOTE_PIN = 0; 	//PA0

static const uint8_t EEPROM_ADDR_LAST_FREQ = 0;
static const uint8_t NUM_BANDS = 5;

/* These frequencies are for RichWave transmitters - this table is the lower 16 bits - upper byte is 0x04 */
const uint16_t channelTable[] PROGMEM = {
  0x7981,    0x758D,    0x7199,    0x6DA5,    0x69B1,    0x65BD,    0x6209,    0x5E15,    // Band A
  0x5F9D,    0x6338,    0x6713,    0x6AAE,    0x6E89,    0x7224,    0x75BF,    0x799A,    // Band B
  0x5A21,    0x562D,    0x5239,    0x4E85,    0x7D35,    0x8129,    0x851D,    0x8911,    // Band E
  0x610C,    0x6500,    0x68B4,    0x6CA8,    0x709C,    0x7490,    0x7884,    0x7C38,    // Band F / Airwave
  0x510A,    0x5827,    0x5F84,    0x66A1,    0x6DBE,    0x751B,    0x7C38,    0x8395     // Band R / IRC Raceband
};

enum STATE { WAITING, HOLDOFF, SHOW_FREQ, RELEASE_TIMER, BAND_COUNTING, CHANNEL_SET, CHANNEL_COUNTING, SET_FREQ };
STATE current_state;
uint8_t current_freq;

uint16_t count;
uint8_t previous_val, band, channel;

void setup() {

  // set pin directions
  pinModeFast(SPI_ENABLE_PIN, OUTPUT);
  pinModeFast(SPI_CLOCK_PIN, OUTPUT);
  pinModeFast(SPI_DATA_PIN, OUTPUT);
  pinModeFast(SWITCH_PIN, INPUT_PULLUP);
  pinModeFast(LED_PIN, OUTPUT);
  pinModeFast(REMOTE_PIN, INPUT_PULLUP);

  CLR(PORTB,2); //CLK low
  CLR(PORTB,1); //EN low
  //digitalWrite(SPI_CLOCK_PIN, LOW);
  //digitalWrite(SPI_ENABLE_PIN, LOW);

  // give transmitter time to power up
  delay(1000);

  // read previous channel and set module
  current_freq = EEPROM.read(EEPROM_ADDR_LAST_FREQ) & 0x3f;  // mask by 0b0011.1111 = 0b xx xx B2 B1 . B0 C2 C1 C0
  set_5823_freq(current_freq);

  //flash current frequency to user on boot
  flash_freq(current_freq);

  current_state = WAITING;
}

void loop() {

  // we don't need to do ANYTHING unless input changes

  switch (current_state) {

    case WAITING:
      if (switch_read(10)) {
        current_state = HOLDOFF;
        count = 0;
      }
      break;

    // must hold button for two seconds
    case HOLDOFF:
      if (count > 200) {
		SET(PORTA,7);
        //digitalWrite(LED_PIN, HIGH);
        count = 0;
        current_state = RELEASE_TIMER;
      } else {
        if (!switch_read(10)) {
          // if just a quick press, flash the frequency
          if (count < 25) {
            current_state = SHOW_FREQ;
			CLR(PORTA,7);
            //digitalWrite(LED_PIN, LOW);
          } else {
            current_state = WAITING;
			CLR(PORTA,7);
            //digitalWrite(LED_PIN, LOW);
          }
        }
      }
      count++;
      break;

    case SHOW_FREQ:
      flash_freq(current_freq);
      current_state = WAITING;
      break;

    // must release button within 350 ms of LED going off
    case RELEASE_TIMER:
      if (count > 35) {
		CLR(PORTA,7);
        //digitalWrite(LED_PIN, LOW);
        current_state = WAITING;
      } else {
        if (!switch_read(10)) {
          CLR(PORTA,7);
		  //digitalWrite(LED_PIN, LOW);

          // indicate band-setting mode when released
          delay(500);
          blink_led(25,75,5);
          count = 0;
          band = 0;
          previous_val = 0;
          current_state = BAND_COUNTING;
        }
      }
      count++;
      break;

    case BAND_COUNTING:
      if (switch_read(10)) {
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
          blink_led(25, 25, 16);  // ERROR
          current_state = WAITING;
        }
      }
      break;

    case CHANNEL_SET:
      if (!switch_read(10)) {
        // indicate band-setting mode when released
        delay(100);
        blink_led(75,25,5);
        count = 0;
        channel = 0;
        current_state = CHANNEL_COUNTING;
        previous_val = 0;
      }
      break;

    case CHANNEL_COUNTING:
      if (switch_read(10)) {
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
          blink_led(25, 25, 16);  // ERROR
          current_state = WAITING;
        }
      }
      break;

    case SET_FREQ:
      current_freq = (band - 1) * 8 + (channel - 1);

      // save current freq to EEPROM
      EEPROM.write(EEPROM_ADDR_LAST_FREQ, current_freq);

      // set the current frequency of the module
      set_5823_freq(current_freq);

      // display the frequency to the user
      delay(1000);
      blink_led(500,0,1);
      delay(1000);
      flash_freq(current_freq);
      delay(1000);
      blink_led(500,0,1);

      current_state = WAITING;
      break;

    default:
      current_state = WAITING;
      break;
  }

}


/////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////     SUBROUTINES     //////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

byte switch_read(uint16_t time)
// accepts configurable debounce time, favor unpressed ('1' due to internal pullup)
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


void flash_freq(uint8_t freq)
{
  uint8_t band, channel;

  band = (freq >> 3) + 1;         // band is the band/8 + 1
  channel = (freq & 0x07) + 1;   // channel is lowest 3 bytes + 1

  blink_led(100,200,band);
  delay(1000);
  blink_led(100,200,channel);
}


void blink_led(uint16_t ms_on, uint16_t ms_off, uint16_t n_times)
{
  uint16_t ii;

  for (ii=0; ii<n_times; ii++) {
    SET(PORTA,7);
	//digitalWrite(LED_PIN, HIGH);
    delay(ms_on);
	CLR(PORTA,7);
    //digitalWrite(LED_PIN, LOW);
    delay(ms_off);
  }
}


void set_5823_freq(uint8_t freq)
{
  uint8_t i;
  uint32_t channelData, rDividerReg;

  // from datasheet, set R-divider to 400d
  rDividerReg=0x190;

  if ((((freq >> 3) & 0x07) + 1) > NUM_BANDS) {
    blink_led(25, 25, 16);  // ERROR
    return;
  }

  // read in the channel information from the table, and add 0x00 04 00 00 to it
  channelData = (pgm_read_word_near(channelTable + freq)) + 0x00040000;

  SERIAL_ENABLE_LOW();
  SERIAL_ENABLE_HIGH();
  SERIAL_ENABLE_LOW();

  SERIAL_SENDBIT0();  // addr = 0x00
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();

  SERIAL_SENDBIT1();  // Write

  for (i = 20; i > 0; i--) {
    if (rDividerReg & 0x01) {
      SERIAL_SENDBIT1();
    } else {
      SERIAL_SENDBIT0();
    }
    rDividerReg >>= 1;
  }

  SERIAL_ENABLE_HIGH();
  SERIAL_ENABLE_LOW();

  SERIAL_SENDBIT1();  // addr = 0x01
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();

  SERIAL_SENDBIT1();  // Write

  for (i = 20; i > 0; i--) {
    if (channelData & 0x01) {
      SERIAL_SENDBIT1();
    } else {
      SERIAL_SENDBIT0();
    }
    channelData >>= 1;
  }

  SERIAL_ENABLE_HIGH();
  CLR(PORTB,1);
  CLR(PORTB,2);
  CLR(PORTB,0);
  /*
  digitalWrite(SPI_ENABLE_PIN, LOW);
  digitalWrite(SPI_CLOCK_PIN, LOW);
  digitalWrite(SPI_DATA_PIN, LOW);
  */
}


void SERIAL_SENDBIT1()
{
  CLR(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);

  SET(PORTB,0); //digitalWrite(SPI_DATA_PIN, HIGH);
  delayMicroseconds(1);
  SET(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, HIGH);
  delayMicroseconds(1);

  CLR(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_SENDBIT0()
{
  CLR(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);

  CLR(PORTB,0); //digitalWrite(SPI_DATA_PIN, LOW);
  delayMicroseconds(1);
  SET(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, HIGH);
  delayMicroseconds(1);
  
  CLR(PORTB,2); //digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_ENABLE_LOW()
{
  delayMicroseconds(1);
  CLR(PORTB,1); //digitalWrite(SPI_ENABLE_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_ENABLE_HIGH()
{
  delayMicroseconds(1);
  SET(PORTB,1); //digitalWrite(SPI_ENABLE_PIN, HIGH);
  delayMicroseconds(1);
}
