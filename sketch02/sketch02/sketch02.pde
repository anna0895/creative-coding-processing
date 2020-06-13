int diameter = 50;  // circle diameter
int numLines = 10;  // number of circles

void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);
  noFill();
  for(int n = 0; n < numLines; n++) {
    // sin and cos return the sine cosine of a giving angle (or offset)
    // sin() and cos() expect this angle to be between 0..2*PI
    // the radians() function allows us to convert a degree value (0..360) to a
    // corresponding radians value (0..2*PI)
    float sinWave = sin(radians(frameCount+n*numLines));
    float cosWave = cos(radians(frameCount+n*numLines));
   
    // remap the sinWave and cosWave values by multiplying them
    // by a giving range
    // by the use of (width/2 - diameter/2) as range value,
    // the circles will use the full canvas size to for their horizontal movement
    // by subtracing -diameter/2 from the width/2, the circles will never
    // exceed the canvas size and will stop right before the borders / edges of the canvas
    float x1 = width/2 + (width/2 - diameter/2) * sinWave;
    float x2 = width/2 + (width/2 - diameter/2) * cosWave;
    float y1 = diameter;
    float y2 = height - diameter;
    
    stroke(255, 200);
    strokeWeight(5);
    // draw circles on the top 
    circle(x1, y1, diameter);
    
    // draw circles on the bottom
    circle(x2, y2, diameter);
    
    stroke(255, 200);
    // connect the top and bottom circles
    line(x1, y1+diameter/2, x2, y2-diameter/2);
  }
}
