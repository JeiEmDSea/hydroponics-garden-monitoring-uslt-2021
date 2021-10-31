#include "DHT.h"

// ! SOIL MOISTURE SENSOR
#define soilMoistureSensorPin A0
#define soilMoistureSensorPower 52
#define soilMoistureSensorGnd 53
int soilMoisture;

// ! WATER LEVEL SENSOR
#define waterLevelSensorPin A1
#define waterLevelSensorPower 50
#define waterLevelSensorGnd 51
int waterLevel;

// ! AM2302 (DHT22)
#define dhtPin 2
#define dhtPower 48
#define dhtGnd 49
#define dhtType DHT22
DHT dht22(dhtPin, dhtType);
float humidity;
float temperature;
float heatIndex;

// ! pH SENSOR
#define phSensorPin A2
#define phSensorPower 46
#define phSensorGnd 47
float phValue;

void setup()
{
  Serial.begin(9600);

  setPowerPins();
  dht22.begin();

  delay(2000);
}

void loop()
{
  getSoilMoisture();
  getWaterLevel();
  gethumidityAndTemperature();
  getpH();

  delay(1000);
}

void getSoilMoisture()
{
  digitalWrite(soilMoistureSensorPower, HIGH);
  delay(20);
  soilMoisture = analogRead(soilMoistureSensorPin);
  soilMoisture = map(soilMoisture, 550, 10, 0, 100);
  digitalWrite(soilMoistureSensorPower, LOW);
}

void getWaterLevel()
{
  digitalWrite(waterLevelSensorPower, HIGH);
  delay(20);
  waterLevel = analogRead(waterLevelSensorPin);
  waterLevel = map(waterLevel, 520, 10, 0, 100);
  digitalWrite(waterLevelSensorPower, LOW);
}

void gethumidityAndTemperature()
{
  humidity = dht22.readHumidity();
  temperature = dht22.readTemperature();
  heatIndex = dht22.computeHeatIndex();
}

void getpH()
{
  unsigned long int avgValue = 0;
  int buf[10], temp;

  for (int i = 0; i < 10; i++) //Get 10 sample value from the sensor for smooth the value
  {
    buf[i] = analogRead(phSensorPin);
    delay(10);
  }

  for (int i = 0; i < 9; i++) //sort the analog from small to large
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

  for (int i = 2; i < 8; i++) //take the average value of 6 center sample
    avgValue += buf[i];
  float phValue = (float)avgValue * 5.0 / 1024 / 6; //convert the analog into millivolt
  phValue = 3.5 * phValue;
}

void setPowerPins()
{
  // ! SOIL MOISTURE SENSOR
  pinMode(soilMoistureSensorGnd, OUTPUT);
  digitalWrite(soilMoistureSensorGnd, LOW);
  pinMode(soilMoistureSensorPower, OUTPUT);
  digitalWrite(soilMoistureSensorPower, LOW); // ? initially off

  // ! WATER LEVEL SENSOR
  pinMode(waterLevelSensorGnd, OUTPUT);
  digitalWrite(waterLevelSensorGnd, LOW);
  pinMode(waterLevelSensorPower, OUTPUT);
  digitalWrite(waterLevelSensorPower, LOW); // ? initially off

  // ! AM2302 (DHT22)
  pinMode(dhtGnd, OUTPUT);
  digitalWrite(dhtGnd, LOW);
  pinMode(dhtPower, OUTPUT);
  digitalWrite(dhtPower, HIGH); // ? initially on

  // ! pH SENSOR
  pinMode(phSensorGnd, OUTPUT);
  digitalWrite(phSensorGnd, LOW);
  pinMode(phSensorPower, OUTPUT);
  digitalWrite(phSensorPower, HIGH); // ? initially on
}