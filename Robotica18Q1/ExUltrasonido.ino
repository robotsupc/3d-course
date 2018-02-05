// Conectamos el PIN ECHO del ultrasonido al pin 10 del Arduino.
// Este pin se pone a HIGH cuando el ultrasonido recibe el eco de la señal que envia.
int PIN_ECHO = 10;

// Conectamos el PIN TRIGGER del ultrasonido al pin 10 del Arduino.
// Este pin lo utilizamos para decirle al ultrasonido que empieze una medicion.
int PIN_TRIGGER = 11;

// El codigo de esta funcion solo se ejecuta una vez.
void setup() {
  // Iniciamos la comunicacion por el puerto serie a 9600 baudios.
  Serial.begin(9600);
  // Configuramos el pin por el que vamos a recibir el eco como entrada.
  pinMode(PIN_ECHO, INPUT);
  // Configuramos el pin por el que vamos a pedir la medicion como salida.
  pinMode(PIN_TRIGGER, OUTPUT);
}

// Declaramos dos variables. Una para el tiempo i otra para la distancia.
int tiempo;
float distancia;

void loop() {
  // El ultrasonido empieza a medir despues de una señal de 10 milisegundos a HIGH en el pin de TRIGGER.
  digitalWrite(PIN_TRIGGER, HIGH);
  delayMicroseconds(10);
  digitalWrite(PIN_TRIGGER, LOW);

  // pulseIn es una llamada especial de arduino que espera a que un pin reciba una señal y 
  // cuenta cuanto tiempo ha estado el pin a esa señal.
  // Divimos el tiempo entre dos porque el sonido va y viene.
  tiempo = (pulseIn(PIN_ECHO, HIGH) / 2);
  
  // Para la distancia dividimos entre la velocidad del sonido. tiempo * (distancia / tiempo) = distancia.
  distancia = float(tiempo * 0.0343);

  Serial.print("Distancia: ");
  Serial.println(distancia);
}
