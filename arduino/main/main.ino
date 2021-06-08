#include "WiFiClientSecure.h"
#include "ESP8266WiFi.h"
#include "ESP8266HTTPClient.h"
#include "ArduinoJson.h"
#include "LiquidCrystal_I2C.h"

// Wifi Details
const char* ssid = "AirTies_Air5650_3NA7";
const char* password = "Ali.gurbuz2021";
const int httpsPort = 443;

// Firebase Rest Api
const String rest_api_url = "https://crypto-currency-75f19-default-rtdb.europe-west1.firebasedatabase.app/.json";

// Some Global Variables
String coin_list[10];
String coin_list_with_alarm[10];

//LCD
LiquidCrystal_I2C lcd(0x3f, 16, 2);

// API
HTTPClient http;
// WiFi Client
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

  lcd.begin(16,2);
  lcd.backlight();
  lcd.setCursor(5, 0);
  
}

void loop() 
{
  
  FirebaseRestApi();
  
  
  delay(20000); // This delay to control refresh time.
}

// The function used to get coins and its' alarms from Firebase
// And also to compare alarm and current price
void FirebaseRestApi(){
  Serial.println("\n");

  
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
    String coins = jsonBuffer["Users"]["Kemal"]["-M_qY8ZibGmEyjVr2fOf"]["coins"];
    splittingStrToArray(coins);
	
    bool flag = true;
    for (int i=0; i<10; i++){
      flag = true;
      if (coin_list[i] != ""){
        if (alarms.containsKey(coin_list[i])){
          int setted_value = alarms[coin_list[i]];
          int current_value = ApiRequest(coin_list[i]);
          String message = "Your alarm price = $";
          message += setted_value;
          Serial.println(message);
          if (current_value >= setted_value ){
            String Alarmlcd;
            Alarmlcd = "!!!ALARM!!! " + current_value +" >= " + setted_value ; 
                     
            Serial.println(Alarmlcd);
            lcd.print(Alarmlcd); 
            lcd.setCursor(5, 1);
          }
          flag = false;

          
        }
        if (flag){
          int current_value = ApiRequest(coin_list[i]);
          Serial.println("There is no alarm for this coin");       
        }
        
        
      }
   
    }
    
    
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();

  
}

// The function to get cryptocurrency prices
// Thanks to coingecko.com
int ApiRequest(String key){

  String url = "https://api.coingecko.com/api/v3/simple/price?ids="+key+"&vs_currencies=usd";
  int price_coin;


  Serial.println("------------ "+key+" Details------------");

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
    lcd.print(message);
    lcd.setCursor(5, 1);
    
  } else {
    Serial.print("Failed to request to API. The HTTP Error Code: ");
    Serial.println(code);
    
  }
  
  http.end();
  return price_coin;

  
}

// To split the given string
// The function used to split given string and assign it to the global variable.
void splittingStrToArray(String text){
  
  int i=0;
  char *p, string[128], delimiter[] = ",";

  text.toCharArray(string, sizeof(string));
  p = strtok(string, delimiter);
  while(p && i < 10)
  {
    coin_list[i] = p;
    p = strtok(NULL, delimiter);
    ++i;
  }

  
}
