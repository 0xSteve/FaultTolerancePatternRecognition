//#include <Wire.h>

const int AIN0 = A0;
    const int AIN1 = A1;
    const int AIN2 = A2;
    const int AIN3 = A3;

    float temp1, temp2, temp3;

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
    temp1 = ((analogRead(AIN0) / 986.0) * 5 - 0.5) * 100;
    temp2 = ((analogRead(AIN1) / 1024.0) * 5 - 0.5) * 100;
    temp3 = ((analogRead(AIN2) / 1024.0) * 5 - 0.5) * 100;
    Serial.print("TEMPERATURE OF AIN0: "); Serial.println(temp1);
    Serial.print("TEMPERATURE OF AIN1: "); Serial.println(temp2);
    Serial.print("TEMPERATURE OF AIN2: "); Serial.println(temp3);
    delay(5000);
}
