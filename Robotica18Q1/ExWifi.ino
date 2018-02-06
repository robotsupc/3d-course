#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

ESP8266WebServer server(80);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  WiFi.begin("RobotsUPC", "lalalala");
  int contador = 0;
  while (WiFi.status() != WL_CONNECTED && contador < 20) {
    Serial.print(".");
    delay(1000);
    contador++;
  } 

  if( WiFi.status() != WL_CONNECTED) {
    WiFi.mode(WIFI_AP);
    WiFi.softAP("Node1", "lalalala", 1);
  }

  server.on("/light_on", []() {
    server.send(200, "text/html", "hola");
  });

  server.begin();
  
}
void loop() {
  if( WiFi.status() == WL_CONNECTED) {
    Serial.println("Conectado.");
    Serial.println(WiFi.localIP());
  }
  
  server.handleClient();
  // http://192.168.4.1/light_on

}
