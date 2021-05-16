#include "WiFiClientSecure.h"
#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include "ArduinoJson.h"

// Wifi Details
const char* ssid = "SUPERONLINE-WiFi_3177"; //Enter SSID
const char* password = "PYVT4NU9UREA"; //Enter Password
const int httpsPort = 443;

// API
const String url = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd";

HTTPClient http;
WiFiClientSecure client;


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
  ApiRequest();
  
  
  delay(20000); //Coindesk's API updates once twenty seconds
}


void ApiRequest(){

  Serial.println("[TEST] APIRequest Çalıştı!");

  WiFi.softAPdisconnect(false);
  WiFi.enableAP(false);


  client.setInsecure();
  client.connect(url, httpsPort);
  
  // API Request
  http.begin(client, url);
  int code = http.GET();
  
  if (code == 200) {
    String payload = http.getString();
    DynamicJsonDocument jsonBuffer(1100);
    deserializeJson(jsonBuffer, payload);
    JsonObject coin = jsonBuffer["bitcoin"];
    int price_coin = coin["usd"];
    
    String message = "1 BTC = $";
    message += price_coin;

    Serial.println(message);
    
    WiFi.softAP(message.c_str());
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();

  
}
