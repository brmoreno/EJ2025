float r;
float s;

void setup(){
  size(400,400);
  r= 0; 
  s= 1;
}

void draw(){
  background(0,0,255);
  abigael(mouseX, mouseY,r,s);
  
  if(mousePressed){
    
  }
}

void mousePressed(){
  r+=0.1;
}


void keyPressed(){
  if(key == 'a'){
    s+= 0.1;
  }
  if(key == 's'){
    s-= 0.1;
  }
}


void abigael(int x_, int y_, float r_, float s_){
  pushMatrix();
  translate(x_,y_);
  rotate(r_);
  scale(s_);
  translate(-100,-100);
  
  noStroke();
  fill(255,205,0);
  ellipse(100,100,100,80);
  fill(255,100,100);
  circle(100,100,10);
  fill(0);
  circle(80,90,10);
  circle(120,90,10);
  for(int i = 0; i<3; i++){
    rect(110,100+i*5,30,2);
  }
  
  for(int i = 0; i<3; i++){
    rect(90,100+i*5,-30,2);
  }
  fill(255,205,0);
  triangle(58,79,65,35,85,68);
  triangle(116,68,131,37,140,83);
  popMatrix();
}
