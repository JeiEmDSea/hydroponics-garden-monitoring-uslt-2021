#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#define BASE_URL "http://85bc-58-69-124-94.ngrok.io"

#ifndef STASSID
#define STASSID "TP-Link_1EFA"
#define STAPSK "24677721"
#endif

void setup()
{
  Serial.begin(115200);
  WiFi.begin(STASSID, STAPSK);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
  }
}

void loop()
{
  if ((WiFi.status() == WL_CONNECTED))
  {
    saveSensorData();
  }

  delay(10000);
}

void saveSensorData()
{
  WiFiClient client;
  HTTPClient http;

  http.begin(client, BASE_URL "/garden");
  http.addHeader("Content-Type", "application/json");

  int statusCode = http.POST("{\"humidity\":56,\"temperature\":35}");

  if (statusCode > 0)
  {
    if (statusCode == HTTP_CODE_OK)
    {
      const String &payload = http.getString();
    }
  }
  else
  {
    String altStatusCode = http.errorToString(statusCode).c_str();
  }

  http.end();
}