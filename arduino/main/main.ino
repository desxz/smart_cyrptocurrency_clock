#include "WiFiClientSecure.h"
#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include "ArduinoJson.h"


// Wifi Details
const char* ssid = "SUPERONLINE-WiFi_3177"; //Enter SSID
const char* password = "PYVT4NU9UREA"; //Enter Password
const int httpsPort = 443;

// Firebase Rest Api
String rest_api_url = "https://crypto-currency-75f19-default-rtdb.europe-west1.firebasedatabase.app/.json";

char *myStrings[] = {"bitcoin", "ethereum"};


// API
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
  
  FirebaseRestApi();
  
  
  delay(20000); //Coindesk's API updates once twenty seconds
}



void FirebaseRestApi(){
  Serial.println("");
  Serial.println("");


  WiFi.softAPdisconnect(false);
  WiFi.enableAP(false);


  client.setInsecure();
  client.connect(rest_api_url, httpsPort);
  
  // API Request
  http.begin(client, rest_api_url);
  int code = http.GET();
  
  if (code == 200) {
    String payload = http.getString();
    DynamicJsonDocument jsonBuffer(1100);
    deserializeJson(jsonBuffer, payload);
    JsonObject alarms = jsonBuffer["Users"]["Kemal"]["-M_qY8ZibGmEyjVr2fOf"]["alarms"];
    for (int i=0; i<2; i++){
      int setted_value = alarms[myStrings[i]];
      int current_value = ApiRequest(myStrings[i]);

      String message = "Your alarm price = $";
      message += setted_value;
      Serial.println(message);


      if (current_value >= setted_value ){
        Serial.println("!!!ALARM!!!");
        
      }
      
      
    }
    
    
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();

  
}


int ApiRequest(String key){

  String url = "https://api.coingecko.com/api/v3/simple/price?ids="+key+"&vs_currencies=usd";
  int price_coin;


  Serial.println("------------ "+key+" Details------------");

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
    JsonObject coin = jsonBuffer[key];
    price_coin = coin["usd"];
    
    String message = "1"+key+" = $";
    message += price_coin;

    Serial.println(message);
    
    WiFi.softAP(message.c_str());
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();
  return price_coin;

  
}
