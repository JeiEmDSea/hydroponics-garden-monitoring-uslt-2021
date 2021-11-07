#include "DHT.h"
#include <SoftwareSerial.h>
#include <ArduinoJson.h>

#define calibration false
SoftwareSerial NodeMCU(3, 4);

// ! SOIL MOISTURE SENSOR
#define soilMoistureSensorPin A0
#define soilMoistureSensorPower 52
int soilMoisture;

// ! WATER LEVEL SENSOR
#define waterLevelSensorPin A1
#define waterLevelSensorPower 53
int waterLevel;

// ! AM2302 (DHT22)
#define dhtPin 2
// // #define dhtPower 48
#define dhtType DHT22
DHT dht22(dhtPin, dhtType);
float humidity;
float temperature;
float heatIndex;

// ! pH SENSOR
#define phSensorPin A2
// // #define phSensorPower 46
float phValue;

void setup()
{
  Serial.begin(9600);
  Serial1.begin(9600);
  NodeMCU.begin(9600);
  setPowerPins();
  dht22.begin();

  delay(2000);
}

void loop()
{
  getSoilMoisture();
  getWaterLevel();
  gethumidityAndTemperature();
  // * getpH();

  sendData();
  delay(10000);

  if (Serial1.available())
  {
    DynamicJsonDocument settings(1024);
    DeserializationError err = deserializeJson(settings, Serial1);

    if (err == DeserializationError::Ok)
      Serial.println(settings.as<String>());
  }
}

void sendData()
{
  StaticJsonDocument<300> sensorData;

  sensorData["gardenId"] = "plantronics1";
  sensorData["soilMoisture"] = soilMoisture;
  sensorData["waterLevel"] = waterLevel;
  sensorData["humidity"] = humidity;
  sensorData["temperature"] = temperature;
  // * sensorData["phValue"] = phValue;

  serializeJson(sensorData, NodeMCU);
}

void getSoilMoisture()
{
  digitalWrite(soilMoistureSensorPower, HIGH);
  delay(20);

  long sensorVal = analogRead(soilMoistureSensorPin);
  long sensorWet = 335; // ? wet soil
  long sensorDry = 999; // ? dry soil

  if (calibration)
    printValueToSerial("sensorVal", sensorVal);

  soilMoisture = (sensorVal > sensorDry) ? 0 : (sensorVal < sensorWet) ? 100
                 : map(sensorVal, sensorDry, sensorWet, 0, 100);
  digitalWrite(soilMoistureSensorPower, LOW);
}

void getWaterLevel()
{
  digitalWrite(waterLevelSensorPower, HIGH);
  delay(20);

  long sensorVal = analogRead(waterLevelSensorPin);
  long sensorHigh = 95; // ? fully submerged
  long sensorLow = 32;  // ? partially submerged (reads zero when no water is touched)

  if (calibration)
    printValueToSerial("waterLevel", sensorVal);

  waterLevel = (sensorVal == 0) ? 0 : map(sensorVal, sensorLow, sensorHigh, 0, 100);
  digitalWrite(waterLevelSensorPower, LOW);
}

void gethumidityAndTemperature()
{
  humidity = dht22.readHumidity();
  temperature = dht22.readTemperature();
  heatIndex = dht22.computeHeatIndex();

  if (calibration)
  {
    printValueToSerial("humidity", humidity);
    printValueToSerial("temperature", temperature);
  }
}

void getpH()
{
  unsigned long int avgValue = 0;
  int buf[10], temp;

  for (int i = 0; i < 10; i++) // * Get 10 sample value from the sensor for smooth the value
  {
    buf[i] = analogRead(phSensorPin);
    delay(10);
  }

  for (int i = 0; i < 9; i++) // * sort the analog from small to large
  {
    for (int j = i + 1; j < 10; j++)
    {
      if (buf[i] > buf[j])
      {
        temp = buf[i];
        buf[i] = buf[j];
        buf[j] = temp;
      }
    }
  }

  for (int i = 2; i < 8; i++) // * take the average value of 6 center sample
    avgValue += buf[i];
  float phValue = (float)avgValue * 5.0 / 1024 / 6; // * convert the analog into millivolt
  phValue = 3.5 * phValue;

  if (calibration)
    printValueToSerial("phValue", phValue);
}

void setPowerPins()
{
  // ! SOIL MOISTURE SENSOR
  // ? initially off
  pinMode(soilMoistureSensorPower, OUTPUT);
  digitalWrite(soilMoistureSensorPower, LOW);

  // ! WATER LEVEL SENSOR
  // ? initially off
  pinMode(waterLevelSensorPower, OUTPUT);
  digitalWrite(waterLevelSensorPower, LOW);

  // // // ! AM2302 (DHT22)
  // // // ? initially on
  // // pinMode(dhtPower, OUTPUT);
  // // digitalWrite(dhtPower, HIGH);

  // // // ! pH SENSOR
  // // // ? initially on
  // // pinMode(phSensorPower, OUTPUT);
  // // digitalWrite(phSensorPower, HIGH);
}

void printValueToSerial(String sensor, long value)
{
  Serial.print(sensor);
  Serial.print(" = ");
  Serial.println(value);
}
