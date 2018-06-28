//#include <Wire.h>

const int AIN0 = A0;
const int AIN1 = A1;
const int AIN2 = A2;
const int AIN3 = A3;
const int AIN4 = A4;

float temp1, temp2, temp3, temp4, temp5;

void setup(void)
{
    Serial.begin(9600);
    Serial.println("Hello!"); 
    Serial.println("Getting single-ended readings");
    //Serial.println("ADC Range: +/- 5.0V (1 bit = 3.11mV)(0-1605)");

}
 
void loop(void)
{
    Serial.println(analogRead(AIN0));
    temp1 = ((analogRead(AIN0) / 1024.0) * 5 - 0.5) * 100;
    temp2 = ((analogRead(AIN1) / 1024.0) * 5 - 0.5) * 100;
    temp3 = ((analogRead(AIN2) / 1024.0) * 5 - 0.5) * 100;
    temp4 = ((analogRead(AIN3) / 1024.0) * 5 - 0.5) * 100;
    temp5 = ((analogRead(AIN4) / 1024.0) * 5 - 0.5) * 100;

    Serial.print("TEMPERATURE OF AIN0: "); Serial.println(temp1);
    Serial.print("TEMPERATURE OF AIN1: "); Serial.println(temp2);
    Serial.print("TEMPERATURE OF AIN2: "); Serial.println(temp3);
    Serial.print("TEMPERATURE OF AIN3: "); Serial.println(temp4);
    Serial.print("TEMPERATURE OF AIN4: "); Serial.println(temp5);

    delay(5000);
}
