#include <Wire.h>
#include "Adafruit_ADS1015.h"
 
Adafruit_ADS1015 ads1015;
Adafruit_ADS1015 ads1015_2(0x49);
Adafruit_ADS1015 ads1015_3(0x4B);

void setup(void)
{
  Serial.begin(9600);
  Serial.println("Hello!");
  
  Serial.println("Getting single-ended readings");
  Serial.println("ADC Range: +/- 5.0V (1 bit = 3.11mV)(0-1605)");
  ads1015.begin();
  ads1015_2.begin();
  ads1015_3.begin();
}
 
void loop(void)
{
  int16_t adc0, adc1, adc2, adc3, adc10, adc11, adc12, adc13, adc20, adc21,
  adc22, adc23;
 
  adc0 = ads1015.readADC_SingleEnded(0);
  adc1 = ads1015.readADC_SingleEnded(1);
  adc2 = ads1015.readADC_SingleEnded(2);
  adc3 = ads1015.readADC_SingleEnded(3);
  float v3, temp3;
  v3 = (adc3 / 1606.0) * 5;  //typecast to a double.
  temp3 = (v3 - 0.5) * 100;
  Serial.print("AIN3 TEMP: "); Serial.println(temp3);
  Serial.print("AIN0: "); Serial.println(adc0);
  Serial.print("AIN1: "); Serial.println(adc1);
  Serial.print("AIN2: "); Serial.println(adc2);
  Serial.print("AIN3: "); Serial.println(adc3);
  Serial.println(" ");
  adc10 = ads1015_2.readADC_SingleEnded(0);
  adc11 = ads1015_2.readADC_SingleEnded(1);
  adc12 = ads1015_2.readADC_SingleEnded(2);
  adc13 = ads1015_2.readADC_SingleEnded(3);
  Serial.print("AIN10: "); Serial.println(adc10);
  Serial.print("AIN11: "); Serial.println(adc11);
  Serial.print("AIN12: "); Serial.println(adc12);
  Serial.print("AIN13: "); Serial.println(adc13);
  Serial.println(" ");
  adc20 = ads1015_3.readADC_SingleEnded(0);
  adc21 = ads1015_3.readADC_SingleEnded(1);
  adc22 = ads1015_3.readADC_SingleEnded(2);
  adc23 = ads1015_3.readADC_SingleEnded(3);
  Serial.print("AIN20: "); Serial.println(adc20);
  Serial.print("AIN21: "); Serial.println(adc21);
  Serial.print("AIN22: "); Serial.println(adc22);
  Serial.print("AIN23: "); Serial.println(adc23);
  Serial.println(" ");
  delay(5000);
}
