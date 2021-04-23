#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include "ArduinoJson.h"

// Wifi Details
const char* ssid = "#"; //Enter SSID
const char* password = "#"; //Enter Password

// API
const String url = "http://api.coindesk.com/v1/bpi/currentprice.json";

HTTPClient http;

void setup(void)
{ 
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) 
  {
     delay(500);
     Serial.print("*");
  }
  
  Serial.println("");
  Serial.print("WiFi'ye bağlanıldı! Ağ Adı:");
  Serial.println(ssid);
  Serial.print("ESP8266 Modül'ünün IP Adresi:");
  Serial.print(WiFi.localIP());
}

void loop() 
{
  Serial.println("");
  Serial.println("");
  Serial.println("[TEST] Loop'a giriş yapıldı.");
  
  WiFi.softAPdisconnect(false);
  WiFi.enableAP(false);

  // API Request
  Serial.println("[TEST] API'ya request atıldı.");
  http.begin(url);
  int code = http.GET();
  
  if (code == 200) {
    Serial.println("[TEST] Request Başarılı!");   
    String payload = http.getString();

    DynamicJsonDocument jsonBuffer(1100);
    deserializeJson(jsonBuffer, payload);
    JsonObject bpi = jsonBuffer["bpi"];
    JsonObject bpi_USD = bpi["USD"];
    int last = bpi_USD["rate_float"];  
    
    String sSSID = "1 BTC = $";
    sSSID += last;

    Serial.println(sSSID);
    
    WiFi.softAP(sSSID.c_str());
  } else {
    Serial.print("Failed to request to API, is the internet connection active? Return code: ");
    Serial.println(code);
    
  }
  
  http.end();
  delay(20000); //Coindesk's API updates once twenty seconds
}
