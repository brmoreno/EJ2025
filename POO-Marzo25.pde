class Letra{
  PVector pos;
  char c;
  color col;
  float t;
  float a;
  PVector v;
  
  
  Letra(char c_, float x_, float y_){
    pos = new PVector(x_,y_);
    c = c_;
    col = color(0);
    t = 50;
    a = 0;
    v = PVector.random2D();
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a-HALF_PI);
    fill(col);
    textFont(fuente);
    textSize(t);
    textAlign(CENTER,CENTER);
    text(c,0,0);
    popMatrix();
  }
  
  void mover(){
    pos.add(v);
    a = v.heading();
  } 
}

ArrayList <Letra> letras;
PFont fuente;
void setup(){
  size(800,800);
  fuente = createFont("Futura",50);
  letras = new ArrayList <Letra> ();
}

void draw(){
  background(255);
  for(Letra l:letras){
    l.display();
    l.mover();
  }
}

void keyPressed(){
  Letra n = new Letra(key, mouseX, mouseY);
  letras.add(n);
}
