import processing.video.*;
PShader shader;
PImage img;
PImage img2;
Capture cam;

float dx [] = new float [100];
float dy [] = new float [100];
float a [] = new float [100];
float px [] = new float [100];
float py [] = new float [100];

float dpx [] = new float [100];
float dpy [] = new float [100];

void setup(){
  size(400,600,P2D);
  shader = loadShader("miShader.glsl");
  img = loadImage("gato.png");
  img2 = loadImage("gato2.png");
  cam = new Capture(this);
  cam.start();
  for( int i = 0; i<100; i++){
    px[i] = random(1);
    py[i] = random(1);
    dpx[i] = random(-0.001,0.001);
    dpy[i] = random(-0.001,0.001);
    a[i] = random(0,0.15);
    dx[i] = random(-0.1,0.1);
    dy[i] = random(-0.1,0.1);
  }  
}

void captureEvent(Capture c) {
  c.read();
}

void draw(){ 
  for(int i = 0; i<100; i++){
    px[i]+=dpx[i];
    py[i]+=dpy[i];
  }
  shader.set("t", millis()*1f);
  shader.set("res",img.width*1f,img.height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("gato2",cam);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("dx",dx);
  shader.set("dy",dy);
  shader.set("a",a);
  
  shader(shader);
  image(img,0,0);
}

