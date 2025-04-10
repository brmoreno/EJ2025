int pot = A0;
int foto = A1;

int valPot = 0;
int valFoto = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  valPot = floor(analogRead(pot)/8.0);
  valFoto = floor(analogRead(foto)/8.0);  
  Serial.write(valPot);
  Serial.write(130);
  Serial.write(valFoto);
  Serial.write(131);
}
