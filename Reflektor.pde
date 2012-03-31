// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 
 
Servo servo;  // create servo object to control a servo 

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin 
int pinBoton = 2;
int ledPin01 = 7;
int ledPin02 = 8;
int ledPin03 = 4;

int selectedServo = 0;
int numeroServos = 3;
int buttonState;

void setup() 
{  
  pinMode(pinBoton, INPUT);
  pinMode(ledPin01, OUTPUT);
  pinMode(ledPin02, OUTPUT);
  pinMode(ledPin03, OUTPUT);
  
  servo.attach(9);  // attaches the servo on pin 9 to the servo object 
} 
 
void loop() 
{ 
  buttonState = digitalRead(pinBoton);
   if (buttonState == HIGH) {         
    selectedServo = (selectedServo + 1)%numeroServos;
   
   digitalWrite(ledPin01, LOW);
   digitalWrite(ledPin02, LOW);
   digitalWrite(ledPin03, LOW);
   
   switch (selectedServo){
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
  
  val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023) 
  val = map(val, 0, 1023, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
  servo.attach(selectedServo + 9);
  servo.write(val);                  // sets the servo position according to the scaled value 
  delay(15);                           // waits for the servo to get there 
} 
