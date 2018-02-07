#include <WebSocketsServer.h>
#include <ESP8266WebServer.h>

WebSocketsServer webSocket = WebSocketsServer(81);


void webSocketEvent(uint8_t num, WStype_t type, uint8_t * payload, size_t length) {
    switch(type) {
    case WStype_DISCONNECTED:
        Serial.printf("[%u] Disconnected!\n", num);
        break;
    case WStype_CONNECTED: {
        IPAddress ip = webSocket.remoteIP(num);
        Serial.printf("[%u] Connected from %d.%d.%d.%d url: %s\n", num, ip[0], ip[1], ip[2], ip[3], payload);
        break;
    }
    case WStype_TEXT:
        Serial.printf("MSG: %s\n", payload);
        break;
    }

}

void setup() {
    webSocket.begin();
    webSocket.onEvent(webSocketEvent);
}

void loop() {
    webSocket.loop();
}
