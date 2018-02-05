
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

// the loop function runs over and over again forever
void loop() {
  for (int i = 0; i < 1023; i++) {
    analogWrite(LED_BUILTIN, i);
    delay(10);
    Serial.print("Valor PWM: ");
    Serial.println(i);
    Serial.print("Cosa");
  }
}
