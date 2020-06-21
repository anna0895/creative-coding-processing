int ecken = 6; //Anzahl der Ecken!
int winkel;// wird später aus der Anzahl der Ecken berechnet
float x1, y1, x2, y2;
color colors[];
int posY = (int)random(0, 1000);
int posX = 0;



void setup() {
  size(1000, 1000);

  colors = new color[4];
  colors[0] = color(0, 115, 191);
  colors[1] = color(0, 96, 161);
  colors[2] = color(0, 64, 107);
  colors[3] = color(0, 49, 82);
}

void draw() {
  //die 2 folgenden Anweisungen lassen die Objekte nach kurzer Zeit verblassen
  fill(0, 20);
  // background(0);
  rect(0, 0, width, height);
  //Aufruf der Funktion mit den Parametern:
  //Eckenzahl, MauspositionX, MauspositionY, RadiusX, RadiusY

  //if (mouseButton == LEFT) { 
  vieleck(ecken, posX, posY, 80, 80);
  //vieleck(ecken, mouseX, mouseY, 80, 80);
  // } else if (mouseButton == RIGHT) { 

  /*
   CIRCLE
   circle(mouseX, mouseY, 130);
   if (mouseY < 150) {
   strokeWeight(2);
   } else if (mouseY < 300) {
   strokeWeight(4);
   } else if (mouseY < 450) {
   strokeWeight(6);
   } else if (mouseY < 750) {
   strokeWeight(8);
   } else if (mouseY < 1000) {
   strokeWeight(10);
   }
   
   if (mouseX < 150) {
   stroke(140, 3, 53);
   } else if (mouseX < 300) {
   stroke(242, 92, 147);
   } else if (mouseX < 450) {
   stroke(1, 64, 17);
   } else if (mouseX < 750) {
   stroke(1, 38, 6);
   } else if (mouseX < 1000) {
   stroke(88, 140, 35);
   }
   */
  // }
}
// Funktion zeichnet Vielecke
void  vieleck (int seiten, int x, int y, int radiusX, int radiusY) {

  // winkel entspricht dem Abstander der Ecken in Grad
  // z.B.: 3 Ecken:120°; 4 Ecken:90° usw.
  winkel = (int) 360/seiten;
  //die Schleife wird der Anzahl der Ecken entsprechend aufgerufen
  //z.B.: 3 mal beim 3-Eck oder 4 mal beim 4_eck
  for (int grade=0; grade<360; grade+=winkel) {
    // erster Punkt
    x1 =sin(radians(grade))*radiusX+(x);
    y1 =cos(radians(grade))*radiusY+(y);

    // zweiter Punkt
    x2 =sin(radians(grade+winkel))*radiusX+(x);
    y2 =cos(radians(grade+winkel))*radiusY+(y);

    if (mouseX < 150) {
      stroke(56, 43, 140);
    } else if (mouseX < 300) {
      stroke(92, 81, 166);
    } else if (mouseX < 450) {
      stroke(149, 138, 191);
    } else if (mouseX < 750) {
      stroke(156, 211, 217);
    } else if (mouseX < 1000) {
      stroke(242, 181, 167);
    }
    strokeWeight(1);
    //zeichnet Linie zwischen Punkt 1 und Punkt 2
    line(x1, y1, x2, y2);
  }
}
