int PIN_ECHO = 10;
int PIN_TRIGGER = 11;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(PIN_ECHO, INPUT);
  pinMode(PIN_TRIGGER, OUTPUT);
}

int tiempo;
float distancia;

void loop() {
  digitalWrite(PIN_TRIGGER, HIGH);
  delayMicroseconds(10);
  digitalWrite(PIN_TRIGGER, LOW);

  tiempo = (pulseIn(PIN_ECHO, HIGH) / 2);
  distancia = float(tiempo * 0.0343);

  Serial.print("Distancia: ");
  Serial.println(distancia);
}
