
import processing.serial.*;

Serial myPort;

float distanceMax = 100;

int angleActuel = 90;
float distanceActuelle = -1;

float[] distances = new float[181];
int[] lastSeen = new int[181];

float cx, cy, rayon;

void setup() {
  fullScreen();
  smooth(8);
  frameRate(60);

  cx = width / 2.0;
  cy = height * 0.88;
  rayon = min(width * 0.46, height * 0.70);

  for (int i = 0; i <= 180; i++) {
    distances[i] = -1;
    lastSeen[i] = 0;
  }

  println(Serial.list());

  // Remplacer COM3 par le port de ton Arduino
  myPort = new Serial(this, "COM3", 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(2, 8, 14);

  dessinerFond();
  dessinerTitre();
  dessinerRadar();
  dessinerCibles();
  dessinerBalayage();
  dessinerPanneau();
  dessinerBas();
}

// ================= FOND =================

void dessinerFond() {
  stroke(10, 35, 45, 80);
  strokeWeight(1);

  for (int x = 0; x < width; x += 40) {
    line(x, 0, x, height);
  }

  for (int y = 0; y < height; y += 40) {
    line(0, y, width, y);
  }
}

// ================= TITRE =================

void dessinerTitre() {
  textAlign(LEFT);

  fill(0, 255, 160);
  textSize(38);
  text("ZY RADAR", 45, 55);

  fill(130, 190, 190);
  textSize(14);
  text("ULTRASONIC DETECTION SYSTEM", 48, 82);

  stroke(0, 255, 150, 170);
  strokeWeight(2);
  line(45, 100, 300, 100);
}

// ================= RADAR =================

void dessinerRadar() {
  noFill();

  // Cercles concentriques
  for (int i = 1; i <= 4; i++) {
    float r = rayon * i / 4.0;

    stroke(0, 255, 140, 35);
    strokeWeight(8);
    arc(cx-r, cy-r, 2*r, 2*r, PI, TWO_PI);

    stroke(0, 230, 140, 180);
    strokeWeight(1.5);
    arc(cx-r, cy-r, 2*r, 2*r, PI, TWO_PI);
  }

  // Lignes angulaires
  for (int a = 0; a <= 180; a += 15) {
    float rad = radians(a);

    float x = cx + rayon*cos(rad);
    float y = cy - rayon*sin(rad);

    stroke(0, 150, 110, 110);
    strokeWeight(1);
    line(cx, cy, x, y);

    fill(0, 255, 150);
    textAlign(CENTER);
    textSize(14);

    text(a + "°",
      cx + (rayon+25)*cos(rad),
      cy - (rayon+25)*sin(rad));
  }

  // Distances
  fill(0, 255, 150);
  textAlign(LEFT);
  textSize(15);

  text("25 cm", cx+15, cy-rayon/4);
  text("50 cm", cx+15, cy-rayon/2);
  text("75 cm", cx+15, cy-3*rayon/4);
  text("100 cm", cx+15, cy-rayon);

  // Centre du radar
  noStroke();
  fill(0, 255, 150, 60);
  ellipse(cx, cy, 30, 30);

  fill(0, 255, 150);
  ellipse(cx, cy, 10, 10);
}

// ================= CIBLES ROUGES =================

void dessinerCibles() {
  for (int a = 0; a <= 180; a++) {
    if (distances[a] > 0 &&
        distances[a] <= distanceMax &&
        millis()-lastSeen[a] < 5000) {

      float r = map(distances[a], 0,
                    distanceMax, 0, rayon);

      float rad = radians(a);

      float x = cx + r*cos(rad);
      float y = cy - r*sin(rad);

      noStroke();

      fill(255, 20, 20, 50);
      ellipse(x, y, 30, 30);

      fill(255, 35, 35);
      ellipse(x, y, 11, 11);
    }
  }
}

// ================= BALAYAGE VERT =================

void dessinerBalayage() {
  float a = radians(angleActuel);

  float x = cx + rayon*cos(a);
  float y = cy - rayon*sin(a);

  stroke(0, 255, 130, 25);
  strokeWeight(25);
  line(cx, cy, x, y);

  stroke(0, 255, 130, 80);
  strokeWeight(10);
  line(cx, cy, x, y);

  stroke(0, 255, 150);
  strokeWeight(2.5);
  line(cx, cy, x, y);
}

// ================= PANNEAU INFORMATIONS =================

void dessinerPanneau() {
  float x = width - 300;
  float y = 35;

  fill(5, 22, 28, 230);
  stroke(0, 180, 130);
  strokeWeight(1.5);
  rect(x, y, 260, 195, 14);

  fill(0, 255, 150);
  textAlign(LEFT);
  textSize(20);
  text("SYSTEM STATUS", x+18, y+32);

  stroke(0, 150, 110, 100);
  line(x+15, y+45, x+245, y+45);

  fill(190, 220, 220);
  textSize(15);
  text("ANGLE", x+18, y+80);
  text("DISTANCE", x+18, y+115);
  text("MAX RANGE", x+18, y+150);
  text("BAUD RATE", x+18, y+180);

  fill(0, 255, 150);
  textAlign(RIGHT);
  textSize(16);

  text(angleActuel + "°", x+240, y+80);

  if (distanceActuelle > 0) {
    text(nf(distanceActuelle, 0, 1) + " cm",
         x+240, y+115);
  } else {
    text("-- cm", x+240, y+115);
  }

  text("100 cm", x+240, y+150);
  text("9600", x+240, y+180);
}

// ================= BAS DE L'ECRAN =================

void dessinerBas() {
  textAlign(CENTER);
  fill(0, 255, 150);
  textSize(13);

  text("ZY RADAR | REAL-TIME OBJECT DETECTION",
       width/2, height-20);
}

// ================= COMMUNICATION SERIE =================

void serialEvent(Serial p) {
  String data = p.readStringUntil('\n');

  if (data != null) {
    data = trim(data);
    String[] values = split(data, ',');

    if (values.length == 2) {
      try {
        int a = int(values[0]);
        float d = float(values[1]);

        if (a >= 0 && a <= 180) {
          angleActuel = a;
          distanceActuelle = d;

          if (d > 0 && d <= distanceMax) {
            distances[a] = d;
            lastSeen[a] = millis();
          } else {
            distances[a] = -1;
          }
        }
      }
      catch(Exception e) {
        println("Erreur de lecture serie");
      }
    }
  }
}
