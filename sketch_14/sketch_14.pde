float xstart, xnoise, ynoise;

void setup() {
  size(500,500);
  smooth();
  background(255,255,100);
  stroke(204,102,0,255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y<=height; y+=5){
    ynoise+=0.1;
    xnoise = xstart;
    for (int x = 0; x<=width; x+=5){
      xnoise +=0.1;
      drawPoint(x,y,noise(xnoise, ynoise));
    }
  } 
}



void draw(){
}

void drawPoint(float x, float y, float noiseFactor){
  float len = 10*noiseFactor;
  rect(x,y,len,len);
}


void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-##.jpg");
  }
  
}
