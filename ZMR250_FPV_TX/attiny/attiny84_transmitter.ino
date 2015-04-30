// code for transmitter
#include <EEPROM.h>

static const uint8_t SPI_ENABLE_PIN = 9;
static const uint8_t SPI_CLOCK_PIN = 8;
static const uint8_t SPI_DATA_PIN = 10;
static const uint8_t SWITCH_PIN = 2;
static const uint8_t LED_PIN = 7;
static const uint8_t REMOTE_PIN = 0;

static const uint8_t EEPROM_ADDR_LAST_FREQ = 0;

const uint16_t channelTable[] PROGMEM = {
  // Channel 1 - 8
  0x2A05,    0x299B,    0x2991,    0x2987,    0x291D,    0x2913,    0x2909,    0x289F,    // Band A
  0x2903,    0x290C,    0x2916,    0x291F,    0x2989,    0x2992,    0x299C,    0x2A05,    // Band B
  0x2895,    0x288B,    0x2881,    0x2817,    0x2A0F,    0x2A19,    0x2A83,    0x2A8D,    // Band E
  0x2906,    0x2910,    0x291A,    0x2984,    0x298E,    0x2998,    0x2A02,    0x2A0C,    // Band F / Airwave
  0x281D,    0x288F,    0x2902,    0x2914,    0x2978,    0x2999,    0x2A0C,    0x2A1E     // Band R / IRC Raceband
};

enum STATE { WAITING, HOLDOFF, SHOW_FREQ, RELEASE_TIMER, BAND_COUNTING, CHANNEL_SET, CHANNEL_COUNTING, SET_FREQ };
STATE current_state;
uint16_t current_freq;

uint16_t count;
uint8_t previous_val, band, channel;

void setup() {
  
  // set pin directions
  pinMode(SPI_ENABLE_PIN, OUTPUT);
  pinMode(SPI_CLOCK_PIN, OUTPUT);
  pinMode(SPI_DATA_PIN, OUTPUT);
  pinMode(SWITCH_PIN, INPUT_PULLUP);
  pinMode(LED_PIN, OUTPUT);
  pinMode(REMOTE_PIN, INPUT_PULLUP);
  
  // give transmitter time to power up
  delay(100);
  
  // read previous channel and set module
  current_freq = EEPROM.read(EEPROM_ADDR_LAST_FREQ) & 0x3f;  // mask by 0b0011.1111 = 0b xx xx B2 B1 . B0 C2 C1 C0
  set_channel_module(current_freq);
  
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
        digitalWrite(LED_PIN, HIGH);
        count = 0;
        current_state = RELEASE_TIMER;
      } else {
        if (!switch_read(10)) {
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
    
    case SHOW_FREQ:
      flash_freq(current_freq);
      current_state = WAITING;
      break;
    
    // must release button within 350 ms of LED going off
    case RELEASE_TIMER:
      if (count > 35) {
        digitalWrite(LED_PIN, LOW);
        current_state = WAITING;
      } else {
        if (!switch_read(10)) {
          digitalWrite(LED_PIN, LOW);
          
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
          // only 5 possible bands, reset if too many presses
          if (band > 5) {
            band -= 5;
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
          blink_led(25, 25, 10);
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
          //blink_led(100, 100, channel);
          delay(500);
          current_state = SET_FREQ;
        } else {
          blink_led(25, 25, 10);
          current_state = WAITING;
        }
      }
      break;
    
    case SET_FREQ:
      current_freq = (band - 1) * 8 + (channel - 1);
      
      // save current freq to EEPROM
      EEPROM.write(EEPROM_ADDR_LAST_FREQ, current_freq);
      
      // set the current frequency of the module
      set_channel_module(current_freq);
      
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
//accepts configurable debounce time, favor unpressed ('1' due to internal pullup)
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
    digitalWrite(LED_PIN, HIGH);
    delay(ms_on);
    digitalWrite(LED_PIN, LOW);
    delay(ms_off);
  }  
}


void set_channel_module(uint8_t channel)
{
  uint8_t i;
  uint16_t channelData;

  //channelData = pgm_read_word(&channelTable[channel]);
  //channelData = channelTable[channel];
  channelData = pgm_read_word_near(channelTable + channel);

  // WHY DO WE EXECUTE A READ BEFORE THE WRITE??
  // bit bash out 25 bits of data
  // Order: A0-3, !R/W, D0-D19
  // A0=0, A1=0, A2=0, A3=1, RW=0, D0-19=0
  SERIAL_ENABLE_HIGH();
  delayMicroseconds(1);  
  //delay(2);
  SERIAL_ENABLE_LOW();

  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT1();

  SERIAL_SENDBIT0();

  // remaining zeros
  for (i = 20; i > 0; i--)
    SERIAL_SENDBIT0();

  // Clock the data in
  SERIAL_ENABLE_HIGH();
  //delay(2);
  delayMicroseconds(1);  
  SERIAL_ENABLE_LOW();

  // Second is the channel data from the lookup table
  // 20 bytes of register data are sent
  // register address = 0x1, write, data0-15=channelData data15-19=0x0
  SERIAL_ENABLE_HIGH();
  SERIAL_ENABLE_LOW();

  // Register 0x1
  SERIAL_SENDBIT1();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();
  SERIAL_SENDBIT0();

  // Write to register
  SERIAL_SENDBIT1();

  // D0-D19
  //   note: loop runs backwards as more efficent on AVR
  for (i = 20; i > 0; i--)
  {
    // Is bit high or low?
    if (channelData & 0x1)
    {
      SERIAL_SENDBIT1();
    }
    else
    {
      SERIAL_SENDBIT0();
    }

    // Shift bits along to check the next one
    channelData >>= 1;
  }

  // Finished clocking data in
  SERIAL_ENABLE_HIGH();
  delayMicroseconds(1);
  //delay(2);

  digitalWrite(SPI_ENABLE_PIN, LOW);
  digitalWrite(SPI_CLOCK_PIN, LOW);
  digitalWrite(SPI_DATA_PIN, LOW);
}


void SERIAL_SENDBIT1()
{
  digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);

  digitalWrite(SPI_DATA_PIN, HIGH);
  delayMicroseconds(1);
  digitalWrite(SPI_CLOCK_PIN, HIGH);
  delayMicroseconds(1);

  digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_SENDBIT0()
{
  digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);

  digitalWrite(SPI_DATA_PIN, LOW);
  delayMicroseconds(1);
  digitalWrite(SPI_CLOCK_PIN, HIGH);
  delayMicroseconds(1);

  digitalWrite(SPI_CLOCK_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_ENABLE_LOW()
{
  delayMicroseconds(1);
  digitalWrite(SPI_ENABLE_PIN, LOW);
  delayMicroseconds(1);
}


void SERIAL_ENABLE_HIGH()
{
  delayMicroseconds(1);
  digitalWrite(SPI_ENABLE_PIN, HIGH);
  delayMicroseconds(1);
}
