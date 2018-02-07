#include <WebSocketsServer.h>
#include <ESP8266WebServer.h>
#include <ESP8266WiFi.h>

WebSocketsServer webSocket = WebSocketsServer(81);
ESP8266WebServer server(80);

#define WEBAPP "<head><meta name='viewport'content='width=device-width,initial-scale=1'></head><style>body {width:100%;height:100%;margin:0px;}</style><canvas id='c'/><script>var b=document.getElementById('c'),c=b.getContext('2d'),d=0,e=0,g=0,h=0,k=0,l=0,m=0,n=0,p=0,q=!1,r=0,t,u=!1;b.addEventListener('mousedown',v,!1);b.addEventListener('touchstart',v,!1);b.addEventListener('mousemove',w,!1);b.addEventListener('touchmove',w,!1);b.addEventListener('mouseup',x,!1);b.addEventListener('touchend',x,!1);y();window.addEventListener('resize',z);z();t=new WebSocket('ws://192.168.4.1:81/');t.onopen=A;t.onerror=C;t.onmessage=D;y(); function A(){console.log('Connected to','ws://192.168.4.1:81/');u=!0;t.send('Hello from Client')}function D(a){console.log('MSG: ',a.data)}function C(a){u=!1;console.log('ERR',a)}function z(){b.width=window.innerWidth;b.height=window.innerHeight;g=b.width;h=b.height;m=b.width/2;n=b.height/2}function v(a){q=!0;void 0!=a.changedTouches&&a.preventDefault();w(a)} function w(a){q&&(void 0!=a.changedTouches&&a.preventDefault(),void 0!=a.changedTouches?(d=a.changedTouches[0].pageX,e=a.changedTouches[0].pageY):(d=a.x,e=a.y))}function x(a){void 0!=a.changedTouches&&a.preventDefault();q=!1} function y(){p=Math.min(g,h)/2*.7;var a=m-d;var f=n-e;a=Math.sqrt(a*a+f*f);a>p?(k=p/a*(d-g/2)+g/2,l=p/a*(e-h/2)+h/2):(k=d,l=e);q||(k=m,l=n);a=(new Date).getTime();100>a-r||(r=a,a=k-g/2,f=l-h/2,a=Math.floor(100*a/p),f=Math.floor(100*f/p),u&&t.send(a+' '+f));c.fillStyle='#E3F2FD';c.fillRect(0,0,g,h);c.strokeStyle='#7986CB';c.beginPath();c.moveTo(g/2,0);c.lineTo(g/2,h-1);c.stroke();c.beginPath();c.moveTo(0,h/2);c.lineTo(g-1,h/2);c.stroke();a=u?'#3F51B5':'#AAAAAA';E(.7,m,n,'#7986CB',!1);E(.3,k,l,a,!0); window.requestAnimationFrame(y)}function E(a,f,F,B,G){c.beginPath();c.arc(f,F,Math.min(g,h)/2*a,0,2*Math.PI);c.lineWidth=3;c.strokeStyle=B;c.fillStyle=B;G?c.fill():c.stroke()};</script>"


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

  server.on("/", []() {
    server.send(200, "text/html", WEBAPP);
  });

  server.begin();
  
    webSocket.begin();
    webSocket.onEvent(webSocketEvent);
}

void loop() {
    webSocket.loop();
   if( WiFi.status() == WL_CONNECTED) {
    Serial.println("Conectado.");
    Serial.println(WiFi.localIP());
  }
  
  server.handleClient();
  // http://192.168.4.1/light_on
}


