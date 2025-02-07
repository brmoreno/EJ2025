float r;
float s;

void setup(){
  size(500,500);
  r = 0;
  s = 1;
}

void draw(){
  background(0,255,0);
  gato(mouseX,mouseY);
  
  
  if(mousePressed){
    
  }
}

void mousePressed(){
  r+= 0.1;
}

void keyPressed(){
  if(key == 'a'){
    s+=0.1;
  }
  if(key == 's'){
    s-=0.1;
  }
  
}

void gato(int x_, int y_){
  pushMatrix();
  translate(x_,y_);
  rotate(r);
  scale(s);
  translate(-100,-100);
  
  noStroke();
  fill(255);
  ellipse(100,100,100,80);
  fill(255,200,200);
  circle(100,100,10);
  fill(100,100,255);
  circle(80,80,10);
  circle(120,80,10);
  fill(0);
  for(int i = 0; i<3; i++){
    rect(110,100+i*5,20,1);
  }
  
  for(int i = 0; i<3; i++){
    rect(90,100+i*5,-20,1);
  }
  fill(255);
  triangle(63,76,79,36,91,63);
  triangle(109,66,123,40,137,77);
  popMatrix();
}
