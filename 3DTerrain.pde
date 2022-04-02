int cols,rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  size(800, 800, P3D);
 
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
}
void draw() {
  
  flying -= 0.1; 
  
  float yOff = flying;
  for(int y = 0; y < rows; y++) {
    float xOff = 0;
    for(int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -100, 100);
      xOff += 0.2;
    }
    yOff += 0.2;
  }
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2,height/2+50);
  rotateX(PI / 3);
  translate(-w/2, -h/2);
  
  for(int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
