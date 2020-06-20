color colors[];
int cellSize = 100;
//Speed
int updateRate = 120;
int firstCell = 0;
int lastCell = 1000;
int xTiles;
int yTiles;
int winWidth = 1000;
int winHeight = 1000;

void setup() {
  size(1000, 1000);
  colors = new color[4];
  colors[0] = color(0, 115, 191);
  colors[1] = color(0, 96, 161);
  colors[2] = color(0, 64, 107);
  colors[3] = color(0, 49, 82); 
}

void draw() {
  if (frameCount % updateRate == 0) {
    init();
    drawTriangle();
  }

  drawGrid();
}

void init() {
  xTiles = width / cellSize;
  yTiles = height / cellSize;

  //firstCell = (int)random(xTiles);
  firstCell = width / cellSize / 2;
  lastCell = width / cellSize / 2;
}


void drawGrid() {
  int curCell = firstCell;
  int nextCell = 0;
  noStroke();
  beginShape();

  for (int y = 0; y < yTiles; y++) {
    boolean found = false;
    if (curCell == yTiles-1) {
      if (random(1) < 0.5) {
        nextCell = curCell-1;
      } else {
        nextCell = curCell;
      }
    } else if ( curCell == 0) {
      if (random(1) < 0.5) {
        nextCell = curCell;
      } else {
        nextCell = curCell+1;
      }
    } else {
      if (random(1) < 0.5) {
        nextCell = curCell-1;
      } else {
        nextCell = curCell+1;
      }
    }

    for (int x = 0; x < xTiles; x++) {
      // find the random selected cell in the first row
      fill(255, 255, 255);
      if (y == 0) {
        if (x == firstCell) {
          fill(255);
          circle(x*cellSize+cellSize/2, y*cellSize+cellSize/2, cellSize);
          vertex(x*cellSize+cellSize/2, y*cellSize+cellSize/2);
        }
      } else if (y == 4) {
        fill(255, 0, 0);

        vertex(mouseX, y*cellSize+cellSize/2);
      } else if (y == 9) {
        if (x == lastCell) {
          fill(255);
          circle(x*cellSize+cellSize/2, y*cellSize+cellSize/2, cellSize);
          vertex(x*cellSize+cellSize/2, y*cellSize+cellSize/2);
        }
      } else {
        if (!found && nextCell == x) {
          found = true;
          curCell = nextCell;
          fill(255);
          //circle(x*cellSize+cellSize/2, y*cellSize+cellSize/2, cellSize);
          vertex(x*cellSize+cellSize/2, y*cellSize+cellSize/2);
        }
      }
    }
  }
  stroke(255, 255, 255, 50);
  strokeWeight(1);
  noFill();
  endShape();
}


void drawTriangle() {

  int curCell = firstCell;
  int nextCell = 0;
  noStroke();
  beginShape();

  for (int y = 0; y < yTiles; y++) {
    boolean found = false;

    for (int x = 0; x < xTiles; x++) {

      //Ein Viereck
      for (int XPos=0; XPos<winWidth; XPos=XPos+cellSize*2) {
        for (int YPos=0; YPos<winHeight; YPos=YPos+cellSize*2) {
 fill(colors[(int)random(colors.length)]);
          triangle(XPos, YPos, XPos, YPos+cellSize, XPos+cellSize, YPos+cellSize);
          fill(colors[(int)random(colors.length)]);
          triangle(XPos, YPos, XPos+cellSize, YPos, XPos+cellSize, YPos+cellSize);
        }
      }

      //2Viereck
      for (int XPos=0; XPos<winHeight; XPos=XPos+cellSize*2) {
        for (int YPos=0; YPos<winHeight; YPos=YPos+cellSize*2) {
          fill(colors[(int)random(colors.length)]);
          triangle(XPos+cellSize, YPos+cellSize, XPos+cellSize, YPos+cellSize*2, XPos+cellSize*2, YPos+cellSize*2);
          fill(colors[(int)random(colors.length)]);
          triangle(XPos+cellSize, YPos+cellSize, XPos+cellSize*2, YPos+cellSize, XPos+cellSize*2, YPos+cellSize*2);
        }
      }

      // 3Viereck
      for (int XPos=0; XPos<winWidth; XPos=XPos+cellSize*2) {
        for (int YPos=0; YPos<winHeight; YPos=YPos+cellSize*2) {
          fill(colors[(int)random(colors.length)]);
          triangle(XPos+cellSize, YPos+cellSize, XPos+cellSize*2, YPos+cellSize, XPos+cellSize*2, YPos);
          fill(colors[(int)random(colors.length)]);
          triangle(XPos+cellSize, YPos+cellSize, XPos+cellSize, YPos, XPos+cellSize+cellSize, YPos);
        }
      }

      //4Viereck
      for (int XPos=0; XPos<winWidth; XPos=XPos+cellSize*2) {
        for (int YPos=0; YPos<winHeight; YPos=YPos+cellSize*2) {  
          fill(colors[(int)random(colors.length)]);
          triangle(XPos, YPos+cellSize+cellSize, XPos+cellSize, YPos+cellSize+cellSize, XPos+cellSize, YPos+cellSize);
          fill(colors[(int)random(colors.length)]);
          triangle(XPos, YPos+cellSize+cellSize, XPos, YPos+cellSize, XPos+cellSize, YPos+cellSize);
        }
      }
    }
  }
  stroke(255);
  strokeWeight(0);
  noFill();
  endShape();
}
