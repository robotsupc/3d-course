
// La funcion setup se ejecuta una unica vez cuando apretas el boton de reset o enciendes la placa.
void setup() {
  // Con pin mode configuramos el pin donde este conectado el LED de nuestra placa a output.
  // Este pin tambien se puede usar para otras cosas por ejemplo en el Wemos D1 mini Lite esta mapeado en el D4.
  // Todo lo que conectemos en el pin D4 tendra doble funcion, la salida visual del LED y el uso designado por el usuario.
  pinMode(LED_BUILTIN, OUTPUT);
  
  // Iniciamos la comunicacion del puerto serie a 9600 baudios, para poder monitorizar el Arduino.
  Serial.begin(9600);
}

// La funcion de loop se ejecuta una y otra vez para siempre.
void loop() {
  // Vamos a cambiar la potencia de un pulso PWM de 0 correspondiendo a un duty cicle de 0% a 1023 correspondiendo a duty cicle del 100%
  // Recordar que en el caso del led se traduce a un voltage medio dependiendo del tiempo que pasa el pin a HIGH y a LOW. Por ejemplo un
  // duty cicle del 50% corresponde a la mitad de Vcc, siendo Vcc 3.3V, significa que el 50% son 1.65V.
  for (int i = 0; i < 1023; i++) {
    // Configura el pulso PWM con el valor de i.
    analogWrite(LED_BUILTIN, i);
    // Nos esperamos 10milisegundos.
    delay(10);
    
    // Escribimos por consola el valor del PWM.
    Serial.print("Valor PWM: ");
    Serial.println(i);
  }
}
