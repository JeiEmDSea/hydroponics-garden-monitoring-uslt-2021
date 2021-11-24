#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

#define BASE_URL "http://plantronics-api.azurewebsites.net"

#ifndef STASSID
#define STASSID "johnmark"
#define STAPSK "jmhotspot"
#endif

void setup()
{
  Serial.begin(9600);
  WiFi.begin(STASSID, STAPSK);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());
}

void loop()
{
  if ((WiFi.status() == WL_CONNECTED))
  {
    parseData();
  }
}

void parseData()
{
  if (Serial.available())
  {
    StaticJsonDocument<600> sensorData;
    DeserializationError err = deserializeJson(sensorData, Serial);

    if (err == DeserializationError::Ok)
    {      
      saveReading(sensorData.as<String>());
      // * Serial.println(sensorData.as<String>());
    }
  }
}

void saveReading(String data)
{
  WiFiClient client;
  HTTPClient http;

  http.begin(client, BASE_URL "/garden");
  http.addHeader("Content-Type", "application/json");

  int statusCode = http.POST(data);

  if (statusCode > 0)
  {
    if (statusCode == HTTP_CODE_OK)
    {
      const String payload = http.getString();
      char cpayload[payload.length()];
      payload.toCharArray(cpayload, payload.length());

      DynamicJsonDocument settings(1024);
      deserializeJson(settings, cpayload);
      Serial.println(settings.as<String>());
    }
  }
  else
  {
    String altStatusCode = http.errorToString(statusCode).c_str();
  }

  http.end();
}
