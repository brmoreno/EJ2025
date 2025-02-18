class Conejo{
  float x;
  float y;
  float r;
  float s;
  float dr;
  color piel;
  color raya1;
  color raya2;
  color nariz;
  boolean gino;
  
  Conejo(float x_, float y_, color piel_, color nariz_){
    x = x_;
    y = y_;
    r = 0;
    s = 1;
    piel = piel_;
    nariz = nariz_;
    raya1 = color(random(255),random(255),random(255));
    raya2 = color(random(255),random(255),random(255));
    dr = random(-0.1,0.1);
    gino = false;
  }
  
  void display(){
    bodoque(x,y,r,s);
  }
  
  void rotar(){
    r+=dr;
  }
  
  void bodoque(float x_, float y_,float r_, float s_){
  noStroke();
  pushMatrix();
  translate(x_,y_);
  rotate(r_);
  scale(s_);
  translate(-100,-100);  
  noStroke();
  fill(piel);
  ellipse(100,100,100,80);
  fill(piel);
  ellipse(75,50,35,70);
  ellipse(125,50,35,70);  
  float raya1 = 125;
  float raya2 = 10;
  for (int i = 0; i < 6; i++) {
    if (i % 2 == 0) {
      fill(this.raya1);
   } else {
      fill(this.raya2);
   }
   rect(60, raya1 + i * raya2, 80, raya2); 
  }
  fill(255);
  circle(80,90,30);
  if(!gino){
  circle(120,90,30);
  }
  fill(0);
  circle(80,90,14);
  if(!gino){
  circle(120,90,20);
  }
  fill(nariz);
  triangle (90, 100, 110, 100, 100, 115);
  popMatrix();
} 
}


class Ardilla{
  float x;
  float y;
  float s;
  float r;
  float v;
  boolean der;
  
  
  Ardilla(){
    x = width/2;
    y = height/2;
    s = 1;
    r = 0;
    v = 3;
    der = true;
  }
  
  void display(){
    ardilla(x,y,r,s);
  }
  
  void mover(){
    if(keyPressed){
      switch(key){
        case 'i':
          y-=v;
        break;
        case 'k':
          y+=v;
        break;
        case 'j':
          x-=v;
          der = false;
        break;
        case 'l':
          x+=v;
          der = true;
        break;
      }
    }
  }
  
  void ardilla(float x_, float y_, float r_, float s_ ) {
  pushMatrix();
  translate(x_, y_);
  rotate(r_);
  if(der){
    scale(1);
  }
  else{
  scale(-1,1);
  }
  fill(130);
  float angle = PI / 4; 
  for (int i = 0; i < 10; i++) {
    float x1 = cos(angle) * i * 3;
    float y1 = sin(angle) * i * 3;
    rect(0, -20, x1, 30 + y1); 
    angle += PI / 8;
  }
  fill(150);  
  ellipse(10, -10, -30, -30); 
  fill(150);  
  ellipse(10, 10, 30, 30); 
  fill(150); 
  ellipse(-0, -20, 10, 10);
  ellipse(10, -25, 10, 10);
  fill(0);  
  ellipse(5, -10, 5, 5); 
  ellipse(20, -10, 5, 5);
  fill(255, 0, 0); 
  ellipse(15, -5, 5, 5);
  
  // Piernas
  fill(150);
  rect(5, 15, 5, 15); // Pierna izquierda
  rect(15, 15, 5, 15); // Pierna derecha
  
  stroke(255);
  popMatrix();
}
  
}

Conejo Michel;
Conejo Luis;
Ardilla laArdilla;

void setup(){
  size(800,800);
  Michel = new Conejo(200,400,color(0,0,255),color(255,0,0));
  Luis = new Conejo(400,400,color(#821689),color(255));
  laArdilla = new Ardilla();
  Luis.s = 1.4;
}
void draw(){
  background(255);
  Michel.display();
  Luis.display();
  laArdilla.display();
  laArdilla.mover();
  if(keyPressed){
    if(key == 'a'){
      Michel.rotar();
    }
  }
  
}

void keyPressed(){
  if(key == 's'){
    Luis.gino = !Luis.gino;
  }
}
