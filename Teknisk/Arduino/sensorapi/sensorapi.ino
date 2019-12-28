#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

// We'll use SoftwareSerial to communicate with the XBee:
#include <SoftwareSerial.h>
// XBee's DOUT (TX) is connected to pin 2 (Arduino's Software RX)
// XBee's DIN (RX) is connected to pin 3 (Arduino's Software TX)
SoftwareSerial XBee(2, 3); // RX, TX

/* This driver uses the Adafruit unified sensor library (Adafruit_Sensor),
   which provides a common 'type' for sensor data and some helper functions.

   To use this driver you will also need to download the Adafruit_Sensor
   library and include it in your libraries folder.

   You should also assign a unique ID to this sensor for use with
   the Adafruit Sensor API so that you can identify this particular
   sensor in any data logs, etc.  To assign a unique ID, simply
   provide an appropriate value in the constructor below (12345
   is used by default in this example).

   Connections
   ===========
   Connect SCL to analog 5
   Connect SDA to analog 4
   Connect VDD to 3-5V DC
   Connect GROUND to common ground

   History
   =======
   2015/MAR/03  - First release (KTOWN)
   2015/AUG/27  - Added calibration and system status helpers
*/

/* Set the delay between fresh samples */
#define BNO055_SAMPLERATE_DELAY_MS (25)

Adafruit_BNO055 bno = Adafruit_BNO055(55);

/**************************************************************************/
/*
    Displays some basic information on this sensor from the unified
    sensor API sensor_t type (see Adafruit_Sensor for more information)
*/
/**************************************************************************/
void displaySensorDetails(void)
{
  sensor_t sensor;
  bno.getSensor(&sensor);
  XBee.println("------------------------------------");
  XBee.print  ("Sensor:       "); XBee.println(sensor.name);
  XBee.print  ("Driver Ver:   "); XBee.println(sensor.version);
  XBee.print  ("Unique ID:    "); XBee.println(sensor.sensor_id);
  XBee.print  ("Max Value:    "); XBee.print(sensor.max_value); XBee.println(" xxx");
  XBee.print  ("Min Value:    "); XBee.print(sensor.min_value); XBee.println(" xxx");
  XBee.print  ("Resolution:   "); XBee.print(sensor.resolution); XBee.println(" xxx");
  XBee.println("------------------------------------");
  XBee.println("");
  delay(500);
}

/**************************************************************************/
/*
    Display sensor calibration status
*/
/**************************************************************************/
void displayCalStatus(void)
{
  /* Get the four calibration values (0..3) */
  /* Any sensor data reporting 0 should be ignored, */
  /* 3 means 'fully calibrated" */
  uint8_t system, gyro, accel, mag;
  system = gyro = accel = mag = 0;
  bno.getCalibration(&system, &gyro, &accel, &mag);

  /* The data should be ignored until the system calibration is > 0 */
  XBee.print("\t");
  if (!system)
  {
    XBee.print("! ");
  }

  /* Display the individual values */
  XBee.print("Sys:");
  XBee.print(system, DEC);
  XBee.print(" G:");
  XBee.print(gyro, DEC);
  XBee.print(" A:");
  XBee.print(accel, DEC);
  XBee.print(" M:");
  XBee.print(mag, DEC);
}

/**************************************************************************/
/*
    Arduino setup function (automatically called at startup)
*/
/**************************************************************************/
void setup(void)
{
  XBee.begin(9600);
  XBee.println("Orientation Sensor Test"); XBee.println("");

  /* Initialise the sensor */
  if(!bno.begin())
  {
    /* There was a problem detecting the BNO055 ... check your connections */
    XBee.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
    while(1);
  }

  delay(1000);

  /* Use external crystal for better accuracy */
  bno.setExtCrystalUse(true);

  /* Display some basic information on this sensor */
  displaySensorDetails();
}

/**************************************************************************/
/*
    Arduino loop function, called once 'setup' is complete (your own code
    should go here)
*/
/**************************************************************************/
void loop(void)
{
  /* Get a new sensor event */
  sensors_event_t event;
  bno.getEvent(&event);

  /* Board layout:
         +----------+
         |         *| RST   PITCH  ROLL  HEADING
     ADR |*        *| SCL
     INT |*        *| SDA     ^            /->
     PS1 |*        *| GND     |            |
     PS0 |*        *| 3VO     Y    Z-->    \-X
         |         *| VIN
         +----------+
  */

  /* The processing sketch expects data as roll, pitch, heading */
  XBee.print(F("Orientation: "));
  XBee.print((float)event.orientation.x);
  XBee.print(F(" "));
  XBee.print((float)event.orientation.y);
  XBee.print(F(" "));
  XBee.print((float)event.orientation.z);
  XBee.println(F(""));

  /* Also send calibration data for each sensor. */
  uint8_t sys, gyro, accel, mag = 0;
  bno.getCalibration(&sys, &gyro, &accel, &mag);
  XBee.print(F("Calibration: "));
  XBee.print(sys, DEC);
  XBee.print(F(" "));
  XBee.print(gyro, DEC);
  XBee.print(F(" "));
  XBee.print(accel, DEC);
  XBee.print(F(" "));
  XBee.println(mag, DEC);

  delay(BNO055_SAMPLERATE_DELAY_MS);
}
