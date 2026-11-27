
#include <Servo.h>

const int trigPin = 10;
const int echoPin = 11;
const int servoPin = 4;
const int buzzerPin = 2;

Servo myServo;

const int angleMin = 20;
const int angleMax = 180;

int angle = angleMin;
int direction = 1;


long measureDistance() {

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 25000);

  if (duration == 0) {
    return 400;
  }

  // Calcul de la distance en cm
  long distance = duration * 0.034 / 2;

  return distance;
}


void setup() {

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(buzzerPin, OUTPUT);

  digitalWrite(buzzerPin, LOW);
  noTone(buzzerPin);

  myServo.attach(servoPin);
  myServo.write(90);

  Serial.begin(9600);

  delay(1000);
}


void loop() {

  myServo.write(angle);
  delay(40);

  // Mesurer la distance
  long distance = measureDistance();

  // ===================================
  // 6. ACTIVATION DU BUZZER
  // ===================================

  if (distance > 0 && distance <= 10) {

    // Obstacle détecté à 10 cm ou moins
    tone(buzzerPin, 2500);

  } else {

    noTone(buzzerPin);
    digitalWrite(buzzerPin, LOW);
  }


  int radarAngle = 200 - angle;

  Serial.print(radarAngle);
  Serial.print(",");
  Serial.println(distance);


  if (angle >= angleMax) {
    direction = -1;
  }

  if (angle <= angleMin) {
    direction = 1;
  }

  angle += direction * 2;
}
