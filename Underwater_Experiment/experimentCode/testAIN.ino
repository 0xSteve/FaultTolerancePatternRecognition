//#include <Wire.h>

const int AIN0 = A5;
const int AIN1 = A1;
const int AIN2 = A2;
const int AIN3 = A3;
const int AIN4 = A4;

float temp1, temp2, temp3, temp4, temp5;
int input = NULL;
void setup(void)
{
    Serial.begin(9600);
    //Serial.println("Hello!"); 
    //Serial.println("Getting single-ended readings");
    //Serial.println("ADC Range: +/- 5.0V (1 bit = 3.11mV)(0-1605)");
    Serial.flush();
}
 
void loop(void)
{   
     while(Serial.available() > 0) {
        // read the incoming byte:
        input = Serial.read();
    //use the following line to debug serial.
    //Serial.print("You sent: "); Serial.println(input);
    if(input == 176){
        temp1 = ((analogRead(AIN0) / 1024.0) * 5 - 0.5) * 100;
        temp2 = ((analogRead(AIN1) / 1024.0) * 5 - 0.5) * 100;
        temp3 = ((analogRead(AIN2) / 1024.0) * 5 - 0.5) * 100;
        temp4 = ((analogRead(AIN3) / 1024.0) * 5 - 0.5) * 100;
        temp5 = ((analogRead(AIN4) / 1024.0) * 5 - 0.5) * 100;

        //Serial.print("AIN0,"); 
        Serial.print(temp1);
        Serial.print(","); Serial.print(temp2);
        Serial.print(","); Serial.print(temp3);
        Serial.print(","); Serial.print(temp4);
        Serial.print(","); Serial.println(temp5);
        Serial.flush();
        //delay(100);
    }}
    
}
