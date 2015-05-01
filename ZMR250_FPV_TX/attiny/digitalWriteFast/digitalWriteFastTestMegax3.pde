#include <digitalWriteFast.h>


void setup(void) {

  Serial.begin(38400);
  Serial.flush(); 
  long baseMillis=millis();
  int i=30000,x;
  while (i--) {
    pinModeFast(13,OUTPUT);
    digitalWriteFast(13,HIGH);
    pinModeFast(13,INPUT);
    x = digitalReadFast(13);      //<==== error: expected primary-expression before 'if'
  }
  long bench = millis()-baseMillis;
  Serial.print("fast version of benchmark:");
  Serial.println((int)bench);
  long baseMillis2=millis();
  i=30000;
  while (i--) {
    pinMode(13,OUTPUT);
    digitalWrite(13,LOW);
    pinMode(13,INPUT);
    x = digitalRead(13);
  }
  bench = millis()-baseMillis;
  Serial.print("old version of benchmark:");
  Serial.println((int)bench);

}

void error (int a,int b,int c) {
  Serial.print("error #");
  Serial.print(c);
  Serial.print(" pin ");
  Serial.print( a);
  Serial.print(" --> pin ");
  Serial.println( b);
}
void loop (void){

  byte i,j,q;

//Huge section of code generated automatically to test both set of fast commands; the idea is that you put resistors in the 1K-10K range between sets of pins to be tested
//a 1/4 watt resistor fits fairly well between pins 2 and 5, 3 and 6, 4 and 7, 8 and 11, etc The one between pins 10 and 13 needs to be smaller 220 ohms works for me.
// see http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1236829276
//on the Mega at the far end it will be 20-21,22-23,24-25...52-53 
// we set each to do both input and output, we set the input pullup resistor to the opposite state so we don't fool ourselves reading that. we test both HIGH and LOW.
//serial.print depends on pins 0 and 1 so we can't test those here.  
//=============================the output from progprog.py goes below===================
analogWrite(2,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(2,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(5,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(2,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(3,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(3,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(6,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(3,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(4,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(4,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(7,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(4,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(8,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(8,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(11,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(8,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(9,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(9,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(12,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(9,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(10,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(10,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(13,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(10,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(14,254);
pinModeFast(14,INPUT);
digitalWriteFast(14,HIGH); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,LOW);
delay(1);
if((int) digitalReadFast(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

analogWrite(14,254);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,HIGH);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,LOW);
delay(1);
if((int) digitalReadFast2(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,LOW);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,HIGH);
delay(1);
if((int) digitalReadFast2(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(14,INPUT);
digitalWriteFast(14,LOW); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,HIGH);
delay(1);
if((int) digitalReadFast(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

analogWrite(14,1);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast(15,INPUT);
digitalWriteFast(15,HIGH); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,LOW);
delay(1);
if((int) digitalReadFast(15) != LOW) error(15,18,1);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,HIGH);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,LOW);
delay(1);
if((int) digitalReadFast2(15) != LOW) error(15,18,1);

pinModeFast(18,INPUT);
digitalWriteFast(18,HIGH); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,LOW);
delay(1);
if((int) digitalReadFast(18) != LOW) error(18,15,2);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,HIGH);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,LOW);
delay(1);
if((int) digitalReadFast2(18) != LOW) error(18,15,2);

pinModeFast(18,INPUT);
digitalWriteFast(18,LOW); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,HIGH);
delay(1);
if((int) digitalReadFast(18) != HIGH) error(18,15,3);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,LOW);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,HIGH);
delay(1);
if((int) digitalReadFast2(18) != HIGH) error(18,15,3);

pinModeFast(15,INPUT);
digitalWriteFast(15,LOW); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,HIGH);
delay(1);
if((int) digitalReadFast(15) != HIGH) error(15,18,4);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,LOW);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,HIGH);
delay(1);
if((int) digitalReadFast2(15) != HIGH) error(15,18,4);

pinModeFast(16,INPUT);
digitalWriteFast(16,HIGH); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,LOW);
delay(1);
if((int) digitalReadFast(16) != LOW) error(16,19,1);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,HIGH);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,LOW);
delay(1);
if((int) digitalReadFast2(16) != LOW) error(16,19,1);

pinModeFast(19,INPUT);
digitalWriteFast(19,HIGH); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,LOW);
delay(1);
if((int) digitalReadFast(19) != LOW) error(19,16,2);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,HIGH);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,LOW);
delay(1);
if((int) digitalReadFast2(19) != LOW) error(19,16,2);

pinModeFast(19,INPUT);
digitalWriteFast(19,LOW); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,HIGH);
delay(1);
if((int) digitalReadFast(19) != HIGH) error(19,16,3);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,LOW);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,HIGH);
delay(1);
if((int) digitalReadFast2(19) != HIGH) error(19,16,3);

pinModeFast(16,INPUT);
digitalWriteFast(16,LOW); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,HIGH);
delay(1);
if((int) digitalReadFast(16) != HIGH) error(16,19,4);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,LOW);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,HIGH);
delay(1);
if((int) digitalReadFast2(16) != HIGH) error(16,19,4);


//now do the back row pins on the Mega

pinModeFast(20,INPUT);
digitalWriteFast(20,HIGH); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,LOW);
delay(1);
if((int) digitalReadFast(20) != LOW) error(20,21,1);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,HIGH);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,LOW);
delay(1);
if((int) digitalReadFast2(20) != LOW) error(20,21,1);

pinModeFast(21,INPUT);
digitalWriteFast(21,HIGH); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,LOW);
delay(1);
if((int) digitalReadFast(21) != LOW) error(21,20,2);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,HIGH);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,LOW);
delay(1);
if((int) digitalReadFast2(21) != LOW) error(21,20,2);

pinModeFast(21,INPUT);
digitalWriteFast(21,LOW); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,HIGH);
delay(1);
if((int) digitalReadFast(21) != HIGH) error(21,20,3);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,LOW);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,HIGH);
delay(1);
if((int) digitalReadFast2(21) != HIGH) error(21,20,3);

pinModeFast(20,INPUT);
digitalWriteFast(20,LOW); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,HIGH);
delay(1);
if((int) digitalReadFast(20) != HIGH) error(20,21,4);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,LOW);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,HIGH);
delay(1);
if((int) digitalReadFast2(20) != HIGH) error(20,21,4);

pinModeFast(22,INPUT);
digitalWriteFast(22,HIGH); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,LOW);
delay(1);
if((int) digitalReadFast(22) != LOW) error(22,23,1);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,HIGH);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,LOW);
delay(1);
if((int) digitalReadFast2(22) != LOW) error(22,23,1);

pinModeFast(23,INPUT);
digitalWriteFast(23,HIGH); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,LOW);
delay(1);
if((int) digitalReadFast(23) != LOW) error(23,22,2);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,HIGH);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,LOW);
delay(1);
if((int) digitalReadFast2(23) != LOW) error(23,22,2);

pinModeFast(23,INPUT);
digitalWriteFast(23,LOW); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,HIGH);
delay(1);
if((int) digitalReadFast(23) != HIGH) error(23,22,3);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,LOW);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,HIGH);
delay(1);
if((int) digitalReadFast2(23) != HIGH) error(23,22,3);

pinModeFast(22,INPUT);
digitalWriteFast(22,LOW); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,HIGH);
delay(1);
if((int) digitalReadFast(22) != HIGH) error(22,23,4);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,LOW);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,HIGH);
delay(1);
if((int) digitalReadFast2(22) != HIGH) error(22,23,4);

pinModeFast(24,INPUT);
digitalWriteFast(24,HIGH); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,LOW);
delay(1);
if((int) digitalReadFast(24) != LOW) error(24,25,1);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,HIGH);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,LOW);
delay(1);
if((int) digitalReadFast2(24) != LOW) error(24,25,1);

pinModeFast(25,INPUT);
digitalWriteFast(25,HIGH); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,LOW);
delay(1);
if((int) digitalReadFast(25) != LOW) error(25,24,2);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,HIGH);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,LOW);
delay(1);
if((int) digitalReadFast2(25) != LOW) error(25,24,2);

pinModeFast(25,INPUT);
digitalWriteFast(25,LOW); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,HIGH);
delay(1);
if((int) digitalReadFast(25) != HIGH) error(25,24,3);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,LOW);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,HIGH);
delay(1);
if((int) digitalReadFast2(25) != HIGH) error(25,24,3);

pinModeFast(24,INPUT);
digitalWriteFast(24,LOW); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,HIGH);
delay(1);
if((int) digitalReadFast(24) != HIGH) error(24,25,4);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,LOW);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,HIGH);
delay(1);
if((int) digitalReadFast2(24) != HIGH) error(24,25,4);

pinModeFast(26,INPUT);
digitalWriteFast(26,HIGH); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,LOW);
delay(1);
if((int) digitalReadFast(26) != LOW) error(26,27,1);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,HIGH);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,LOW);
delay(1);
if((int) digitalReadFast2(26) != LOW) error(26,27,1);

pinModeFast(27,INPUT);
digitalWriteFast(27,HIGH); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,LOW);
delay(1);
if((int) digitalReadFast(27) != LOW) error(27,26,2);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,HIGH);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,LOW);
delay(1);
if((int) digitalReadFast2(27) != LOW) error(27,26,2);

pinModeFast(27,INPUT);
digitalWriteFast(27,LOW); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,HIGH);
delay(1);
if((int) digitalReadFast(27) != HIGH) error(27,26,3);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,LOW);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,HIGH);
delay(1);
if((int) digitalReadFast2(27) != HIGH) error(27,26,3);

pinModeFast(26,INPUT);
digitalWriteFast(26,LOW); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,HIGH);
delay(1);
if((int) digitalReadFast(26) != HIGH) error(26,27,4);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,LOW);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,HIGH);
delay(1);
if((int) digitalReadFast2(26) != HIGH) error(26,27,4);

pinModeFast(28,INPUT);
digitalWriteFast(28,HIGH); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,LOW);
delay(1);
if((int) digitalReadFast(28) != LOW) error(28,29,1);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,HIGH);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,LOW);
delay(1);
if((int) digitalReadFast2(28) != LOW) error(28,29,1);

pinModeFast(29,INPUT);
digitalWriteFast(29,HIGH); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,LOW);
delay(1);
if((int) digitalReadFast(29) != LOW) error(29,28,2);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,HIGH);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,LOW);
delay(1);
if((int) digitalReadFast2(29) != LOW) error(29,28,2);

pinModeFast(29,INPUT);
digitalWriteFast(29,LOW); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,HIGH);
delay(1);
if((int) digitalReadFast(29) != HIGH) error(29,28,3);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,LOW);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,HIGH);
delay(1);
if((int) digitalReadFast2(29) != HIGH) error(29,28,3);

pinModeFast(28,INPUT);
digitalWriteFast(28,LOW); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,HIGH);
delay(1);
if((int) digitalReadFast(28) != HIGH) error(28,29,4);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,LOW);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,HIGH);
delay(1);
if((int) digitalReadFast2(28) != HIGH) error(28,29,4);

pinModeFast(30,INPUT);
digitalWriteFast(30,HIGH); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,LOW);
delay(1);
if((int) digitalReadFast(30) != LOW) error(30,31,1);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,HIGH);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,LOW);
delay(1);
if((int) digitalReadFast2(30) != LOW) error(30,31,1);

pinModeFast(31,INPUT);
digitalWriteFast(31,HIGH); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,LOW);
delay(1);
if((int) digitalReadFast(31) != LOW) error(31,30,2);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,HIGH);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,LOW);
delay(1);
if((int) digitalReadFast2(31) != LOW) error(31,30,2);

pinModeFast(31,INPUT);
digitalWriteFast(31,LOW); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,HIGH);
delay(1);
if((int) digitalReadFast(31) != HIGH) error(31,30,3);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,LOW);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,HIGH);
delay(1);
if((int) digitalReadFast2(31) != HIGH) error(31,30,3);

pinModeFast(30,INPUT);
digitalWriteFast(30,LOW); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,HIGH);
delay(1);
if((int) digitalReadFast(30) != HIGH) error(30,31,4);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,LOW);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,HIGH);
delay(1);
if((int) digitalReadFast2(30) != HIGH) error(30,31,4);

pinModeFast(32,INPUT);
digitalWriteFast(32,HIGH); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,LOW);
delay(1);
if((int) digitalReadFast(32) != LOW) error(32,33,1);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,HIGH);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,LOW);
delay(1);
if((int) digitalReadFast2(32) != LOW) error(32,33,1);

pinModeFast(33,INPUT);
digitalWriteFast(33,HIGH); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,LOW);
delay(1);
if((int) digitalReadFast(33) != LOW) error(33,32,2);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,HIGH);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,LOW);
delay(1);
if((int) digitalReadFast2(33) != LOW) error(33,32,2);

pinModeFast(33,INPUT);
digitalWriteFast(33,LOW); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,HIGH);
delay(1);
if((int) digitalReadFast(33) != HIGH) error(33,32,3);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,LOW);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,HIGH);
delay(1);
if((int) digitalReadFast2(33) != HIGH) error(33,32,3);

pinModeFast(32,INPUT);
digitalWriteFast(32,LOW); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,HIGH);
delay(1);
if((int) digitalReadFast(32) != HIGH) error(32,33,4);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,LOW);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,HIGH);
delay(1);
if((int) digitalReadFast2(32) != HIGH) error(32,33,4);

pinModeFast(34,INPUT);
digitalWriteFast(34,HIGH); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,LOW);
delay(1);
if((int) digitalReadFast(34) != LOW) error(34,35,1);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,HIGH);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,LOW);
delay(1);
if((int) digitalReadFast2(34) != LOW) error(34,35,1);

pinModeFast(35,INPUT);
digitalWriteFast(35,HIGH); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,LOW);
delay(1);
if((int) digitalReadFast(35) != LOW) error(35,34,2);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,HIGH);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,LOW);
delay(1);
if((int) digitalReadFast2(35) != LOW) error(35,34,2);

pinModeFast(35,INPUT);
digitalWriteFast(35,LOW); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,HIGH);
delay(1);
if((int) digitalReadFast(35) != HIGH) error(35,34,3);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,LOW);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,HIGH);
delay(1);
if((int) digitalReadFast2(35) != HIGH) error(35,34,3);

pinModeFast(34,INPUT);
digitalWriteFast(34,LOW); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,HIGH);
delay(1);
if((int) digitalReadFast(34) != HIGH) error(34,35,4);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,LOW);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,HIGH);
delay(1);
if((int) digitalReadFast2(34) != HIGH) error(34,35,4);

pinModeFast(36,INPUT);
digitalWriteFast(36,HIGH); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,LOW);
delay(1);
if((int) digitalReadFast(36) != LOW) error(36,37,1);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,HIGH);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,LOW);
delay(1);
if((int) digitalReadFast2(36) != LOW) error(36,37,1);

pinModeFast(37,INPUT);
digitalWriteFast(37,HIGH); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,LOW);
delay(1);
if((int) digitalReadFast(37) != LOW) error(37,36,2);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,HIGH);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,LOW);
delay(1);
if((int) digitalReadFast2(37) != LOW) error(37,36,2);

pinModeFast(37,INPUT);
digitalWriteFast(37,LOW); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,HIGH);
delay(1);
if((int) digitalReadFast(37) != HIGH) error(37,36,3);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,LOW);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,HIGH);
delay(1);
if((int) digitalReadFast2(37) != HIGH) error(37,36,3);

pinModeFast(36,INPUT);
digitalWriteFast(36,LOW); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,HIGH);
delay(1);
if((int) digitalReadFast(36) != HIGH) error(36,37,4);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,LOW);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,HIGH);
delay(1);
if((int) digitalReadFast2(36) != HIGH) error(36,37,4);

pinModeFast(38,INPUT);
digitalWriteFast(38,HIGH); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,LOW);
delay(1);
if((int) digitalReadFast(38) != LOW) error(38,39,1);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,HIGH);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,LOW);
delay(1);
if((int) digitalReadFast2(38) != LOW) error(38,39,1);

pinModeFast(39,INPUT);
digitalWriteFast(39,HIGH); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,LOW);
delay(1);
if((int) digitalReadFast(39) != LOW) error(39,38,2);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,HIGH);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,LOW);
delay(1);
if((int) digitalReadFast2(39) != LOW) error(39,38,2);

pinModeFast(39,INPUT);
digitalWriteFast(39,LOW); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,HIGH);
delay(1);
if((int) digitalReadFast(39) != HIGH) error(39,38,3);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,LOW);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,HIGH);
delay(1);
if((int) digitalReadFast2(39) != HIGH) error(39,38,3);

pinModeFast(38,INPUT);
digitalWriteFast(38,LOW); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,HIGH);
delay(1);
if((int) digitalReadFast(38) != HIGH) error(38,39,4);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,LOW);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,HIGH);
delay(1);
if((int) digitalReadFast2(38) != HIGH) error(38,39,4);

pinModeFast(40,INPUT);
digitalWriteFast(40,HIGH); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,LOW);
delay(1);
if((int) digitalReadFast(40) != LOW) error(40,41,1);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,HIGH);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,LOW);
delay(1);
if((int) digitalReadFast2(40) != LOW) error(40,41,1);

pinModeFast(41,INPUT);
digitalWriteFast(41,HIGH); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,LOW);
delay(1);
if((int) digitalReadFast(41) != LOW) error(41,40,2);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,HIGH);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,LOW);
delay(1);
if((int) digitalReadFast2(41) != LOW) error(41,40,2);

pinModeFast(41,INPUT);
digitalWriteFast(41,LOW); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,HIGH);
delay(1);
if((int) digitalReadFast(41) != HIGH) error(41,40,3);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,LOW);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,HIGH);
delay(1);
if((int) digitalReadFast2(41) != HIGH) error(41,40,3);

pinModeFast(40,INPUT);
digitalWriteFast(40,LOW); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,HIGH);
delay(1);
if((int) digitalReadFast(40) != HIGH) error(40,41,4);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,LOW);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,HIGH);
delay(1);
if((int) digitalReadFast2(40) != HIGH) error(40,41,4);

pinModeFast(42,INPUT);
digitalWriteFast(42,HIGH); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,LOW);
delay(1);
if((int) digitalReadFast(42) != LOW) error(42,43,1);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,HIGH);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,LOW);
delay(1);
if((int) digitalReadFast2(42) != LOW) error(42,43,1);

pinModeFast(43,INPUT);
digitalWriteFast(43,HIGH); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,LOW);
delay(1);
if((int) digitalReadFast(43) != LOW) error(43,42,2);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,HIGH);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,LOW);
delay(1);
if((int) digitalReadFast2(43) != LOW) error(43,42,2);

pinModeFast(43,INPUT);
digitalWriteFast(43,LOW); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,HIGH);
delay(1);
if((int) digitalReadFast(43) != HIGH) error(43,42,3);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,LOW);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,HIGH);
delay(1);
if((int) digitalReadFast2(43) != HIGH) error(43,42,3);

pinModeFast(42,INPUT);
digitalWriteFast(42,LOW); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,HIGH);
delay(1);
if((int) digitalReadFast(42) != HIGH) error(42,43,4);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,LOW);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,HIGH);
delay(1);
if((int) digitalReadFast2(42) != HIGH) error(42,43,4);

analogWrite(44,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(44,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(45,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(44,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(46,254);
pinModeFast(46,INPUT);
digitalWriteFast(46,HIGH); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,LOW);
delay(1);
if((int) digitalReadFast(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

analogWrite(46,254);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,HIGH);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,LOW);
delay(1);
if((int) digitalReadFast2(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,LOW);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,HIGH);
delay(1);
if((int) digitalReadFast2(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(46,INPUT);
digitalWriteFast(46,LOW); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,HIGH);
delay(1);
if((int) digitalReadFast(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

analogWrite(46,1);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast(48,INPUT);
digitalWriteFast(48,HIGH); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,LOW);
delay(1);
if((int) digitalReadFast(48) != LOW) error(48,49,1);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,HIGH);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,LOW);
delay(1);
if((int) digitalReadFast2(48) != LOW) error(48,49,1);

pinModeFast(49,INPUT);
digitalWriteFast(49,HIGH); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,LOW);
delay(1);
if((int) digitalReadFast(49) != LOW) error(49,48,2);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,HIGH);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,LOW);
delay(1);
if((int) digitalReadFast2(49) != LOW) error(49,48,2);

pinModeFast(49,INPUT);
digitalWriteFast(49,LOW); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,HIGH);
delay(1);
if((int) digitalReadFast(49) != HIGH) error(49,48,3);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,LOW);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,HIGH);
delay(1);
if((int) digitalReadFast2(49) != HIGH) error(49,48,3);

pinModeFast(48,INPUT);
digitalWriteFast(48,LOW); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,HIGH);
delay(1);
if((int) digitalReadFast(48) != HIGH) error(48,49,4);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,LOW);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,HIGH);
delay(1);
if((int) digitalReadFast2(48) != HIGH) error(48,49,4);

pinModeFast(50,INPUT);
digitalWriteFast(50,HIGH); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,LOW);
delay(1);
if((int) digitalReadFast(50) != LOW) error(50,51,1);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,HIGH);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,LOW);
delay(1);
if((int) digitalReadFast2(50) != LOW) error(50,51,1);

pinModeFast(51,INPUT);
digitalWriteFast(51,HIGH); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,LOW);
delay(1);
if((int) digitalReadFast(51) != LOW) error(51,50,2);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,HIGH);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,LOW);
delay(1);
if((int) digitalReadFast2(51) != LOW) error(51,50,2);

pinModeFast(51,INPUT);
digitalWriteFast(51,LOW); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,HIGH);
delay(1);
if((int) digitalReadFast(51) != HIGH) error(51,50,3);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,LOW);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,HIGH);
delay(1);
if((int) digitalReadFast2(51) != HIGH) error(51,50,3);

pinModeFast(50,INPUT);
digitalWriteFast(50,LOW); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,HIGH);
delay(1);
if((int) digitalReadFast(50) != HIGH) error(50,51,4);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,LOW);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,HIGH);
delay(1);
if((int) digitalReadFast2(50) != HIGH) error(50,51,4);

pinModeFast(52,INPUT);
digitalWriteFast(52,HIGH); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,LOW);
delay(1);
if((int) digitalReadFast(52) != LOW) error(52,53,1);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,HIGH);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,LOW);
delay(1);
if((int) digitalReadFast2(52) != LOW) error(52,53,1);

pinModeFast(53,INPUT);
digitalWriteFast(53,HIGH); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,LOW);
delay(1);
if((int) digitalReadFast(53) != LOW) error(53,52,2);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,HIGH);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,LOW);
delay(1);
if((int) digitalReadFast2(53) != LOW) error(53,52,2);

pinModeFast(53,INPUT);
digitalWriteFast(53,LOW); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,HIGH);
delay(1);
if((int) digitalReadFast(53) != HIGH) error(53,52,3);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,LOW);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,HIGH);
delay(1);
if((int) digitalReadFast2(53) != HIGH) error(53,52,3);

pinModeFast(52,INPUT);
digitalWriteFast(52,LOW); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,HIGH);
delay(1);
if((int) digitalReadFast(52) != HIGH) error(52,53,4);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,LOW);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,HIGH);
delay(1);
if((int) digitalReadFast2(52) != HIGH) error(52,53,4);

pinModeFast(54,INPUT);
digitalWriteFast(54,HIGH); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,LOW);
delay(1);
if((int) digitalReadFast(54) != LOW) error(54,57,1);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,HIGH);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,LOW);
delay(1);
if((int) digitalReadFast2(54) != LOW) error(54,57,1);

pinModeFast(57,INPUT);
digitalWriteFast(57,HIGH); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,LOW);
delay(1);
if((int) digitalReadFast(57) != LOW) error(57,54,2);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,HIGH);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,LOW);
delay(1);
if((int) digitalReadFast2(57) != LOW) error(57,54,2);

pinModeFast(57,INPUT);
digitalWriteFast(57,LOW); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,HIGH);
delay(1);
if((int) digitalReadFast(57) != HIGH) error(57,54,3);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,LOW);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,HIGH);
delay(1);
if((int) digitalReadFast2(57) != HIGH) error(57,54,3);

pinModeFast(54,INPUT);
digitalWriteFast(54,LOW); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,HIGH);
delay(1);
if((int) digitalReadFast(54) != HIGH) error(54,57,4);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,LOW);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,HIGH);
delay(1);
if((int) digitalReadFast2(54) != HIGH) error(54,57,4);

pinModeFast(55,INPUT);
digitalWriteFast(55,HIGH); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,LOW);
delay(1);
if((int) digitalReadFast(55) != LOW) error(55,58,1);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,HIGH);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,LOW);
delay(1);
if((int) digitalReadFast2(55) != LOW) error(55,58,1);

pinModeFast(58,INPUT);
digitalWriteFast(58,HIGH); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,LOW);
delay(1);
if((int) digitalReadFast(58) != LOW) error(58,55,2);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,HIGH);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,LOW);
delay(1);
if((int) digitalReadFast2(58) != LOW) error(58,55,2);

pinModeFast(58,INPUT);
digitalWriteFast(58,LOW); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,HIGH);
delay(1);
if((int) digitalReadFast(58) != HIGH) error(58,55,3);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,LOW);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,HIGH);
delay(1);
if((int) digitalReadFast2(58) != HIGH) error(58,55,3);

pinModeFast(55,INPUT);
digitalWriteFast(55,LOW); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,HIGH);
delay(1);
if((int) digitalReadFast(55) != HIGH) error(55,58,4);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,LOW);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,HIGH);
delay(1);
if((int) digitalReadFast2(55) != HIGH) error(55,58,4);

pinModeFast(56,INPUT);
digitalWriteFast(56,HIGH); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,LOW);
delay(1);
if((int) digitalReadFast(56) != LOW) error(56,59,1);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,HIGH);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,LOW);
delay(1);
if((int) digitalReadFast2(56) != LOW) error(56,59,1);

pinModeFast(59,INPUT);
digitalWriteFast(59,HIGH); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,LOW);
delay(1);
if((int) digitalReadFast(59) != LOW) error(59,56,2);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,HIGH);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,LOW);
delay(1);
if((int) digitalReadFast2(59) != LOW) error(59,56,2);

pinModeFast(59,INPUT);
digitalWriteFast(59,LOW); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,HIGH);
delay(1);
if((int) digitalReadFast(59) != HIGH) error(59,56,3);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,LOW);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,HIGH);
delay(1);
if((int) digitalReadFast2(59) != HIGH) error(59,56,3);

pinModeFast(56,INPUT);
digitalWriteFast(56,LOW); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,HIGH);
delay(1);
if((int) digitalReadFast(56) != HIGH) error(56,59,4);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,LOW);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,HIGH);
delay(1);
if((int) digitalReadFast2(56) != HIGH) error(56,59,4);

pinModeFast(60,INPUT);
digitalWriteFast(60,HIGH); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,LOW);
delay(1);
if((int) digitalReadFast(60) != LOW) error(60,63,1);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,HIGH);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,LOW);
delay(1);
if((int) digitalReadFast2(60) != LOW) error(60,63,1);

pinModeFast(63,INPUT);
digitalWriteFast(63,HIGH); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,LOW);
delay(1);
if((int) digitalReadFast(63) != LOW) error(63,60,2);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,HIGH);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,LOW);
delay(1);
if((int) digitalReadFast2(63) != LOW) error(63,60,2);

pinModeFast(63,INPUT);
digitalWriteFast(63,LOW); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,HIGH);
delay(1);
if((int) digitalReadFast(63) != HIGH) error(63,60,3);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,LOW);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,HIGH);
delay(1);
if((int) digitalReadFast2(63) != HIGH) error(63,60,3);

pinModeFast(60,INPUT);
digitalWriteFast(60,LOW); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,HIGH);
delay(1);
if((int) digitalReadFast(60) != HIGH) error(60,63,4);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,LOW);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,HIGH);
delay(1);
if((int) digitalReadFast2(60) != HIGH) error(60,63,4);

pinModeFast(61,INPUT);
digitalWriteFast(61,HIGH); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,LOW);
delay(1);
if((int) digitalReadFast(61) != LOW) error(61,64,1);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,HIGH);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,LOW);
delay(1);
if((int) digitalReadFast2(61) != LOW) error(61,64,1);

pinModeFast(64,INPUT);
digitalWriteFast(64,HIGH); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,LOW);
delay(1);
if((int) digitalReadFast(64) != LOW) error(64,61,2);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,HIGH);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,LOW);
delay(1);
if((int) digitalReadFast2(64) != LOW) error(64,61,2);

pinModeFast(64,INPUT);
digitalWriteFast(64,LOW); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,HIGH);
delay(1);
if((int) digitalReadFast(64) != HIGH) error(64,61,3);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,LOW);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,HIGH);
delay(1);
if((int) digitalReadFast2(64) != HIGH) error(64,61,3);

pinModeFast(61,INPUT);
digitalWriteFast(61,LOW); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,HIGH);
delay(1);
if((int) digitalReadFast(61) != HIGH) error(61,64,4);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,LOW);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,HIGH);
delay(1);
if((int) digitalReadFast2(61) != HIGH) error(61,64,4);

pinModeFast(62,INPUT);
digitalWriteFast(62,HIGH); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,LOW);
delay(1);
if((int) digitalReadFast(62) != LOW) error(62,65,1);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,HIGH);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,LOW);
delay(1);
if((int) digitalReadFast2(62) != LOW) error(62,65,1);

pinModeFast(65,INPUT);
digitalWriteFast(65,HIGH); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,LOW);
delay(1);
if((int) digitalReadFast(65) != LOW) error(65,62,2);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,HIGH);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,LOW);
delay(1);
if((int) digitalReadFast2(65) != LOW) error(65,62,2);

pinModeFast(65,INPUT);
digitalWriteFast(65,LOW); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,HIGH);
delay(1);
if((int) digitalReadFast(65) != HIGH) error(65,62,3);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,LOW);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,HIGH);
delay(1);
if((int) digitalReadFast2(65) != HIGH) error(65,62,3);

pinModeFast(62,INPUT);
digitalWriteFast(62,LOW); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,HIGH);
delay(1);
if((int) digitalReadFast(62) != HIGH) error(62,65,4);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,LOW);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,HIGH);
delay(1);
if((int) digitalReadFast2(62) != HIGH) error(62,65,4);

pinModeFast(66,INPUT);
digitalWriteFast(66,HIGH); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,LOW);
delay(1);
if((int) digitalReadFast(66) != LOW) error(66,69,1);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,HIGH);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,LOW);
delay(1);
if((int) digitalReadFast2(66) != LOW) error(66,69,1);

pinModeFast(69,INPUT);
digitalWriteFast(69,HIGH); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,LOW);
delay(1);
if((int) digitalReadFast(69) != LOW) error(69,66,2);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,HIGH);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,LOW);
delay(1);
if((int) digitalReadFast2(69) != LOW) error(69,66,2);

pinModeFast(69,INPUT);
digitalWriteFast(69,LOW); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,HIGH);
delay(1);
if((int) digitalReadFast(69) != HIGH) error(69,66,3);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,LOW);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,HIGH);
delay(1);
if((int) digitalReadFast2(69) != HIGH) error(69,66,3);

pinModeFast(66,INPUT);
digitalWriteFast(66,LOW); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,HIGH);
delay(1);
if((int) digitalReadFast(66) != HIGH) error(66,69,4);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,LOW);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,HIGH);
delay(1);
if((int) digitalReadFast2(66) != HIGH) error(66,69,4);

pinModeFast(67,INPUT);
digitalWriteFast(67,HIGH); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,LOW);
delay(1);
if((int) digitalReadFast(67) != LOW) error(67,68,1);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,HIGH);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,LOW);
delay(1);
if((int) digitalReadFast2(67) != LOW) error(67,68,1);

pinModeFast(68,INPUT);
digitalWriteFast(68,HIGH); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,LOW);
delay(1);
if((int) digitalReadFast(68) != LOW) error(68,67,2);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,HIGH);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,LOW);
delay(1);
if((int) digitalReadFast2(68) != LOW) error(68,67,2);

pinModeFast(68,INPUT);
digitalWriteFast(68,LOW); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,HIGH);
delay(1);
if((int) digitalReadFast(68) != HIGH) error(68,67,3);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,LOW);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,HIGH);
delay(1);
if((int) digitalReadFast2(68) != HIGH) error(68,67,3);

pinModeFast(67,INPUT);
digitalWriteFast(67,LOW); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,HIGH);
delay(1);
if((int) digitalReadFast(67) != HIGH) error(67,68,4);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,LOW);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,HIGH);
delay(1);
if((int) digitalReadFast2(67) != HIGH) error(67,68,4);


//================================the output from progprog.py goes above===============
for(int i=20; i<54;i +=2) {   //now a loop that doesn't know pins numbers--much less extensive; degenerate case.
  pinModeFast2(i,INPUT);
  digitalWriteFast2(i,LOW);
  pinModeFast2(i+1,OUTPUT);
  digitalWriteFast2(i+1,HIGH);
  delay(10);
  q=digitalReadFast2(i);
  if (q != HIGH) error(i,i+1,5);
}
for(int j=0; j< 17; j+=6) {
  for(int i=0; i<3;i++){
      int a = 2+i+j;
      int b = 5+i+j;
      pinModeFast2(a,INPUT);
      digitalWriteFast2(a,LOW);
      pinModeFast2(b,OUTPUT);
      digitalWriteFast2(b,HIGH);
      delay(10);
      q=digitalReadFast2(a);
      if (q != HIGH) error(a,b,6);
}
}
Serial.println("Finished cycle A through pins.");analogWrite(2,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(2,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(5,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(2,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(3,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(3,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(6,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(3,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(4,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(4,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(7,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(4,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(8,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(8,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(11,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(8,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(9,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(9,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(12,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(9,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(10,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(10,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(13,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(10,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(14,254);
pinModeFast(14,INPUT);
digitalWriteFast(14,HIGH); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,LOW);
delay(1);
if((int) digitalReadFast(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

analogWrite(14,254);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,HIGH);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,LOW);
delay(1);
if((int) digitalReadFast2(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,LOW);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,HIGH);
delay(1);
if((int) digitalReadFast2(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(14,INPUT);
digitalWriteFast(14,LOW); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,HIGH);
delay(1);
if((int) digitalReadFast(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

analogWrite(14,1);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast(15,INPUT);
digitalWriteFast(15,HIGH); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,LOW);
delay(1);
if((int) digitalReadFast(15) != LOW) error(15,18,1);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,HIGH);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,LOW);
delay(1);
if((int) digitalReadFast2(15) != LOW) error(15,18,1);

pinModeFast(18,INPUT);
digitalWriteFast(18,HIGH); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,LOW);
delay(1);
if((int) digitalReadFast(18) != LOW) error(18,15,2);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,HIGH);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,LOW);
delay(1);
if((int) digitalReadFast2(18) != LOW) error(18,15,2);

pinModeFast(18,INPUT);
digitalWriteFast(18,LOW); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,HIGH);
delay(1);
if((int) digitalReadFast(18) != HIGH) error(18,15,3);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,LOW);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,HIGH);
delay(1);
if((int) digitalReadFast2(18) != HIGH) error(18,15,3);

pinModeFast(15,INPUT);
digitalWriteFast(15,LOW); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,HIGH);
delay(1);
if((int) digitalReadFast(15) != HIGH) error(15,18,4);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,LOW);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,HIGH);
delay(1);
if((int) digitalReadFast2(15) != HIGH) error(15,18,4);

pinModeFast(16,INPUT);
digitalWriteFast(16,HIGH); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,LOW);
delay(1);
if((int) digitalReadFast(16) != LOW) error(16,19,1);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,HIGH);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,LOW);
delay(1);
if((int) digitalReadFast2(16) != LOW) error(16,19,1);

pinModeFast(19,INPUT);
digitalWriteFast(19,HIGH); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,LOW);
delay(1);
if((int) digitalReadFast(19) != LOW) error(19,16,2);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,HIGH);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,LOW);
delay(1);
if((int) digitalReadFast2(19) != LOW) error(19,16,2);

pinModeFast(19,INPUT);
digitalWriteFast(19,LOW); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,HIGH);
delay(1);
if((int) digitalReadFast(19) != HIGH) error(19,16,3);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,LOW);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,HIGH);
delay(1);
if((int) digitalReadFast2(19) != HIGH) error(19,16,3);

pinModeFast(16,INPUT);
digitalWriteFast(16,LOW); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,HIGH);
delay(1);
if((int) digitalReadFast(16) != HIGH) error(16,19,4);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,LOW);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,HIGH);
delay(1);
if((int) digitalReadFast2(16) != HIGH) error(16,19,4);


//now do the back row pins on the Mega

pinModeFast(20,INPUT);
digitalWriteFast(20,HIGH); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,LOW);
delay(1);
if((int) digitalReadFast(20) != LOW) error(20,21,1);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,HIGH);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,LOW);
delay(1);
if((int) digitalReadFast2(20) != LOW) error(20,21,1);

pinModeFast(21,INPUT);
digitalWriteFast(21,HIGH); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,LOW);
delay(1);
if((int) digitalReadFast(21) != LOW) error(21,20,2);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,HIGH);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,LOW);
delay(1);
if((int) digitalReadFast2(21) != LOW) error(21,20,2);

pinModeFast(21,INPUT);
digitalWriteFast(21,LOW); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,HIGH);
delay(1);
if((int) digitalReadFast(21) != HIGH) error(21,20,3);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,LOW);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,HIGH);
delay(1);
if((int) digitalReadFast2(21) != HIGH) error(21,20,3);

pinModeFast(20,INPUT);
digitalWriteFast(20,LOW); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,HIGH);
delay(1);
if((int) digitalReadFast(20) != HIGH) error(20,21,4);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,LOW);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,HIGH);
delay(1);
if((int) digitalReadFast2(20) != HIGH) error(20,21,4);

pinModeFast(22,INPUT);
digitalWriteFast(22,HIGH); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,LOW);
delay(1);
if((int) digitalReadFast(22) != LOW) error(22,23,1);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,HIGH);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,LOW);
delay(1);
if((int) digitalReadFast2(22) != LOW) error(22,23,1);

pinModeFast(23,INPUT);
digitalWriteFast(23,HIGH); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,LOW);
delay(1);
if((int) digitalReadFast(23) != LOW) error(23,22,2);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,HIGH);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,LOW);
delay(1);
if((int) digitalReadFast2(23) != LOW) error(23,22,2);

pinModeFast(23,INPUT);
digitalWriteFast(23,LOW); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,HIGH);
delay(1);
if((int) digitalReadFast(23) != HIGH) error(23,22,3);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,LOW);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,HIGH);
delay(1);
if((int) digitalReadFast2(23) != HIGH) error(23,22,3);

pinModeFast(22,INPUT);
digitalWriteFast(22,LOW); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,HIGH);
delay(1);
if((int) digitalReadFast(22) != HIGH) error(22,23,4);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,LOW);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,HIGH);
delay(1);
if((int) digitalReadFast2(22) != HIGH) error(22,23,4);

pinModeFast(24,INPUT);
digitalWriteFast(24,HIGH); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,LOW);
delay(1);
if((int) digitalReadFast(24) != LOW) error(24,25,1);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,HIGH);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,LOW);
delay(1);
if((int) digitalReadFast2(24) != LOW) error(24,25,1);

pinModeFast(25,INPUT);
digitalWriteFast(25,HIGH); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,LOW);
delay(1);
if((int) digitalReadFast(25) != LOW) error(25,24,2);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,HIGH);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,LOW);
delay(1);
if((int) digitalReadFast2(25) != LOW) error(25,24,2);

pinModeFast(25,INPUT);
digitalWriteFast(25,LOW); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,HIGH);
delay(1);
if((int) digitalReadFast(25) != HIGH) error(25,24,3);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,LOW);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,HIGH);
delay(1);
if((int) digitalReadFast2(25) != HIGH) error(25,24,3);

pinModeFast(24,INPUT);
digitalWriteFast(24,LOW); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,HIGH);
delay(1);
if((int) digitalReadFast(24) != HIGH) error(24,25,4);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,LOW);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,HIGH);
delay(1);
if((int) digitalReadFast2(24) != HIGH) error(24,25,4);

pinModeFast(26,INPUT);
digitalWriteFast(26,HIGH); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,LOW);
delay(1);
if((int) digitalReadFast(26) != LOW) error(26,27,1);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,HIGH);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,LOW);
delay(1);
if((int) digitalReadFast2(26) != LOW) error(26,27,1);

pinModeFast(27,INPUT);
digitalWriteFast(27,HIGH); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,LOW);
delay(1);
if((int) digitalReadFast(27) != LOW) error(27,26,2);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,HIGH);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,LOW);
delay(1);
if((int) digitalReadFast2(27) != LOW) error(27,26,2);

pinModeFast(27,INPUT);
digitalWriteFast(27,LOW); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,HIGH);
delay(1);
if((int) digitalReadFast(27) != HIGH) error(27,26,3);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,LOW);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,HIGH);
delay(1);
if((int) digitalReadFast2(27) != HIGH) error(27,26,3);

pinModeFast(26,INPUT);
digitalWriteFast(26,LOW); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,HIGH);
delay(1);
if((int) digitalReadFast(26) != HIGH) error(26,27,4);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,LOW);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,HIGH);
delay(1);
if((int) digitalReadFast2(26) != HIGH) error(26,27,4);

pinModeFast(28,INPUT);
digitalWriteFast(28,HIGH); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,LOW);
delay(1);
if((int) digitalReadFast(28) != LOW) error(28,29,1);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,HIGH);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,LOW);
delay(1);
if((int) digitalReadFast2(28) != LOW) error(28,29,1);

pinModeFast(29,INPUT);
digitalWriteFast(29,HIGH); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,LOW);
delay(1);
if((int) digitalReadFast(29) != LOW) error(29,28,2);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,HIGH);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,LOW);
delay(1);
if((int) digitalReadFast2(29) != LOW) error(29,28,2);

pinModeFast(29,INPUT);
digitalWriteFast(29,LOW); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,HIGH);
delay(1);
if((int) digitalReadFast(29) != HIGH) error(29,28,3);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,LOW);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,HIGH);
delay(1);
if((int) digitalReadFast2(29) != HIGH) error(29,28,3);

pinModeFast(28,INPUT);
digitalWriteFast(28,LOW); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,HIGH);
delay(1);
if((int) digitalReadFast(28) != HIGH) error(28,29,4);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,LOW);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,HIGH);
delay(1);
if((int) digitalReadFast2(28) != HIGH) error(28,29,4);

pinModeFast(30,INPUT);
digitalWriteFast(30,HIGH); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,LOW);
delay(1);
if((int) digitalReadFast(30) != LOW) error(30,31,1);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,HIGH);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,LOW);
delay(1);
if((int) digitalReadFast2(30) != LOW) error(30,31,1);

pinModeFast(31,INPUT);
digitalWriteFast(31,HIGH); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,LOW);
delay(1);
if((int) digitalReadFast(31) != LOW) error(31,30,2);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,HIGH);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,LOW);
delay(1);
if((int) digitalReadFast2(31) != LOW) error(31,30,2);

pinModeFast(31,INPUT);
digitalWriteFast(31,LOW); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,HIGH);
delay(1);
if((int) digitalReadFast(31) != HIGH) error(31,30,3);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,LOW);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,HIGH);
delay(1);
if((int) digitalReadFast2(31) != HIGH) error(31,30,3);

pinModeFast(30,INPUT);
digitalWriteFast(30,LOW); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,HIGH);
delay(1);
if((int) digitalReadFast(30) != HIGH) error(30,31,4);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,LOW);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,HIGH);
delay(1);
if((int) digitalReadFast2(30) != HIGH) error(30,31,4);

pinModeFast(32,INPUT);
digitalWriteFast(32,HIGH); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,LOW);
delay(1);
if((int) digitalReadFast(32) != LOW) error(32,33,1);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,HIGH);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,LOW);
delay(1);
if((int) digitalReadFast2(32) != LOW) error(32,33,1);

pinModeFast(33,INPUT);
digitalWriteFast(33,HIGH); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,LOW);
delay(1);
if((int) digitalReadFast(33) != LOW) error(33,32,2);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,HIGH);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,LOW);
delay(1);
if((int) digitalReadFast2(33) != LOW) error(33,32,2);

pinModeFast(33,INPUT);
digitalWriteFast(33,LOW); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,HIGH);
delay(1);
if((int) digitalReadFast(33) != HIGH) error(33,32,3);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,LOW);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,HIGH);
delay(1);
if((int) digitalReadFast2(33) != HIGH) error(33,32,3);

pinModeFast(32,INPUT);
digitalWriteFast(32,LOW); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,HIGH);
delay(1);
if((int) digitalReadFast(32) != HIGH) error(32,33,4);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,LOW);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,HIGH);
delay(1);
if((int) digitalReadFast2(32) != HIGH) error(32,33,4);

pinModeFast(34,INPUT);
digitalWriteFast(34,HIGH); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,LOW);
delay(1);
if((int) digitalReadFast(34) != LOW) error(34,35,1);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,HIGH);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,LOW);
delay(1);
if((int) digitalReadFast2(34) != LOW) error(34,35,1);

pinModeFast(35,INPUT);
digitalWriteFast(35,HIGH); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,LOW);
delay(1);
if((int) digitalReadFast(35) != LOW) error(35,34,2);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,HIGH);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,LOW);
delay(1);
if((int) digitalReadFast2(35) != LOW) error(35,34,2);

pinModeFast(35,INPUT);
digitalWriteFast(35,LOW); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,HIGH);
delay(1);
if((int) digitalReadFast(35) != HIGH) error(35,34,3);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,LOW);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,HIGH);
delay(1);
if((int) digitalReadFast2(35) != HIGH) error(35,34,3);

pinModeFast(34,INPUT);
digitalWriteFast(34,LOW); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,HIGH);
delay(1);
if((int) digitalReadFast(34) != HIGH) error(34,35,4);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,LOW);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,HIGH);
delay(1);
if((int) digitalReadFast2(34) != HIGH) error(34,35,4);

pinModeFast(36,INPUT);
digitalWriteFast(36,HIGH); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,LOW);
delay(1);
if((int) digitalReadFast(36) != LOW) error(36,37,1);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,HIGH);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,LOW);
delay(1);
if((int) digitalReadFast2(36) != LOW) error(36,37,1);

pinModeFast(37,INPUT);
digitalWriteFast(37,HIGH); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,LOW);
delay(1);
if((int) digitalReadFast(37) != LOW) error(37,36,2);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,HIGH);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,LOW);
delay(1);
if((int) digitalReadFast2(37) != LOW) error(37,36,2);

pinModeFast(37,INPUT);
digitalWriteFast(37,LOW); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,HIGH);
delay(1);
if((int) digitalReadFast(37) != HIGH) error(37,36,3);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,LOW);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,HIGH);
delay(1);
if((int) digitalReadFast2(37) != HIGH) error(37,36,3);

pinModeFast(36,INPUT);
digitalWriteFast(36,LOW); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,HIGH);
delay(1);
if((int) digitalReadFast(36) != HIGH) error(36,37,4);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,LOW);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,HIGH);
delay(1);
if((int) digitalReadFast2(36) != HIGH) error(36,37,4);

pinModeFast(38,INPUT);
digitalWriteFast(38,HIGH); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,LOW);
delay(1);
if((int) digitalReadFast(38) != LOW) error(38,39,1);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,HIGH);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,LOW);
delay(1);
if((int) digitalReadFast2(38) != LOW) error(38,39,1);

pinModeFast(39,INPUT);
digitalWriteFast(39,HIGH); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,LOW);
delay(1);
if((int) digitalReadFast(39) != LOW) error(39,38,2);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,HIGH);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,LOW);
delay(1);
if((int) digitalReadFast2(39) != LOW) error(39,38,2);

pinModeFast(39,INPUT);
digitalWriteFast(39,LOW); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,HIGH);
delay(1);
if((int) digitalReadFast(39) != HIGH) error(39,38,3);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,LOW);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,HIGH);
delay(1);
if((int) digitalReadFast2(39) != HIGH) error(39,38,3);

pinModeFast(38,INPUT);
digitalWriteFast(38,LOW); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,HIGH);
delay(1);
if((int) digitalReadFast(38) != HIGH) error(38,39,4);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,LOW);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,HIGH);
delay(1);
if((int) digitalReadFast2(38) != HIGH) error(38,39,4);

pinModeFast(40,INPUT);
digitalWriteFast(40,HIGH); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,LOW);
delay(1);
if((int) digitalReadFast(40) != LOW) error(40,41,1);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,HIGH);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,LOW);
delay(1);
if((int) digitalReadFast2(40) != LOW) error(40,41,1);

pinModeFast(41,INPUT);
digitalWriteFast(41,HIGH); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,LOW);
delay(1);
if((int) digitalReadFast(41) != LOW) error(41,40,2);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,HIGH);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,LOW);
delay(1);
if((int) digitalReadFast2(41) != LOW) error(41,40,2);

pinModeFast(41,INPUT);
digitalWriteFast(41,LOW); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,HIGH);
delay(1);
if((int) digitalReadFast(41) != HIGH) error(41,40,3);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,LOW);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,HIGH);
delay(1);
if((int) digitalReadFast2(41) != HIGH) error(41,40,3);

pinModeFast(40,INPUT);
digitalWriteFast(40,LOW); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,HIGH);
delay(1);
if((int) digitalReadFast(40) != HIGH) error(40,41,4);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,LOW);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,HIGH);
delay(1);
if((int) digitalReadFast2(40) != HIGH) error(40,41,4);

pinModeFast(42,INPUT);
digitalWriteFast(42,HIGH); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,LOW);
delay(1);
if((int) digitalReadFast(42) != LOW) error(42,43,1);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,HIGH);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,LOW);
delay(1);
if((int) digitalReadFast2(42) != LOW) error(42,43,1);

pinModeFast(43,INPUT);
digitalWriteFast(43,HIGH); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,LOW);
delay(1);
if((int) digitalReadFast(43) != LOW) error(43,42,2);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,HIGH);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,LOW);
delay(1);
if((int) digitalReadFast2(43) != LOW) error(43,42,2);

pinModeFast(43,INPUT);
digitalWriteFast(43,LOW); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,HIGH);
delay(1);
if((int) digitalReadFast(43) != HIGH) error(43,42,3);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,LOW);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,HIGH);
delay(1);
if((int) digitalReadFast2(43) != HIGH) error(43,42,3);

pinModeFast(42,INPUT);
digitalWriteFast(42,LOW); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,HIGH);
delay(1);
if((int) digitalReadFast(42) != HIGH) error(42,43,4);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,LOW);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,HIGH);
delay(1);
if((int) digitalReadFast2(42) != HIGH) error(42,43,4);

analogWrite(44,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(44,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(45,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(44,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(46,254);
pinModeFast(46,INPUT);
digitalWriteFast(46,HIGH); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,LOW);
delay(1);
if((int) digitalReadFast(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

analogWrite(46,254);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,HIGH);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,LOW);
delay(1);
if((int) digitalReadFast2(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,LOW);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,HIGH);
delay(1);
if((int) digitalReadFast2(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(46,INPUT);
digitalWriteFast(46,LOW); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,HIGH);
delay(1);
if((int) digitalReadFast(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

analogWrite(46,1);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast(48,INPUT);
digitalWriteFast(48,HIGH); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,LOW);
delay(1);
if((int) digitalReadFast(48) != LOW) error(48,49,1);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,HIGH);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,LOW);
delay(1);
if((int) digitalReadFast2(48) != LOW) error(48,49,1);

pinModeFast(49,INPUT);
digitalWriteFast(49,HIGH); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,LOW);
delay(1);
if((int) digitalReadFast(49) != LOW) error(49,48,2);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,HIGH);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,LOW);
delay(1);
if((int) digitalReadFast2(49) != LOW) error(49,48,2);

pinModeFast(49,INPUT);
digitalWriteFast(49,LOW); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,HIGH);
delay(1);
if((int) digitalReadFast(49) != HIGH) error(49,48,3);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,LOW);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,HIGH);
delay(1);
if((int) digitalReadFast2(49) != HIGH) error(49,48,3);

pinModeFast(48,INPUT);
digitalWriteFast(48,LOW); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,HIGH);
delay(1);
if((int) digitalReadFast(48) != HIGH) error(48,49,4);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,LOW);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,HIGH);
delay(1);
if((int) digitalReadFast2(48) != HIGH) error(48,49,4);

pinModeFast(50,INPUT);
digitalWriteFast(50,HIGH); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,LOW);
delay(1);
if((int) digitalReadFast(50) != LOW) error(50,51,1);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,HIGH);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,LOW);
delay(1);
if((int) digitalReadFast2(50) != LOW) error(50,51,1);

pinModeFast(51,INPUT);
digitalWriteFast(51,HIGH); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,LOW);
delay(1);
if((int) digitalReadFast(51) != LOW) error(51,50,2);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,HIGH);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,LOW);
delay(1);
if((int) digitalReadFast2(51) != LOW) error(51,50,2);

pinModeFast(51,INPUT);
digitalWriteFast(51,LOW); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,HIGH);
delay(1);
if((int) digitalReadFast(51) != HIGH) error(51,50,3);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,LOW);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,HIGH);
delay(1);
if((int) digitalReadFast2(51) != HIGH) error(51,50,3);

pinModeFast(50,INPUT);
digitalWriteFast(50,LOW); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,HIGH);
delay(1);
if((int) digitalReadFast(50) != HIGH) error(50,51,4);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,LOW);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,HIGH);
delay(1);
if((int) digitalReadFast2(50) != HIGH) error(50,51,4);

pinModeFast(52,INPUT);
digitalWriteFast(52,HIGH); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,LOW);
delay(1);
if((int) digitalReadFast(52) != LOW) error(52,53,1);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,HIGH);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,LOW);
delay(1);
if((int) digitalReadFast2(52) != LOW) error(52,53,1);

pinModeFast(53,INPUT);
digitalWriteFast(53,HIGH); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,LOW);
delay(1);
if((int) digitalReadFast(53) != LOW) error(53,52,2);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,HIGH);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,LOW);
delay(1);
if((int) digitalReadFast2(53) != LOW) error(53,52,2);

pinModeFast(53,INPUT);
digitalWriteFast(53,LOW); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,HIGH);
delay(1);
if((int) digitalReadFast(53) != HIGH) error(53,52,3);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,LOW);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,HIGH);
delay(1);
if((int) digitalReadFast2(53) != HIGH) error(53,52,3);

pinModeFast(52,INPUT);
digitalWriteFast(52,LOW); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,HIGH);
delay(1);
if((int) digitalReadFast(52) != HIGH) error(52,53,4);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,LOW);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,HIGH);
delay(1);
if((int) digitalReadFast2(52) != HIGH) error(52,53,4);

pinModeFast(54,INPUT);
digitalWriteFast(54,HIGH); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,LOW);
delay(1);
if((int) digitalReadFast(54) != LOW) error(54,57,1);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,HIGH);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,LOW);
delay(1);
if((int) digitalReadFast2(54) != LOW) error(54,57,1);

pinModeFast(57,INPUT);
digitalWriteFast(57,HIGH); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,LOW);
delay(1);
if((int) digitalReadFast(57) != LOW) error(57,54,2);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,HIGH);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,LOW);
delay(1);
if((int) digitalReadFast2(57) != LOW) error(57,54,2);

pinModeFast(57,INPUT);
digitalWriteFast(57,LOW); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,HIGH);
delay(1);
if((int) digitalReadFast(57) != HIGH) error(57,54,3);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,LOW);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,HIGH);
delay(1);
if((int) digitalReadFast2(57) != HIGH) error(57,54,3);

pinModeFast(54,INPUT);
digitalWriteFast(54,LOW); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,HIGH);
delay(1);
if((int) digitalReadFast(54) != HIGH) error(54,57,4);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,LOW);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,HIGH);
delay(1);
if((int) digitalReadFast2(54) != HIGH) error(54,57,4);

pinModeFast(55,INPUT);
digitalWriteFast(55,HIGH); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,LOW);
delay(1);
if((int) digitalReadFast(55) != LOW) error(55,58,1);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,HIGH);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,LOW);
delay(1);
if((int) digitalReadFast2(55) != LOW) error(55,58,1);

pinModeFast(58,INPUT);
digitalWriteFast(58,HIGH); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,LOW);
delay(1);
if((int) digitalReadFast(58) != LOW) error(58,55,2);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,HIGH);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,LOW);
delay(1);
if((int) digitalReadFast2(58) != LOW) error(58,55,2);

pinModeFast(58,INPUT);
digitalWriteFast(58,LOW); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,HIGH);
delay(1);
if((int) digitalReadFast(58) != HIGH) error(58,55,3);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,LOW);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,HIGH);
delay(1);
if((int) digitalReadFast2(58) != HIGH) error(58,55,3);

pinModeFast(55,INPUT);
digitalWriteFast(55,LOW); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,HIGH);
delay(1);
if((int) digitalReadFast(55) != HIGH) error(55,58,4);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,LOW);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,HIGH);
delay(1);
if((int) digitalReadFast2(55) != HIGH) error(55,58,4);

pinModeFast(56,INPUT);
digitalWriteFast(56,HIGH); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,LOW);
delay(1);
if((int) digitalReadFast(56) != LOW) error(56,59,1);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,HIGH);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,LOW);
delay(1);
if((int) digitalReadFast2(56) != LOW) error(56,59,1);

pinModeFast(59,INPUT);
digitalWriteFast(59,HIGH); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,LOW);
delay(1);
if((int) digitalReadFast(59) != LOW) error(59,56,2);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,HIGH);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,LOW);
delay(1);
if((int) digitalReadFast2(59) != LOW) error(59,56,2);

pinModeFast(59,INPUT);
digitalWriteFast(59,LOW); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,HIGH);
delay(1);
if((int) digitalReadFast(59) != HIGH) error(59,56,3);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,LOW);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,HIGH);
delay(1);
if((int) digitalReadFast2(59) != HIGH) error(59,56,3);

pinModeFast(56,INPUT);
digitalWriteFast(56,LOW); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,HIGH);
delay(1);
if((int) digitalReadFast(56) != HIGH) error(56,59,4);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,LOW);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,HIGH);
delay(1);
if((int) digitalReadFast2(56) != HIGH) error(56,59,4);

pinModeFast(60,INPUT);
digitalWriteFast(60,HIGH); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,LOW);
delay(1);
if((int) digitalReadFast(60) != LOW) error(60,63,1);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,HIGH);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,LOW);
delay(1);
if((int) digitalReadFast2(60) != LOW) error(60,63,1);

pinModeFast(63,INPUT);
digitalWriteFast(63,HIGH); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,LOW);
delay(1);
if((int) digitalReadFast(63) != LOW) error(63,60,2);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,HIGH);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,LOW);
delay(1);
if((int) digitalReadFast2(63) != LOW) error(63,60,2);

pinModeFast(63,INPUT);
digitalWriteFast(63,LOW); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,HIGH);
delay(1);
if((int) digitalReadFast(63) != HIGH) error(63,60,3);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,LOW);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,HIGH);
delay(1);
if((int) digitalReadFast2(63) != HIGH) error(63,60,3);

pinModeFast(60,INPUT);
digitalWriteFast(60,LOW); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,HIGH);
delay(1);
if((int) digitalReadFast(60) != HIGH) error(60,63,4);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,LOW);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,HIGH);
delay(1);
if((int) digitalReadFast2(60) != HIGH) error(60,63,4);

pinModeFast(61,INPUT);
digitalWriteFast(61,HIGH); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,LOW);
delay(1);
if((int) digitalReadFast(61) != LOW) error(61,64,1);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,HIGH);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,LOW);
delay(1);
if((int) digitalReadFast2(61) != LOW) error(61,64,1);

pinModeFast(64,INPUT);
digitalWriteFast(64,HIGH); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,LOW);
delay(1);
if((int) digitalReadFast(64) != LOW) error(64,61,2);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,HIGH);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,LOW);
delay(1);
if((int) digitalReadFast2(64) != LOW) error(64,61,2);

pinModeFast(64,INPUT);
digitalWriteFast(64,LOW); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,HIGH);
delay(1);
if((int) digitalReadFast(64) != HIGH) error(64,61,3);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,LOW);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,HIGH);
delay(1);
if((int) digitalReadFast2(64) != HIGH) error(64,61,3);

pinModeFast(61,INPUT);
digitalWriteFast(61,LOW); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,HIGH);
delay(1);
if((int) digitalReadFast(61) != HIGH) error(61,64,4);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,LOW);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,HIGH);
delay(1);
if((int) digitalReadFast2(61) != HIGH) error(61,64,4);

pinModeFast(62,INPUT);
digitalWriteFast(62,HIGH); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,LOW);
delay(1);
if((int) digitalReadFast(62) != LOW) error(62,65,1);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,HIGH);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,LOW);
delay(1);
if((int) digitalReadFast2(62) != LOW) error(62,65,1);

pinModeFast(65,INPUT);
digitalWriteFast(65,HIGH); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,LOW);
delay(1);
if((int) digitalReadFast(65) != LOW) error(65,62,2);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,HIGH);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,LOW);
delay(1);
if((int) digitalReadFast2(65) != LOW) error(65,62,2);

pinModeFast(65,INPUT);
digitalWriteFast(65,LOW); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,HIGH);
delay(1);
if((int) digitalReadFast(65) != HIGH) error(65,62,3);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,LOW);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,HIGH);
delay(1);
if((int) digitalReadFast2(65) != HIGH) error(65,62,3);

pinModeFast(62,INPUT);
digitalWriteFast(62,LOW); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,HIGH);
delay(1);
if((int) digitalReadFast(62) != HIGH) error(62,65,4);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,LOW);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,HIGH);
delay(1);
if((int) digitalReadFast2(62) != HIGH) error(62,65,4);

pinModeFast(66,INPUT);
digitalWriteFast(66,HIGH); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,LOW);
delay(1);
if((int) digitalReadFast(66) != LOW) error(66,69,1);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,HIGH);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,LOW);
delay(1);
if((int) digitalReadFast2(66) != LOW) error(66,69,1);

pinModeFast(69,INPUT);
digitalWriteFast(69,HIGH); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,LOW);
delay(1);
if((int) digitalReadFast(69) != LOW) error(69,66,2);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,HIGH);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,LOW);
delay(1);
if((int) digitalReadFast2(69) != LOW) error(69,66,2);

pinModeFast(69,INPUT);
digitalWriteFast(69,LOW); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,HIGH);
delay(1);
if((int) digitalReadFast(69) != HIGH) error(69,66,3);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,LOW);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,HIGH);
delay(1);
if((int) digitalReadFast2(69) != HIGH) error(69,66,3);

pinModeFast(66,INPUT);
digitalWriteFast(66,LOW); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,HIGH);
delay(1);
if((int) digitalReadFast(66) != HIGH) error(66,69,4);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,LOW);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,HIGH);
delay(1);
if((int) digitalReadFast2(66) != HIGH) error(66,69,4);

pinModeFast(67,INPUT);
digitalWriteFast(67,HIGH); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,LOW);
delay(1);
if((int) digitalReadFast(67) != LOW) error(67,68,1);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,HIGH);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,LOW);
delay(1);
if((int) digitalReadFast2(67) != LOW) error(67,68,1);

pinModeFast(68,INPUT);
digitalWriteFast(68,HIGH); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,LOW);
delay(1);
if((int) digitalReadFast(68) != LOW) error(68,67,2);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,HIGH);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,LOW);
delay(1);
if((int) digitalReadFast2(68) != LOW) error(68,67,2);

pinModeFast(68,INPUT);
digitalWriteFast(68,LOW); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,HIGH);
delay(1);
if((int) digitalReadFast(68) != HIGH) error(68,67,3);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,LOW);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,HIGH);
delay(1);
if((int) digitalReadFast2(68) != HIGH) error(68,67,3);

pinModeFast(67,INPUT);
digitalWriteFast(67,LOW); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,HIGH);
delay(1);
if((int) digitalReadFast(67) != HIGH) error(67,68,4);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,LOW);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,HIGH);
delay(1);
if((int) digitalReadFast2(67) != HIGH) error(67,68,4);


//================================the output from progprog.py goes above===============
for(int i=20; i<54;i +=2) {   //now a loop that doesn't know pins numbers--much less extensive; degenerate case.
  pinModeFast2(i,INPUT);
  digitalWriteFast2(i,LOW);
  pinModeFast2(i+1,OUTPUT);
  digitalWriteFast2(i+1,HIGH);
  delay(10);
  q=digitalReadFast2(i);
  if (q != HIGH) error(i,i+1,5);
}
for(int j=0; j< 17; j+=6) {
  for(int i=0; i<3;i++){
      int a = 2+i+j;
      int b = 5+i+j;
      pinModeFast2(a,INPUT);
      digitalWriteFast2(a,LOW);
      pinModeFast2(b,OUTPUT);
      digitalWriteFast2(b,HIGH);
      delay(10);
      q=digitalReadFast2(a);
      if (q != HIGH) error(a,b,6);
}
}
Serial.println("Finished cycle B through pins.");
analogWrite(2,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast(2,INPUT);
digitalWriteFast(2,HIGH); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,LOW);
delay(1);
if((int) digitalReadFast(2) != LOW) error(2,5,1);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(2,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,HIGH);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,LOW);
delay(1);
if((int) digitalReadFast2(2) != LOW) error(2,5,1);

analogWrite(5,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast(5,INPUT);
digitalWriteFast(5,HIGH); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,LOW);
delay(1);
if((int) digitalReadFast(5) != LOW) error(5,2,2);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(2,254);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,HIGH);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,LOW);
delay(1);
if((int) digitalReadFast2(5) != LOW) error(5,2,2);

analogWrite(5,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast(5,INPUT);
digitalWriteFast(5,LOW); 
pinModeFast(2,OUTPUT);
digitalWriteFast(2,HIGH);
delay(1);
if((int) digitalReadFast(5) != HIGH) error(5,2,3);

pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(5,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast2(5,INPUT);
digitalWriteFast2(5,LOW);
pinModeFast2(2,OUTPUT);
digitalWriteFast2(2,HIGH);
delay(1);
if((int) digitalReadFast2(5) != HIGH) error(5,2,3);

analogWrite(2,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast(2,INPUT);
digitalWriteFast(2,LOW); 
pinModeFast(5,OUTPUT);
digitalWriteFast(5,HIGH);
delay(1);
if((int) digitalReadFast(2) != HIGH) error(2,5,4);

pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(2,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(5,1);
pinModeFast2(2,INPUT);
digitalWriteFast2(2,LOW);
pinModeFast2(5,OUTPUT);
digitalWriteFast2(5,HIGH);
delay(1);
if((int) digitalReadFast2(2) != HIGH) error(2,5,4);

analogWrite(3,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast(3,INPUT);
digitalWriteFast(3,HIGH); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,LOW);
delay(1);
if((int) digitalReadFast(3) != LOW) error(3,6,1);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(3,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,HIGH);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,LOW);
delay(1);
if((int) digitalReadFast2(3) != LOW) error(3,6,1);

analogWrite(6,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast(6,INPUT);
digitalWriteFast(6,HIGH); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,LOW);
delay(1);
if((int) digitalReadFast(6) != LOW) error(6,3,2);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(3,254);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,HIGH);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,LOW);
delay(1);
if((int) digitalReadFast2(6) != LOW) error(6,3,2);

analogWrite(6,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast(6,INPUT);
digitalWriteFast(6,LOW); 
pinModeFast(3,OUTPUT);
digitalWriteFast(3,HIGH);
delay(1);
if((int) digitalReadFast(6) != HIGH) error(6,3,3);

pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(6,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast2(6,INPUT);
digitalWriteFast2(6,LOW);
pinModeFast2(3,OUTPUT);
digitalWriteFast2(3,HIGH);
delay(1);
if((int) digitalReadFast2(6) != HIGH) error(6,3,3);

analogWrite(3,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast(3,INPUT);
digitalWriteFast(3,LOW); 
pinModeFast(6,OUTPUT);
digitalWriteFast(6,HIGH);
delay(1);
if((int) digitalReadFast(3) != HIGH) error(3,6,4);

pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(3,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(6,1);
pinModeFast2(3,INPUT);
digitalWriteFast2(3,LOW);
pinModeFast2(6,OUTPUT);
digitalWriteFast2(6,HIGH);
delay(1);
if((int) digitalReadFast2(3) != HIGH) error(3,6,4);

analogWrite(4,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast(4,INPUT);
digitalWriteFast(4,HIGH); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,LOW);
delay(1);
if((int) digitalReadFast(4) != LOW) error(4,7,1);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(4,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,HIGH);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,LOW);
delay(1);
if((int) digitalReadFast2(4) != LOW) error(4,7,1);

analogWrite(7,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast(7,INPUT);
digitalWriteFast(7,HIGH); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,LOW);
delay(1);
if((int) digitalReadFast(7) != LOW) error(7,4,2);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(4,254);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,HIGH);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,LOW);
delay(1);
if((int) digitalReadFast2(7) != LOW) error(7,4,2);

analogWrite(7,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast(7,INPUT);
digitalWriteFast(7,LOW); 
pinModeFast(4,OUTPUT);
digitalWriteFast(4,HIGH);
delay(1);
if((int) digitalReadFast(7) != HIGH) error(7,4,3);

pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(7,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast2(7,INPUT);
digitalWriteFast2(7,LOW);
pinModeFast2(4,OUTPUT);
digitalWriteFast2(4,HIGH);
delay(1);
if((int) digitalReadFast2(7) != HIGH) error(7,4,3);

analogWrite(4,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast(4,INPUT);
digitalWriteFast(4,LOW); 
pinModeFast(7,OUTPUT);
digitalWriteFast(7,HIGH);
delay(1);
if((int) digitalReadFast(4) != HIGH) error(4,7,4);

pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(4,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(7,1);
pinModeFast2(4,INPUT);
digitalWriteFast2(4,LOW);
pinModeFast2(7,OUTPUT);
digitalWriteFast2(7,HIGH);
delay(1);
if((int) digitalReadFast2(4) != HIGH) error(4,7,4);

analogWrite(8,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast(8,INPUT);
digitalWriteFast(8,HIGH); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,LOW);
delay(1);
if((int) digitalReadFast(8) != LOW) error(8,11,1);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(8,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,HIGH);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,LOW);
delay(1);
if((int) digitalReadFast2(8) != LOW) error(8,11,1);

analogWrite(11,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast(11,INPUT);
digitalWriteFast(11,HIGH); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,LOW);
delay(1);
if((int) digitalReadFast(11) != LOW) error(11,8,2);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(8,254);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,HIGH);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,LOW);
delay(1);
if((int) digitalReadFast2(11) != LOW) error(11,8,2);

analogWrite(11,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast(11,INPUT);
digitalWriteFast(11,LOW); 
pinModeFast(8,OUTPUT);
digitalWriteFast(8,HIGH);
delay(1);
if((int) digitalReadFast(11) != HIGH) error(11,8,3);

pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(11,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast2(11,INPUT);
digitalWriteFast2(11,LOW);
pinModeFast2(8,OUTPUT);
digitalWriteFast2(8,HIGH);
delay(1);
if((int) digitalReadFast2(11) != HIGH) error(11,8,3);

analogWrite(8,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast(8,INPUT);
digitalWriteFast(8,LOW); 
pinModeFast(11,OUTPUT);
digitalWriteFast(11,HIGH);
delay(1);
if((int) digitalReadFast(8) != HIGH) error(8,11,4);

pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(8,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(11,1);
pinModeFast2(8,INPUT);
digitalWriteFast2(8,LOW);
pinModeFast2(11,OUTPUT);
digitalWriteFast2(11,HIGH);
delay(1);
if((int) digitalReadFast2(8) != HIGH) error(8,11,4);

analogWrite(9,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast(9,INPUT);
digitalWriteFast(9,HIGH); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,LOW);
delay(1);
if((int) digitalReadFast(9) != LOW) error(9,12,1);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(9,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,HIGH);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,LOW);
delay(1);
if((int) digitalReadFast2(9) != LOW) error(9,12,1);

analogWrite(12,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast(12,INPUT);
digitalWriteFast(12,HIGH); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,LOW);
delay(1);
if((int) digitalReadFast(12) != LOW) error(12,9,2);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(9,254);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,HIGH);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,LOW);
delay(1);
if((int) digitalReadFast2(12) != LOW) error(12,9,2);

analogWrite(12,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast(12,INPUT);
digitalWriteFast(12,LOW); 
pinModeFast(9,OUTPUT);
digitalWriteFast(9,HIGH);
delay(1);
if((int) digitalReadFast(12) != HIGH) error(12,9,3);

pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(12,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast2(12,INPUT);
digitalWriteFast2(12,LOW);
pinModeFast2(9,OUTPUT);
digitalWriteFast2(9,HIGH);
delay(1);
if((int) digitalReadFast2(12) != HIGH) error(12,9,3);

analogWrite(9,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast(9,INPUT);
digitalWriteFast(9,LOW); 
pinModeFast(12,OUTPUT);
digitalWriteFast(12,HIGH);
delay(1);
if((int) digitalReadFast(9) != HIGH) error(9,12,4);

pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(9,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(12,1);
pinModeFast2(9,INPUT);
digitalWriteFast2(9,LOW);
pinModeFast2(12,OUTPUT);
digitalWriteFast2(12,HIGH);
delay(1);
if((int) digitalReadFast2(9) != HIGH) error(9,12,4);

analogWrite(10,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast(10,INPUT);
digitalWriteFast(10,HIGH); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,LOW);
delay(1);
if((int) digitalReadFast(10) != LOW) error(10,13,1);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(10,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,HIGH);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,LOW);
delay(1);
if((int) digitalReadFast2(10) != LOW) error(10,13,1);

analogWrite(13,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast(13,INPUT);
digitalWriteFast(13,HIGH); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,LOW);
delay(1);
if((int) digitalReadFast(13) != LOW) error(13,10,2);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(10,254);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,HIGH);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,LOW);
delay(1);
if((int) digitalReadFast2(13) != LOW) error(13,10,2);

analogWrite(13,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast(13,INPUT);
digitalWriteFast(13,LOW); 
pinModeFast(10,OUTPUT);
digitalWriteFast(10,HIGH);
delay(1);
if((int) digitalReadFast(13) != HIGH) error(13,10,3);

pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(13,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast2(13,INPUT);
digitalWriteFast2(13,LOW);
pinModeFast2(10,OUTPUT);
digitalWriteFast2(10,HIGH);
delay(1);
if((int) digitalReadFast2(13) != HIGH) error(13,10,3);

analogWrite(10,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast(10,INPUT);
digitalWriteFast(10,LOW); 
pinModeFast(13,OUTPUT);
digitalWriteFast(13,HIGH);
delay(1);
if((int) digitalReadFast(10) != HIGH) error(10,13,4);

pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(10,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(13,1);
pinModeFast2(10,INPUT);
digitalWriteFast2(10,LOW);
pinModeFast2(13,OUTPUT);
digitalWriteFast2(13,HIGH);
delay(1);
if((int) digitalReadFast2(10) != HIGH) error(10,13,4);

analogWrite(14,254);
pinModeFast(14,INPUT);
digitalWriteFast(14,HIGH); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,LOW);
delay(1);
if((int) digitalReadFast(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

analogWrite(14,254);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,HIGH);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,LOW);
delay(1);
if((int) digitalReadFast2(14) != LOW) error(14,17,1);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,HIGH); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,LOW);
delay(1);
if((int) digitalReadFast(17) != LOW) error(17,14,2);

analogWrite(14,254);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,HIGH);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,LOW);
delay(1);
if((int) digitalReadFast2(17) != LOW) error(17,14,2);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

pinModeFast(17,INPUT);
digitalWriteFast(17,LOW); 
pinModeFast(14,OUTPUT);
digitalWriteFast(14,HIGH);
delay(1);
if((int) digitalReadFast(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast2(17,INPUT);
digitalWriteFast2(17,LOW);
pinModeFast2(14,OUTPUT);
digitalWriteFast2(14,HIGH);
delay(1);
if((int) digitalReadFast2(17) != HIGH) error(17,14,3);

analogWrite(14,1);
pinModeFast(14,INPUT);
digitalWriteFast(14,LOW); 
pinModeFast(17,OUTPUT);
digitalWriteFast(17,HIGH);
delay(1);
if((int) digitalReadFast(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

analogWrite(14,1);
pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast2(14,INPUT);
digitalWriteFast2(14,LOW);
pinModeFast2(17,OUTPUT);
digitalWriteFast2(17,HIGH);
delay(1);
if((int) digitalReadFast2(14) != HIGH) error(14,17,4);

pinModeFast(15,INPUT);
digitalWriteFast(15,HIGH); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,LOW);
delay(1);
if((int) digitalReadFast(15) != LOW) error(15,18,1);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,HIGH);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,LOW);
delay(1);
if((int) digitalReadFast2(15) != LOW) error(15,18,1);

pinModeFast(18,INPUT);
digitalWriteFast(18,HIGH); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,LOW);
delay(1);
if((int) digitalReadFast(18) != LOW) error(18,15,2);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,HIGH);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,LOW);
delay(1);
if((int) digitalReadFast2(18) != LOW) error(18,15,2);

pinModeFast(18,INPUT);
digitalWriteFast(18,LOW); 
pinModeFast(15,OUTPUT);
digitalWriteFast(15,HIGH);
delay(1);
if((int) digitalReadFast(18) != HIGH) error(18,15,3);

pinModeFast2(18,INPUT);
digitalWriteFast2(18,LOW);
pinModeFast2(15,OUTPUT);
digitalWriteFast2(15,HIGH);
delay(1);
if((int) digitalReadFast2(18) != HIGH) error(18,15,3);

pinModeFast(15,INPUT);
digitalWriteFast(15,LOW); 
pinModeFast(18,OUTPUT);
digitalWriteFast(18,HIGH);
delay(1);
if((int) digitalReadFast(15) != HIGH) error(15,18,4);

pinModeFast2(15,INPUT);
digitalWriteFast2(15,LOW);
pinModeFast2(18,OUTPUT);
digitalWriteFast2(18,HIGH);
delay(1);
if((int) digitalReadFast2(15) != HIGH) error(15,18,4);

pinModeFast(16,INPUT);
digitalWriteFast(16,HIGH); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,LOW);
delay(1);
if((int) digitalReadFast(16) != LOW) error(16,19,1);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,HIGH);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,LOW);
delay(1);
if((int) digitalReadFast2(16) != LOW) error(16,19,1);

pinModeFast(19,INPUT);
digitalWriteFast(19,HIGH); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,LOW);
delay(1);
if((int) digitalReadFast(19) != LOW) error(19,16,2);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,HIGH);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,LOW);
delay(1);
if((int) digitalReadFast2(19) != LOW) error(19,16,2);

pinModeFast(19,INPUT);
digitalWriteFast(19,LOW); 
pinModeFast(16,OUTPUT);
digitalWriteFast(16,HIGH);
delay(1);
if((int) digitalReadFast(19) != HIGH) error(19,16,3);

pinModeFast2(19,INPUT);
digitalWriteFast2(19,LOW);
pinModeFast2(16,OUTPUT);
digitalWriteFast2(16,HIGH);
delay(1);
if((int) digitalReadFast2(19) != HIGH) error(19,16,3);

pinModeFast(16,INPUT);
digitalWriteFast(16,LOW); 
pinModeFast(19,OUTPUT);
digitalWriteFast(19,HIGH);
delay(1);
if((int) digitalReadFast(16) != HIGH) error(16,19,4);

pinModeFast2(16,INPUT);
digitalWriteFast2(16,LOW);
pinModeFast2(19,OUTPUT);
digitalWriteFast2(19,HIGH);
delay(1);
if((int) digitalReadFast2(16) != HIGH) error(16,19,4);


//now do the back row pins on the Mega

pinModeFast(20,INPUT);
digitalWriteFast(20,HIGH); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,LOW);
delay(1);
if((int) digitalReadFast(20) != LOW) error(20,21,1);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,HIGH);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,LOW);
delay(1);
if((int) digitalReadFast2(20) != LOW) error(20,21,1);

pinModeFast(21,INPUT);
digitalWriteFast(21,HIGH); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,LOW);
delay(1);
if((int) digitalReadFast(21) != LOW) error(21,20,2);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,HIGH);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,LOW);
delay(1);
if((int) digitalReadFast2(21) != LOW) error(21,20,2);

pinModeFast(21,INPUT);
digitalWriteFast(21,LOW); 
pinModeFast(20,OUTPUT);
digitalWriteFast(20,HIGH);
delay(1);
if((int) digitalReadFast(21) != HIGH) error(21,20,3);

pinModeFast2(21,INPUT);
digitalWriteFast2(21,LOW);
pinModeFast2(20,OUTPUT);
digitalWriteFast2(20,HIGH);
delay(1);
if((int) digitalReadFast2(21) != HIGH) error(21,20,3);

pinModeFast(20,INPUT);
digitalWriteFast(20,LOW); 
pinModeFast(21,OUTPUT);
digitalWriteFast(21,HIGH);
delay(1);
if((int) digitalReadFast(20) != HIGH) error(20,21,4);

pinModeFast2(20,INPUT);
digitalWriteFast2(20,LOW);
pinModeFast2(21,OUTPUT);
digitalWriteFast2(21,HIGH);
delay(1);
if((int) digitalReadFast2(20) != HIGH) error(20,21,4);

pinModeFast(22,INPUT);
digitalWriteFast(22,HIGH); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,LOW);
delay(1);
if((int) digitalReadFast(22) != LOW) error(22,23,1);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,HIGH);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,LOW);
delay(1);
if((int) digitalReadFast2(22) != LOW) error(22,23,1);

pinModeFast(23,INPUT);
digitalWriteFast(23,HIGH); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,LOW);
delay(1);
if((int) digitalReadFast(23) != LOW) error(23,22,2);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,HIGH);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,LOW);
delay(1);
if((int) digitalReadFast2(23) != LOW) error(23,22,2);

pinModeFast(23,INPUT);
digitalWriteFast(23,LOW); 
pinModeFast(22,OUTPUT);
digitalWriteFast(22,HIGH);
delay(1);
if((int) digitalReadFast(23) != HIGH) error(23,22,3);

pinModeFast2(23,INPUT);
digitalWriteFast2(23,LOW);
pinModeFast2(22,OUTPUT);
digitalWriteFast2(22,HIGH);
delay(1);
if((int) digitalReadFast2(23) != HIGH) error(23,22,3);

pinModeFast(22,INPUT);
digitalWriteFast(22,LOW); 
pinModeFast(23,OUTPUT);
digitalWriteFast(23,HIGH);
delay(1);
if((int) digitalReadFast(22) != HIGH) error(22,23,4);

pinModeFast2(22,INPUT);
digitalWriteFast2(22,LOW);
pinModeFast2(23,OUTPUT);
digitalWriteFast2(23,HIGH);
delay(1);
if((int) digitalReadFast2(22) != HIGH) error(22,23,4);

pinModeFast(24,INPUT);
digitalWriteFast(24,HIGH); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,LOW);
delay(1);
if((int) digitalReadFast(24) != LOW) error(24,25,1);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,HIGH);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,LOW);
delay(1);
if((int) digitalReadFast2(24) != LOW) error(24,25,1);

pinModeFast(25,INPUT);
digitalWriteFast(25,HIGH); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,LOW);
delay(1);
if((int) digitalReadFast(25) != LOW) error(25,24,2);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,HIGH);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,LOW);
delay(1);
if((int) digitalReadFast2(25) != LOW) error(25,24,2);

pinModeFast(25,INPUT);
digitalWriteFast(25,LOW); 
pinModeFast(24,OUTPUT);
digitalWriteFast(24,HIGH);
delay(1);
if((int) digitalReadFast(25) != HIGH) error(25,24,3);

pinModeFast2(25,INPUT);
digitalWriteFast2(25,LOW);
pinModeFast2(24,OUTPUT);
digitalWriteFast2(24,HIGH);
delay(1);
if((int) digitalReadFast2(25) != HIGH) error(25,24,3);

pinModeFast(24,INPUT);
digitalWriteFast(24,LOW); 
pinModeFast(25,OUTPUT);
digitalWriteFast(25,HIGH);
delay(1);
if((int) digitalReadFast(24) != HIGH) error(24,25,4);

pinModeFast2(24,INPUT);
digitalWriteFast2(24,LOW);
pinModeFast2(25,OUTPUT);
digitalWriteFast2(25,HIGH);
delay(1);
if((int) digitalReadFast2(24) != HIGH) error(24,25,4);

pinModeFast(26,INPUT);
digitalWriteFast(26,HIGH); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,LOW);
delay(1);
if((int) digitalReadFast(26) != LOW) error(26,27,1);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,HIGH);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,LOW);
delay(1);
if((int) digitalReadFast2(26) != LOW) error(26,27,1);

pinModeFast(27,INPUT);
digitalWriteFast(27,HIGH); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,LOW);
delay(1);
if((int) digitalReadFast(27) != LOW) error(27,26,2);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,HIGH);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,LOW);
delay(1);
if((int) digitalReadFast2(27) != LOW) error(27,26,2);

pinModeFast(27,INPUT);
digitalWriteFast(27,LOW); 
pinModeFast(26,OUTPUT);
digitalWriteFast(26,HIGH);
delay(1);
if((int) digitalReadFast(27) != HIGH) error(27,26,3);

pinModeFast2(27,INPUT);
digitalWriteFast2(27,LOW);
pinModeFast2(26,OUTPUT);
digitalWriteFast2(26,HIGH);
delay(1);
if((int) digitalReadFast2(27) != HIGH) error(27,26,3);

pinModeFast(26,INPUT);
digitalWriteFast(26,LOW); 
pinModeFast(27,OUTPUT);
digitalWriteFast(27,HIGH);
delay(1);
if((int) digitalReadFast(26) != HIGH) error(26,27,4);

pinModeFast2(26,INPUT);
digitalWriteFast2(26,LOW);
pinModeFast2(27,OUTPUT);
digitalWriteFast2(27,HIGH);
delay(1);
if((int) digitalReadFast2(26) != HIGH) error(26,27,4);

pinModeFast(28,INPUT);
digitalWriteFast(28,HIGH); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,LOW);
delay(1);
if((int) digitalReadFast(28) != LOW) error(28,29,1);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,HIGH);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,LOW);
delay(1);
if((int) digitalReadFast2(28) != LOW) error(28,29,1);

pinModeFast(29,INPUT);
digitalWriteFast(29,HIGH); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,LOW);
delay(1);
if((int) digitalReadFast(29) != LOW) error(29,28,2);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,HIGH);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,LOW);
delay(1);
if((int) digitalReadFast2(29) != LOW) error(29,28,2);

pinModeFast(29,INPUT);
digitalWriteFast(29,LOW); 
pinModeFast(28,OUTPUT);
digitalWriteFast(28,HIGH);
delay(1);
if((int) digitalReadFast(29) != HIGH) error(29,28,3);

pinModeFast2(29,INPUT);
digitalWriteFast2(29,LOW);
pinModeFast2(28,OUTPUT);
digitalWriteFast2(28,HIGH);
delay(1);
if((int) digitalReadFast2(29) != HIGH) error(29,28,3);

pinModeFast(28,INPUT);
digitalWriteFast(28,LOW); 
pinModeFast(29,OUTPUT);
digitalWriteFast(29,HIGH);
delay(1);
if((int) digitalReadFast(28) != HIGH) error(28,29,4);

pinModeFast2(28,INPUT);
digitalWriteFast2(28,LOW);
pinModeFast2(29,OUTPUT);
digitalWriteFast2(29,HIGH);
delay(1);
if((int) digitalReadFast2(28) != HIGH) error(28,29,4);

pinModeFast(30,INPUT);
digitalWriteFast(30,HIGH); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,LOW);
delay(1);
if((int) digitalReadFast(30) != LOW) error(30,31,1);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,HIGH);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,LOW);
delay(1);
if((int) digitalReadFast2(30) != LOW) error(30,31,1);

pinModeFast(31,INPUT);
digitalWriteFast(31,HIGH); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,LOW);
delay(1);
if((int) digitalReadFast(31) != LOW) error(31,30,2);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,HIGH);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,LOW);
delay(1);
if((int) digitalReadFast2(31) != LOW) error(31,30,2);

pinModeFast(31,INPUT);
digitalWriteFast(31,LOW); 
pinModeFast(30,OUTPUT);
digitalWriteFast(30,HIGH);
delay(1);
if((int) digitalReadFast(31) != HIGH) error(31,30,3);

pinModeFast2(31,INPUT);
digitalWriteFast2(31,LOW);
pinModeFast2(30,OUTPUT);
digitalWriteFast2(30,HIGH);
delay(1);
if((int) digitalReadFast2(31) != HIGH) error(31,30,3);

pinModeFast(30,INPUT);
digitalWriteFast(30,LOW); 
pinModeFast(31,OUTPUT);
digitalWriteFast(31,HIGH);
delay(1);
if((int) digitalReadFast(30) != HIGH) error(30,31,4);

pinModeFast2(30,INPUT);
digitalWriteFast2(30,LOW);
pinModeFast2(31,OUTPUT);
digitalWriteFast2(31,HIGH);
delay(1);
if((int) digitalReadFast2(30) != HIGH) error(30,31,4);

pinModeFast(32,INPUT);
digitalWriteFast(32,HIGH); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,LOW);
delay(1);
if((int) digitalReadFast(32) != LOW) error(32,33,1);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,HIGH);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,LOW);
delay(1);
if((int) digitalReadFast2(32) != LOW) error(32,33,1);

pinModeFast(33,INPUT);
digitalWriteFast(33,HIGH); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,LOW);
delay(1);
if((int) digitalReadFast(33) != LOW) error(33,32,2);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,HIGH);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,LOW);
delay(1);
if((int) digitalReadFast2(33) != LOW) error(33,32,2);

pinModeFast(33,INPUT);
digitalWriteFast(33,LOW); 
pinModeFast(32,OUTPUT);
digitalWriteFast(32,HIGH);
delay(1);
if((int) digitalReadFast(33) != HIGH) error(33,32,3);

pinModeFast2(33,INPUT);
digitalWriteFast2(33,LOW);
pinModeFast2(32,OUTPUT);
digitalWriteFast2(32,HIGH);
delay(1);
if((int) digitalReadFast2(33) != HIGH) error(33,32,3);

pinModeFast(32,INPUT);
digitalWriteFast(32,LOW); 
pinModeFast(33,OUTPUT);
digitalWriteFast(33,HIGH);
delay(1);
if((int) digitalReadFast(32) != HIGH) error(32,33,4);

pinModeFast2(32,INPUT);
digitalWriteFast2(32,LOW);
pinModeFast2(33,OUTPUT);
digitalWriteFast2(33,HIGH);
delay(1);
if((int) digitalReadFast2(32) != HIGH) error(32,33,4);

pinModeFast(34,INPUT);
digitalWriteFast(34,HIGH); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,LOW);
delay(1);
if((int) digitalReadFast(34) != LOW) error(34,35,1);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,HIGH);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,LOW);
delay(1);
if((int) digitalReadFast2(34) != LOW) error(34,35,1);

pinModeFast(35,INPUT);
digitalWriteFast(35,HIGH); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,LOW);
delay(1);
if((int) digitalReadFast(35) != LOW) error(35,34,2);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,HIGH);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,LOW);
delay(1);
if((int) digitalReadFast2(35) != LOW) error(35,34,2);

pinModeFast(35,INPUT);
digitalWriteFast(35,LOW); 
pinModeFast(34,OUTPUT);
digitalWriteFast(34,HIGH);
delay(1);
if((int) digitalReadFast(35) != HIGH) error(35,34,3);

pinModeFast2(35,INPUT);
digitalWriteFast2(35,LOW);
pinModeFast2(34,OUTPUT);
digitalWriteFast2(34,HIGH);
delay(1);
if((int) digitalReadFast2(35) != HIGH) error(35,34,3);

pinModeFast(34,INPUT);
digitalWriteFast(34,LOW); 
pinModeFast(35,OUTPUT);
digitalWriteFast(35,HIGH);
delay(1);
if((int) digitalReadFast(34) != HIGH) error(34,35,4);

pinModeFast2(34,INPUT);
digitalWriteFast2(34,LOW);
pinModeFast2(35,OUTPUT);
digitalWriteFast2(35,HIGH);
delay(1);
if((int) digitalReadFast2(34) != HIGH) error(34,35,4);

pinModeFast(36,INPUT);
digitalWriteFast(36,HIGH); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,LOW);
delay(1);
if((int) digitalReadFast(36) != LOW) error(36,37,1);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,HIGH);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,LOW);
delay(1);
if((int) digitalReadFast2(36) != LOW) error(36,37,1);

pinModeFast(37,INPUT);
digitalWriteFast(37,HIGH); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,LOW);
delay(1);
if((int) digitalReadFast(37) != LOW) error(37,36,2);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,HIGH);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,LOW);
delay(1);
if((int) digitalReadFast2(37) != LOW) error(37,36,2);

pinModeFast(37,INPUT);
digitalWriteFast(37,LOW); 
pinModeFast(36,OUTPUT);
digitalWriteFast(36,HIGH);
delay(1);
if((int) digitalReadFast(37) != HIGH) error(37,36,3);

pinModeFast2(37,INPUT);
digitalWriteFast2(37,LOW);
pinModeFast2(36,OUTPUT);
digitalWriteFast2(36,HIGH);
delay(1);
if((int) digitalReadFast2(37) != HIGH) error(37,36,3);

pinModeFast(36,INPUT);
digitalWriteFast(36,LOW); 
pinModeFast(37,OUTPUT);
digitalWriteFast(37,HIGH);
delay(1);
if((int) digitalReadFast(36) != HIGH) error(36,37,4);

pinModeFast2(36,INPUT);
digitalWriteFast2(36,LOW);
pinModeFast2(37,OUTPUT);
digitalWriteFast2(37,HIGH);
delay(1);
if((int) digitalReadFast2(36) != HIGH) error(36,37,4);

pinModeFast(38,INPUT);
digitalWriteFast(38,HIGH); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,LOW);
delay(1);
if((int) digitalReadFast(38) != LOW) error(38,39,1);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,HIGH);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,LOW);
delay(1);
if((int) digitalReadFast2(38) != LOW) error(38,39,1);

pinModeFast(39,INPUT);
digitalWriteFast(39,HIGH); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,LOW);
delay(1);
if((int) digitalReadFast(39) != LOW) error(39,38,2);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,HIGH);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,LOW);
delay(1);
if((int) digitalReadFast2(39) != LOW) error(39,38,2);

pinModeFast(39,INPUT);
digitalWriteFast(39,LOW); 
pinModeFast(38,OUTPUT);
digitalWriteFast(38,HIGH);
delay(1);
if((int) digitalReadFast(39) != HIGH) error(39,38,3);

pinModeFast2(39,INPUT);
digitalWriteFast2(39,LOW);
pinModeFast2(38,OUTPUT);
digitalWriteFast2(38,HIGH);
delay(1);
if((int) digitalReadFast2(39) != HIGH) error(39,38,3);

pinModeFast(38,INPUT);
digitalWriteFast(38,LOW); 
pinModeFast(39,OUTPUT);
digitalWriteFast(39,HIGH);
delay(1);
if((int) digitalReadFast(38) != HIGH) error(38,39,4);

pinModeFast2(38,INPUT);
digitalWriteFast2(38,LOW);
pinModeFast2(39,OUTPUT);
digitalWriteFast2(39,HIGH);
delay(1);
if((int) digitalReadFast2(38) != HIGH) error(38,39,4);

pinModeFast(40,INPUT);
digitalWriteFast(40,HIGH); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,LOW);
delay(1);
if((int) digitalReadFast(40) != LOW) error(40,41,1);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,HIGH);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,LOW);
delay(1);
if((int) digitalReadFast2(40) != LOW) error(40,41,1);

pinModeFast(41,INPUT);
digitalWriteFast(41,HIGH); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,LOW);
delay(1);
if((int) digitalReadFast(41) != LOW) error(41,40,2);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,HIGH);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,LOW);
delay(1);
if((int) digitalReadFast2(41) != LOW) error(41,40,2);

pinModeFast(41,INPUT);
digitalWriteFast(41,LOW); 
pinModeFast(40,OUTPUT);
digitalWriteFast(40,HIGH);
delay(1);
if((int) digitalReadFast(41) != HIGH) error(41,40,3);

pinModeFast2(41,INPUT);
digitalWriteFast2(41,LOW);
pinModeFast2(40,OUTPUT);
digitalWriteFast2(40,HIGH);
delay(1);
if((int) digitalReadFast2(41) != HIGH) error(41,40,3);

pinModeFast(40,INPUT);
digitalWriteFast(40,LOW); 
pinModeFast(41,OUTPUT);
digitalWriteFast(41,HIGH);
delay(1);
if((int) digitalReadFast(40) != HIGH) error(40,41,4);

pinModeFast2(40,INPUT);
digitalWriteFast2(40,LOW);
pinModeFast2(41,OUTPUT);
digitalWriteFast2(41,HIGH);
delay(1);
if((int) digitalReadFast2(40) != HIGH) error(40,41,4);

pinModeFast(42,INPUT);
digitalWriteFast(42,HIGH); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,LOW);
delay(1);
if((int) digitalReadFast(42) != LOW) error(42,43,1);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,HIGH);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,LOW);
delay(1);
if((int) digitalReadFast2(42) != LOW) error(42,43,1);

pinModeFast(43,INPUT);
digitalWriteFast(43,HIGH); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,LOW);
delay(1);
if((int) digitalReadFast(43) != LOW) error(43,42,2);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,HIGH);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,LOW);
delay(1);
if((int) digitalReadFast2(43) != LOW) error(43,42,2);

pinModeFast(43,INPUT);
digitalWriteFast(43,LOW); 
pinModeFast(42,OUTPUT);
digitalWriteFast(42,HIGH);
delay(1);
if((int) digitalReadFast(43) != HIGH) error(43,42,3);

pinModeFast2(43,INPUT);
digitalWriteFast2(43,LOW);
pinModeFast2(42,OUTPUT);
digitalWriteFast2(42,HIGH);
delay(1);
if((int) digitalReadFast2(43) != HIGH) error(43,42,3);

pinModeFast(42,INPUT);
digitalWriteFast(42,LOW); 
pinModeFast(43,OUTPUT);
digitalWriteFast(43,HIGH);
delay(1);
if((int) digitalReadFast(42) != HIGH) error(42,43,4);

pinModeFast2(42,INPUT);
digitalWriteFast2(42,LOW);
pinModeFast2(43,OUTPUT);
digitalWriteFast2(43,HIGH);
delay(1);
if((int) digitalReadFast2(42) != HIGH) error(42,43,4);

analogWrite(44,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast(44,INPUT);
digitalWriteFast(44,HIGH); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,LOW);
delay(1);
if((int) digitalReadFast(44) != LOW) error(44,45,1);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(44,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,HIGH);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,LOW);
delay(1);
if((int) digitalReadFast2(44) != LOW) error(44,45,1);

analogWrite(45,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast(45,INPUT);
digitalWriteFast(45,HIGH); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,LOW);
delay(1);
if((int) digitalReadFast(45) != LOW) error(45,44,2);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(44,254);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,HIGH);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,LOW);
delay(1);
if((int) digitalReadFast2(45) != LOW) error(45,44,2);

analogWrite(45,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast(45,INPUT);
digitalWriteFast(45,LOW); 
pinModeFast(44,OUTPUT);
digitalWriteFast(44,HIGH);
delay(1);
if((int) digitalReadFast(45) != HIGH) error(45,44,3);

pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(45,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast2(45,INPUT);
digitalWriteFast2(45,LOW);
pinModeFast2(44,OUTPUT);
digitalWriteFast2(44,HIGH);
delay(1);
if((int) digitalReadFast2(45) != HIGH) error(45,44,3);

analogWrite(44,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast(44,INPUT);
digitalWriteFast(44,LOW); 
pinModeFast(45,OUTPUT);
digitalWriteFast(45,HIGH);
delay(1);
if((int) digitalReadFast(44) != HIGH) error(44,45,4);

pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(44,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(45,1);
pinModeFast2(44,INPUT);
digitalWriteFast2(44,LOW);
pinModeFast2(45,OUTPUT);
digitalWriteFast2(45,HIGH);
delay(1);
if((int) digitalReadFast2(44) != HIGH) error(44,45,4);

analogWrite(46,254);
pinModeFast(46,INPUT);
digitalWriteFast(46,HIGH); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,LOW);
delay(1);
if((int) digitalReadFast(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

analogWrite(46,254);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,HIGH);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,LOW);
delay(1);
if((int) digitalReadFast2(46) != LOW) error(46,47,1);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,HIGH); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,LOW);
delay(1);
if((int) digitalReadFast(47) != LOW) error(47,46,2);

analogWrite(46,254);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,HIGH);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,LOW);
delay(1);
if((int) digitalReadFast2(47) != LOW) error(47,46,2);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

pinModeFast(47,INPUT);
digitalWriteFast(47,LOW); 
pinModeFast(46,OUTPUT);
digitalWriteFast(46,HIGH);
delay(1);
if((int) digitalReadFast(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast2(47,INPUT);
digitalWriteFast2(47,LOW);
pinModeFast2(46,OUTPUT);
digitalWriteFast2(46,HIGH);
delay(1);
if((int) digitalReadFast2(47) != HIGH) error(47,46,3);

analogWrite(46,1);
pinModeFast(46,INPUT);
digitalWriteFast(46,LOW); 
pinModeFast(47,OUTPUT);
digitalWriteFast(47,HIGH);
delay(1);
if((int) digitalReadFast(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

analogWrite(46,1);
pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast2(46,INPUT);
digitalWriteFast2(46,LOW);
pinModeFast2(47,OUTPUT);
digitalWriteFast2(47,HIGH);
delay(1);
if((int) digitalReadFast2(46) != HIGH) error(46,47,4);

pinModeFast(48,INPUT);
digitalWriteFast(48,HIGH); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,LOW);
delay(1);
if((int) digitalReadFast(48) != LOW) error(48,49,1);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,HIGH);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,LOW);
delay(1);
if((int) digitalReadFast2(48) != LOW) error(48,49,1);

pinModeFast(49,INPUT);
digitalWriteFast(49,HIGH); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,LOW);
delay(1);
if((int) digitalReadFast(49) != LOW) error(49,48,2);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,HIGH);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,LOW);
delay(1);
if((int) digitalReadFast2(49) != LOW) error(49,48,2);

pinModeFast(49,INPUT);
digitalWriteFast(49,LOW); 
pinModeFast(48,OUTPUT);
digitalWriteFast(48,HIGH);
delay(1);
if((int) digitalReadFast(49) != HIGH) error(49,48,3);

pinModeFast2(49,INPUT);
digitalWriteFast2(49,LOW);
pinModeFast2(48,OUTPUT);
digitalWriteFast2(48,HIGH);
delay(1);
if((int) digitalReadFast2(49) != HIGH) error(49,48,3);

pinModeFast(48,INPUT);
digitalWriteFast(48,LOW); 
pinModeFast(49,OUTPUT);
digitalWriteFast(49,HIGH);
delay(1);
if((int) digitalReadFast(48) != HIGH) error(48,49,4);

pinModeFast2(48,INPUT);
digitalWriteFast2(48,LOW);
pinModeFast2(49,OUTPUT);
digitalWriteFast2(49,HIGH);
delay(1);
if((int) digitalReadFast2(48) != HIGH) error(48,49,4);

pinModeFast(50,INPUT);
digitalWriteFast(50,HIGH); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,LOW);
delay(1);
if((int) digitalReadFast(50) != LOW) error(50,51,1);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,HIGH);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,LOW);
delay(1);
if((int) digitalReadFast2(50) != LOW) error(50,51,1);

pinModeFast(51,INPUT);
digitalWriteFast(51,HIGH); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,LOW);
delay(1);
if((int) digitalReadFast(51) != LOW) error(51,50,2);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,HIGH);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,LOW);
delay(1);
if((int) digitalReadFast2(51) != LOW) error(51,50,2);

pinModeFast(51,INPUT);
digitalWriteFast(51,LOW); 
pinModeFast(50,OUTPUT);
digitalWriteFast(50,HIGH);
delay(1);
if((int) digitalReadFast(51) != HIGH) error(51,50,3);

pinModeFast2(51,INPUT);
digitalWriteFast2(51,LOW);
pinModeFast2(50,OUTPUT);
digitalWriteFast2(50,HIGH);
delay(1);
if((int) digitalReadFast2(51) != HIGH) error(51,50,3);

pinModeFast(50,INPUT);
digitalWriteFast(50,LOW); 
pinModeFast(51,OUTPUT);
digitalWriteFast(51,HIGH);
delay(1);
if((int) digitalReadFast(50) != HIGH) error(50,51,4);

pinModeFast2(50,INPUT);
digitalWriteFast2(50,LOW);
pinModeFast2(51,OUTPUT);
digitalWriteFast2(51,HIGH);
delay(1);
if((int) digitalReadFast2(50) != HIGH) error(50,51,4);

pinModeFast(52,INPUT);
digitalWriteFast(52,HIGH); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,LOW);
delay(1);
if((int) digitalReadFast(52) != LOW) error(52,53,1);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,HIGH);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,LOW);
delay(1);
if((int) digitalReadFast2(52) != LOW) error(52,53,1);

pinModeFast(53,INPUT);
digitalWriteFast(53,HIGH); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,LOW);
delay(1);
if((int) digitalReadFast(53) != LOW) error(53,52,2);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,HIGH);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,LOW);
delay(1);
if((int) digitalReadFast2(53) != LOW) error(53,52,2);

pinModeFast(53,INPUT);
digitalWriteFast(53,LOW); 
pinModeFast(52,OUTPUT);
digitalWriteFast(52,HIGH);
delay(1);
if((int) digitalReadFast(53) != HIGH) error(53,52,3);

pinModeFast2(53,INPUT);
digitalWriteFast2(53,LOW);
pinModeFast2(52,OUTPUT);
digitalWriteFast2(52,HIGH);
delay(1);
if((int) digitalReadFast2(53) != HIGH) error(53,52,3);

pinModeFast(52,INPUT);
digitalWriteFast(52,LOW); 
pinModeFast(53,OUTPUT);
digitalWriteFast(53,HIGH);
delay(1);
if((int) digitalReadFast(52) != HIGH) error(52,53,4);

pinModeFast2(52,INPUT);
digitalWriteFast2(52,LOW);
pinModeFast2(53,OUTPUT);
digitalWriteFast2(53,HIGH);
delay(1);
if((int) digitalReadFast2(52) != HIGH) error(52,53,4);

pinModeFast(54,INPUT);
digitalWriteFast(54,HIGH); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,LOW);
delay(1);
if((int) digitalReadFast(54) != LOW) error(54,57,1);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,HIGH);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,LOW);
delay(1);
if((int) digitalReadFast2(54) != LOW) error(54,57,1);

pinModeFast(57,INPUT);
digitalWriteFast(57,HIGH); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,LOW);
delay(1);
if((int) digitalReadFast(57) != LOW) error(57,54,2);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,HIGH);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,LOW);
delay(1);
if((int) digitalReadFast2(57) != LOW) error(57,54,2);

pinModeFast(57,INPUT);
digitalWriteFast(57,LOW); 
pinModeFast(54,OUTPUT);
digitalWriteFast(54,HIGH);
delay(1);
if((int) digitalReadFast(57) != HIGH) error(57,54,3);

pinModeFast2(57,INPUT);
digitalWriteFast2(57,LOW);
pinModeFast2(54,OUTPUT);
digitalWriteFast2(54,HIGH);
delay(1);
if((int) digitalReadFast2(57) != HIGH) error(57,54,3);

pinModeFast(54,INPUT);
digitalWriteFast(54,LOW); 
pinModeFast(57,OUTPUT);
digitalWriteFast(57,HIGH);
delay(1);
if((int) digitalReadFast(54) != HIGH) error(54,57,4);

pinModeFast2(54,INPUT);
digitalWriteFast2(54,LOW);
pinModeFast2(57,OUTPUT);
digitalWriteFast2(57,HIGH);
delay(1);
if((int) digitalReadFast2(54) != HIGH) error(54,57,4);

pinModeFast(55,INPUT);
digitalWriteFast(55,HIGH); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,LOW);
delay(1);
if((int) digitalReadFast(55) != LOW) error(55,58,1);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,HIGH);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,LOW);
delay(1);
if((int) digitalReadFast2(55) != LOW) error(55,58,1);

pinModeFast(58,INPUT);
digitalWriteFast(58,HIGH); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,LOW);
delay(1);
if((int) digitalReadFast(58) != LOW) error(58,55,2);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,HIGH);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,LOW);
delay(1);
if((int) digitalReadFast2(58) != LOW) error(58,55,2);

pinModeFast(58,INPUT);
digitalWriteFast(58,LOW); 
pinModeFast(55,OUTPUT);
digitalWriteFast(55,HIGH);
delay(1);
if((int) digitalReadFast(58) != HIGH) error(58,55,3);

pinModeFast2(58,INPUT);
digitalWriteFast2(58,LOW);
pinModeFast2(55,OUTPUT);
digitalWriteFast2(55,HIGH);
delay(1);
if((int) digitalReadFast2(58) != HIGH) error(58,55,3);

pinModeFast(55,INPUT);
digitalWriteFast(55,LOW); 
pinModeFast(58,OUTPUT);
digitalWriteFast(58,HIGH);
delay(1);
if((int) digitalReadFast(55) != HIGH) error(55,58,4);

pinModeFast2(55,INPUT);
digitalWriteFast2(55,LOW);
pinModeFast2(58,OUTPUT);
digitalWriteFast2(58,HIGH);
delay(1);
if((int) digitalReadFast2(55) != HIGH) error(55,58,4);

pinModeFast(56,INPUT);
digitalWriteFast(56,HIGH); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,LOW);
delay(1);
if((int) digitalReadFast(56) != LOW) error(56,59,1);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,HIGH);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,LOW);
delay(1);
if((int) digitalReadFast2(56) != LOW) error(56,59,1);

pinModeFast(59,INPUT);
digitalWriteFast(59,HIGH); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,LOW);
delay(1);
if((int) digitalReadFast(59) != LOW) error(59,56,2);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,HIGH);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,LOW);
delay(1);
if((int) digitalReadFast2(59) != LOW) error(59,56,2);

pinModeFast(59,INPUT);
digitalWriteFast(59,LOW); 
pinModeFast(56,OUTPUT);
digitalWriteFast(56,HIGH);
delay(1);
if((int) digitalReadFast(59) != HIGH) error(59,56,3);

pinModeFast2(59,INPUT);
digitalWriteFast2(59,LOW);
pinModeFast2(56,OUTPUT);
digitalWriteFast2(56,HIGH);
delay(1);
if((int) digitalReadFast2(59) != HIGH) error(59,56,3);

pinModeFast(56,INPUT);
digitalWriteFast(56,LOW); 
pinModeFast(59,OUTPUT);
digitalWriteFast(59,HIGH);
delay(1);
if((int) digitalReadFast(56) != HIGH) error(56,59,4);

pinModeFast2(56,INPUT);
digitalWriteFast2(56,LOW);
pinModeFast2(59,OUTPUT);
digitalWriteFast2(59,HIGH);
delay(1);
if((int) digitalReadFast2(56) != HIGH) error(56,59,4);

pinModeFast(60,INPUT);
digitalWriteFast(60,HIGH); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,LOW);
delay(1);
if((int) digitalReadFast(60) != LOW) error(60,63,1);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,HIGH);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,LOW);
delay(1);
if((int) digitalReadFast2(60) != LOW) error(60,63,1);

pinModeFast(63,INPUT);
digitalWriteFast(63,HIGH); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,LOW);
delay(1);
if((int) digitalReadFast(63) != LOW) error(63,60,2);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,HIGH);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,LOW);
delay(1);
if((int) digitalReadFast2(63) != LOW) error(63,60,2);

pinModeFast(63,INPUT);
digitalWriteFast(63,LOW); 
pinModeFast(60,OUTPUT);
digitalWriteFast(60,HIGH);
delay(1);
if((int) digitalReadFast(63) != HIGH) error(63,60,3);

pinModeFast2(63,INPUT);
digitalWriteFast2(63,LOW);
pinModeFast2(60,OUTPUT);
digitalWriteFast2(60,HIGH);
delay(1);
if((int) digitalReadFast2(63) != HIGH) error(63,60,3);

pinModeFast(60,INPUT);
digitalWriteFast(60,LOW); 
pinModeFast(63,OUTPUT);
digitalWriteFast(63,HIGH);
delay(1);
if((int) digitalReadFast(60) != HIGH) error(60,63,4);

pinModeFast2(60,INPUT);
digitalWriteFast2(60,LOW);
pinModeFast2(63,OUTPUT);
digitalWriteFast2(63,HIGH);
delay(1);
if((int) digitalReadFast2(60) != HIGH) error(60,63,4);

pinModeFast(61,INPUT);
digitalWriteFast(61,HIGH); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,LOW);
delay(1);
if((int) digitalReadFast(61) != LOW) error(61,64,1);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,HIGH);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,LOW);
delay(1);
if((int) digitalReadFast2(61) != LOW) error(61,64,1);

pinModeFast(64,INPUT);
digitalWriteFast(64,HIGH); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,LOW);
delay(1);
if((int) digitalReadFast(64) != LOW) error(64,61,2);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,HIGH);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,LOW);
delay(1);
if((int) digitalReadFast2(64) != LOW) error(64,61,2);

pinModeFast(64,INPUT);
digitalWriteFast(64,LOW); 
pinModeFast(61,OUTPUT);
digitalWriteFast(61,HIGH);
delay(1);
if((int) digitalReadFast(64) != HIGH) error(64,61,3);

pinModeFast2(64,INPUT);
digitalWriteFast2(64,LOW);
pinModeFast2(61,OUTPUT);
digitalWriteFast2(61,HIGH);
delay(1);
if((int) digitalReadFast2(64) != HIGH) error(64,61,3);

pinModeFast(61,INPUT);
digitalWriteFast(61,LOW); 
pinModeFast(64,OUTPUT);
digitalWriteFast(64,HIGH);
delay(1);
if((int) digitalReadFast(61) != HIGH) error(61,64,4);

pinModeFast2(61,INPUT);
digitalWriteFast2(61,LOW);
pinModeFast2(64,OUTPUT);
digitalWriteFast2(64,HIGH);
delay(1);
if((int) digitalReadFast2(61) != HIGH) error(61,64,4);

pinModeFast(62,INPUT);
digitalWriteFast(62,HIGH); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,LOW);
delay(1);
if((int) digitalReadFast(62) != LOW) error(62,65,1);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,HIGH);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,LOW);
delay(1);
if((int) digitalReadFast2(62) != LOW) error(62,65,1);

pinModeFast(65,INPUT);
digitalWriteFast(65,HIGH); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,LOW);
delay(1);
if((int) digitalReadFast(65) != LOW) error(65,62,2);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,HIGH);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,LOW);
delay(1);
if((int) digitalReadFast2(65) != LOW) error(65,62,2);

pinModeFast(65,INPUT);
digitalWriteFast(65,LOW); 
pinModeFast(62,OUTPUT);
digitalWriteFast(62,HIGH);
delay(1);
if((int) digitalReadFast(65) != HIGH) error(65,62,3);

pinModeFast2(65,INPUT);
digitalWriteFast2(65,LOW);
pinModeFast2(62,OUTPUT);
digitalWriteFast2(62,HIGH);
delay(1);
if((int) digitalReadFast2(65) != HIGH) error(65,62,3);

pinModeFast(62,INPUT);
digitalWriteFast(62,LOW); 
pinModeFast(65,OUTPUT);
digitalWriteFast(65,HIGH);
delay(1);
if((int) digitalReadFast(62) != HIGH) error(62,65,4);

pinModeFast2(62,INPUT);
digitalWriteFast2(62,LOW);
pinModeFast2(65,OUTPUT);
digitalWriteFast2(65,HIGH);
delay(1);
if((int) digitalReadFast2(62) != HIGH) error(62,65,4);

pinModeFast(66,INPUT);
digitalWriteFast(66,HIGH); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,LOW);
delay(1);
if((int) digitalReadFast(66) != LOW) error(66,69,1);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,HIGH);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,LOW);
delay(1);
if((int) digitalReadFast2(66) != LOW) error(66,69,1);

pinModeFast(69,INPUT);
digitalWriteFast(69,HIGH); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,LOW);
delay(1);
if((int) digitalReadFast(69) != LOW) error(69,66,2);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,HIGH);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,LOW);
delay(1);
if((int) digitalReadFast2(69) != LOW) error(69,66,2);

pinModeFast(69,INPUT);
digitalWriteFast(69,LOW); 
pinModeFast(66,OUTPUT);
digitalWriteFast(66,HIGH);
delay(1);
if((int) digitalReadFast(69) != HIGH) error(69,66,3);

pinModeFast2(69,INPUT);
digitalWriteFast2(69,LOW);
pinModeFast2(66,OUTPUT);
digitalWriteFast2(66,HIGH);
delay(1);
if((int) digitalReadFast2(69) != HIGH) error(69,66,3);

pinModeFast(66,INPUT);
digitalWriteFast(66,LOW); 
pinModeFast(69,OUTPUT);
digitalWriteFast(69,HIGH);
delay(1);
if((int) digitalReadFast(66) != HIGH) error(66,69,4);

pinModeFast2(66,INPUT);
digitalWriteFast2(66,LOW);
pinModeFast2(69,OUTPUT);
digitalWriteFast2(69,HIGH);
delay(1);
if((int) digitalReadFast2(66) != HIGH) error(66,69,4);

pinModeFast(67,INPUT);
digitalWriteFast(67,HIGH); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,LOW);
delay(1);
if((int) digitalReadFast(67) != LOW) error(67,68,1);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,HIGH);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,LOW);
delay(1);
if((int) digitalReadFast2(67) != LOW) error(67,68,1);

pinModeFast(68,INPUT);
digitalWriteFast(68,HIGH); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,LOW);
delay(1);
if((int) digitalReadFast(68) != LOW) error(68,67,2);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,HIGH);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,LOW);
delay(1);
if((int) digitalReadFast2(68) != LOW) error(68,67,2);

pinModeFast(68,INPUT);
digitalWriteFast(68,LOW); 
pinModeFast(67,OUTPUT);
digitalWriteFast(67,HIGH);
delay(1);
if((int) digitalReadFast(68) != HIGH) error(68,67,3);

pinModeFast2(68,INPUT);
digitalWriteFast2(68,LOW);
pinModeFast2(67,OUTPUT);
digitalWriteFast2(67,HIGH);
delay(1);
if((int) digitalReadFast2(68) != HIGH) error(68,67,3);

pinModeFast(67,INPUT);
digitalWriteFast(67,LOW); 
pinModeFast(68,OUTPUT);
digitalWriteFast(68,HIGH);
delay(1);
if((int) digitalReadFast(67) != HIGH) error(67,68,4);

pinModeFast2(67,INPUT);
digitalWriteFast2(67,LOW);
pinModeFast2(68,OUTPUT);
digitalWriteFast2(68,HIGH);
delay(1);
if((int) digitalReadFast2(67) != HIGH) error(67,68,4);


//================================the output from progprog.py goes above===============
for(int i=20; i<54;i +=2) {   //now a loop that doesn't know pins numbers--much less extensive; degenerate case.
  pinModeFast2(i,INPUT);
  digitalWriteFast2(i,LOW);
  pinModeFast2(i+1,OUTPUT);
  digitalWriteFast2(i+1,HIGH);
  delay(10);
  q=digitalReadFast2(i);
  if (q != HIGH) error(i,i+1,5);
}
for(int j=0; j< 17; j+=6) {
  for(int i=0; i<3;i++){
      int a = 2+i+j;
      int b = 5+i+j;
      pinModeFast2(a,INPUT);
      digitalWriteFast2(a,LOW);
      pinModeFast2(b,OUTPUT);
      digitalWriteFast2(b,HIGH);
      delay(10);
      q=digitalReadFast2(a);
      if (q != HIGH) error(a,b,6);
}
}
Serial.println("Finished cycle C through pins.");
}
