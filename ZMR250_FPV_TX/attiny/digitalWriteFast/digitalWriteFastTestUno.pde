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



//================================the output from progprog.py goes above===============

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
Serial.println("Finished one cycle through pins.");
}
