#include "WiFiClientSecure.h"
#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include "ArduinoJson.h"
#include "FirebaseESP8266.h"


// Wifi Details
const char* ssid = "SUPERONLINE-WiFi_3177"; //Enter SSID
const char* password = "PYVT4NU9UREA"; //Enter Password
const int httpsPort = 443;

// Firebase Details
#define FIREBASE_HOST "crypto-currency-75f19-default-rtdb.europe-west1.firebasedatabase.app"
#define FIRABASE_AUTH "0HlBwDs2lpRF3xAXDEyNqxUG31k4LeDp7Zyn5K6N"

// API

HTTPClient http;
WiFiClientSecure client;
FirebaseData fbdo;

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

  Firebase.begin(FIREBASE_HOST, FIRABASE_AUTH);
  Firebase.reconnectWiFi(true);

  Serial.print("Setup olayını bitirdim.");


  
}

void loop() 
{
  Serial.println("");
  Serial.println("");
  Serial.println("[TEST] Loop'a giriş yapıldı.");
  firebaseauth();
  
  
  delay(20000); //Coindesk's API updates once twenty seconds
}

void firebaseauth(){
  Serial.print("authdayım");


  String id = "-M_qY8ZibGmEyjVr2fOf"; 

  
  Firebase.get(fbdo,"/Users/Kemal/"+id+"/alarms");  //nu satırda 2.dönüşte çöküyor.
  FirebaseJson json = fbdo.jsonObject();
  int len = json.iteratorBegin();

  if(len==0){
    Serial.print("/Users/"+id+"/alarms veri yoluna erişim yok yada bu yolda hiç alarm yok." );
  } 
  else {
    String key, value = "";
    int type = 0;
    for (int i = 0; i < len; i++){
      json.iteratorGet(i, type, key, value);
      ApiRequest(key);
    }
  }
  json.iteratorEnd();
  
}


void ApiRequest(String key){

  String url = "https://api.coingecko.com/api/v3/simple/price?ids="+key+"&vs_currencies=usd";


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
    JsonObject coin = jsonBuffer[key];
    int price_coin = coin["usd"];
    
    String message = "1"+key+" = $";
    message += price_coin;

    Serial.println(message);
    
    WiFi.softAP(message.c_str());
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();

  
}
