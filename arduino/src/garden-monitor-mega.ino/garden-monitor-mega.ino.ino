#include "DHT.h"
#include <SoftwareSerial.h>
#include <ArduinoJson.h>
#include <EEPROM.h>
#include "GravityTDS.h"
#include <Relay.h>

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
#define dhtType DHT22
DHT dht22(dhtPin, dhtType);
float humidity;
float temperature;
float heatIndex;

// ! pH SENSOR
#define phSensorPin A2
float phLevel;

// ! TDS SENSOR
#define tdsSensorPin A3
GravityTDS gravityTds;
float tdsTemperature = 25;
float tds = 0;

// ! RELAY
Relay phUpPump = Relay(24);
Relay phDownPump = Relay(26);
Relay nutrientPump = Relay(28);
Relay waterPumpA = Relay(30);
Relay waterPumpB = Relay(32);
Relay fan = Relay(34);
Relay lights = Relay(36);

// ! LIMITS
float maxSoilMoisture = 80;
float minSoilMoisture = 20;
float maxwaterLevel = 80;
float minWaterLevel = 20;
float maxTemperature = 30;
float maxPh = 9;
float minPh = 4;
float minTds = 50;

void setup()
{
  Serial.begin(9600);
  Serial1.begin(9600);
  NodeMCU.begin(9600);
  setPowerPins();
  dht22.begin();

  gravityTds.setPin(tdsSensorPin);
  gravityTds.setAref(5.0);      // * reference voltage on ADC, default 5.0V on Arduino UNO
  gravityTds.setAdcRange(1024); // * 1024 for 10bit ADC;4096 for 12bit ADC
  gravityTds.begin();           // * initialization

  delay(2000);
}

void loop()
{
  getSoilMoisture();
  getWaterLevel();
  gethumidityAndTemperature();
  getpH();
  getTds();

  sendData();

  processSoilMoisture();
  processWaterLevel();
  processTempAndHumidity();
  processPh();
  processTds();

  delay(10000);

  parseSettingsData();
}

void sendData()
{
  StaticJsonDocument<300> sensorData;

  sensorData["gardenId"] = "plantronics1";
  sensorData["soilMoisture"] = soilMoisture;
  sensorData["waterLevel"] = waterLevel;
  sensorData["humidity"] = humidity;
  sensorData["temperature"] = temperature;
  sensorData["phLevel"] = phLevel;
  sensorData["tds"] = tds;

  serializeJson(sensorData, NodeMCU);
}

void parseSettingsData()
{
  if (Serial1.available())
  {
    DynamicJsonDocument settings(1024);
    DeserializationError err = deserializeJson(settings, Serial1);

    if (err == DeserializationError::Ok)
    {
      Serial.println(settings.as<String>());

      maxSoilMoisture = settings["a"].as<float>();
      minSoilMoisture = settings["b"].as<float>();
      maxwaterLevel = settings["c"].as<float>();
      minWaterLevel = settings["d"].as<float>();
      maxTemperature = settings["e"].as<float>();
      maxPh = settings["f"].as<float>();
      minPh = settings["g"].as<float>();
      minTds = settings["h"].as<float>();
    }
  }
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
  phLevel = 3.5 * phValue;

  if (calibration)
    printValueToSerial("phLevel", phLevel);
}

void getTds()
{
  gravityTds.setTemperature(tdsTemperature);
  gravityTds.update();
  tds = gravityTds.getTdsValue();
}

void processSoilMoisture()
{
  if (soilMoisture < minSoilMoisture)
  {
    waterPumpA.on();
    delay(2000);
    processSoilMoisture();
  }
  else if (soilMoisture >= maxSoilMoisture)
  {
    waterPumpA.off();
  }

  return;
}

void processWaterLevel()
{
  if (waterLevel < minWaterLevel)
  {
    waterPumpB.on();
    delay(2000);
    processWaterLevel();
  }
  else if (waterLevel >= maxwaterLevel)
  {
    waterPumpB.off();
  }

  return;
}

void processTempAndHumidity()
{
  if (temperature > maxTemperature)
  {
    fan.on();
  }
  else if (temperature < maxTemperature)
  {
    fan.off();
  }
}

void processPh()
{
  if (phLevel > maxPh)
  {
    phDownPump.on();
    delay(2000);
    phDownPump.off();
    processPh();
  }
  else if (phLevel < minPh)
  {
    phUpPump.on();
    delay(2000);
    phUpPump.off();
    processPh();
  }

  return;
}

void processTds()
{
  if (tds < minTds)
  {
    nutrientPump.on();
    delay(2000);
    nutrientPump.off();
    processTds();
  }

  return;
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
}

void printValueToSerial(String sensor, long value)
{
  Serial.print(sensor);
  Serial.print(" = ");
  Serial.println(value);
}
