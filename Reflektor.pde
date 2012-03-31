// REFLEKTOR 0.2

#include <Servo.h> 
 
Servo servo;  
int potPin = 0;
int val;    
int pinBoton = 2;
int ledPin01 = 7;
int ledPin02 = 8;
int ledPin03 = 4;

int selecServo = 0;
int numeroServos = 3;
int botonState;

void setup() 
{  
  pinMode(pinBoton, INPUT);
  pinMode(ledPin01, OUTPUT);
  pinMode(ledPin02, OUTPUT);
  pinMode(ledPin03, OUTPUT);
  
  servo.attach(9); 
} 
 
void loop() 
{ 
  botonState = digitalRead(pinBoton);
   if (botonState == HIGH) {         
    selecServo = (selecServo + 1)%numeroServos;
   
   digitalWrite(ledPin01, LOW);
   digitalWrite(ledPin02, LOW);
   digitalWrite(ledPin03, LOW);
   
   switch (selecServo){
     case 0 : 
              digitalWrite(ledPin01, HIGH);
              break;
     case 1 : 
              digitalWrite(ledPin02, HIGH);
              break;
     case 2 : 
              digitalWrite(ledPin03, HIGH);
              break;
   }
   delay(200);
  } 
  
  val = analogRead(potPin);           
  val = map(val, 0, 1023, 0, 179);    
  servo.attach(selecServo + 9);
  servo.write(val);                 
  delay(15);                         
} 
