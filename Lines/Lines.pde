float xoff = 0.0;
float x1= 50;
float x2 = width / 3;
float x3= width / 3 + 50;
float x4 = width / 3 + width / 3;

void setup() {
  frameRate(2);
  size(1000, 1000);
  background(0);
}

void draw() {
  fill(0, 90);
  rect(0, 0, width, height);
  int maxNumber=10;
  xoff = xoff + .9;
  float x = noise(xoff) * width;
  float y = noise(xoff) * height;
  noFill();

  beginShape();
  for (int i=0; i<maxNumber; i++) {

    curveVertex(random(350, 300+300), random(height));
    curveVertex(random(350, 300+300), random(height));
  }
  endShape();
  beginShape();
  for (int i=0; i<maxNumber; i++) {

    curveVertex(random(50, 300), random(height));
    curveVertex(random(50, 300), random(height));
  }
  endShape();
    beginShape();
  for (int i=0; i<maxNumber; i++) {

    curveVertex(random(650, 950), random(height));
    curveVertex(random(650, 950), random(height));
  }
  endShape();
  
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
    if (mouseY < 300) {
      strokeWeight(2);
    } else if (mouseY < 600) {
      strokeWeight(4);
    } else if (mouseY < 1000) {
      strokeWeight(6);
    } 
}
