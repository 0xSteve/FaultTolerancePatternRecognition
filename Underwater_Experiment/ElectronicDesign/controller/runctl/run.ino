#include <Wire.h>
#include <Adafruit_ADS1015.h>
 
Adafruit_ADS1015 ads1015;  	// Construct an ads1015 at the default address: 0x48
 
void setup(void)
{
  ads1015.begin();  // Initialize ads1015
}
