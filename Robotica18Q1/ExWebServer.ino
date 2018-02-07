#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

ESP8266WebServer server(80);

int MOTOR_IA = D5;
int MOTOR_IB = D6;

char* website = "<html>\n"
"<body>\n"
"\t<a href=\"http://192.168.4.1/foward\">Foward</a>\n"
"\t<a href=\"http://192.168.4.1/backward\">Backward</a>\n"
"\t<a href=\"http://192.168.4.1/stop\">Stop</a>\n"
"</body>\n"
"</html>";

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

  server.on("/", []() {
    server.send(200, "text/html", website);
  });

  server.on("/foward", []() {
    server.send(200, "text/html", website);

    Serial.println("Foward");
    digitalWrite(MOTOR_IA, LOW);
    analogWrite(MOTOR_IB, 512);
  });

  server.on("/backward", []() {
    server.send(200, "text/html", website);

    Serial.println("Foward");
    digitalWrite(MOTOR_IB, LOW);
    analogWrite(MOTOR_IA, 512);
  });

  server.on("/stop", []() {
    server.send(200, "text/html", website);

    Serial.println("Foward");
    digitalWrite(MOTOR_IB, LOW);
    digitalWrite(MOTOR_IA, LOW);
  });

  server.begin();

  pinMode( MOTOR_IA, OUTPUT );
  pinMode( MOTOR_IB, OUTPUT );
}
void loop() {
  if( WiFi.status() == WL_CONNECTED) {
    Serial.println("Conectado.");
    Serial.println(WiFi.localIP());
  }
  
  server.handleClient();

}
