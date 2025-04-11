interface Particula {
  void mover();
  void display();
}


class ParticulaA implements Particula{
  PVector pos;
  PVector v;
  color c;
  float r;
  
  ParticulaA(){
    pos = new PVector(random(width), random(height));
    v = PVector.random2D();
    c = color(random(255),random(255),random(255));
    r = random(10,50);
  }
  
  void mover(){
    pos.add(v);
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(pos.x,pos.y,r*2);
  }
}

class ParticulaB implements Particula{
  PVector pos;
  PVector v;
  color c;
  float r;
  float dr;
  
  ParticulaB(){
    pos = new PVector(random(width), random(height));
    v = PVector.random2D();
    c = color(random(255),random(255),random(255));
    r = random(10,50);
    dr = random(-0.01,0.01);
  }
  
  void mover(){
    v.rotate(dr);
    pos.add(v);
  }
  
  void display(){
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(pos.x,pos.y,r*2,r*2);
  }
}

ArrayList <Particula> particulas;

void setup(){
  size(800,800);
  particulas = new ArrayList <Particula> ();
  background(255);
}

void draw(){
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
}

void keyPressed(){
  if(key == 'q'){
    particulas.add(new ParticulaA());
  }
  if(key == 'w'){
    particulas.add(new ParticulaB());
  }
}
