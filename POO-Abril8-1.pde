class Particula{
  PVector pos;
  PVector v;
  color c;
  float r;
  
  Particula(){
    pos = new PVector(random(width), random(height));
    v = PVector.random2D();
    c = color(random(255),random(255),random(255));
    r = random(10,50);
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(pos.x,pos.y,r*2);
  }
  
  void mover(){
    pos.add(v);
  }
}

class ParticulaDos extends Particula{
  float dr;
  ParticulaDos(){
    super();
    dr = random(-0.01,0.01);
  }
  
  void display(){
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(pos.x,pos.y,r*2,r*2);
  }
  
  void mover(){
    v.rotate(dr);
    pos.add(v);
  }
}



ArrayList <Particula> particulas;

void setup(){
  size(800,800);
  particulas = new ArrayList <Particula> ();
  background(255);
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
    particulas.add(new ParticulaDos());
  }
}

void draw(){
  for(Particula p: particulas){
    p.mover();
    p.display();
  }
}
