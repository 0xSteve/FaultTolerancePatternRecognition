//#include <Wire.h>

const int AIN0 = A0;
    const int AIN1 = A1;
    const int AIN2 = A2;
    const int AIN3 = A3;

    float temp1, temp2, temp3, val;
    int count = 0;
    float average = 0;
    float average_temp = 0;
    int sum = 0;
    float temp_sum = 0.0;
void setup(void)
{
    Serial.begin(9600);
    Serial.println("Hello!"); 
    Serial.println("Getting single-ended readings");
    //Serial.println("ADC Range: +/- 5.0V (1 bit = 3.11mV)(0-1605)");

}
 
void loop(void)
{
    val = analogRead(AIN0);
    Serial.println(val);
    Serial.print("The temp is: ");
    temp1 = ((val / 615.0) * 5 - 0.5) * 100;
    temp_sum += temp1;
    Serial.println(temp1);
    count += 1;
    sum += val;
    delay(1000);
    if (count % 10 == 0) {
        average = ((sum * 1.0) / count);
        average_temp = temp_sum / count;
        temp_sum = 0;
        sum = 0;
        count = 0;
        
        Serial.print("The average is: ");
        Serial.println(average);
        Serial.print("The average temp is: ");
        Serial.println(average_temp);
        average = 0;
        average_temp = 0;
        delay(5000);
    }
}
