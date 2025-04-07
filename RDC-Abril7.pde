PShader shader;
PImage img;
float freq[] = new float[3];
float ofs[] = new float [3];
int proceso = 0;

void setup(){
  size(400,600,P2D);
  shader = loadShader("miShader.glsl");
  img = loadImage("gato.png");
  for(int i = 0; i<3; i++){
    freq[i] = random(4,15);
    ofs [i] = random(-0.2,0.2);
  }
}

void draw(){ 
  for(int i = 0; i<3; i++){
    freq[i] = random(4,15);
    ofs [i] = random(-0.2,0.2);
  }
  shader.set("t", millis()*1f);
  shader.set("res",img.width*1f,img.height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("freq", freq);
  shader.set("ofs",ofs);
  shader.set("proceso",proceso);
  shader(shader);
  image(img,0,0);
}

void keyPressed(){
  if(key == 'q'){
    proceso = 0;
  }
  if(key == 'w'){
    proceso = 1;
  }
  if(key == 'e'){
    proceso = 2;
  }
  if(key == 'r'){
    proceso = 3;
  }
  if(key == 't'){
    proceso = 4;
  }
  if(key == 'y'){
    proceso = 5;
  }
}
