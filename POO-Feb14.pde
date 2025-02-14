class Particula {
  // Atributos
  //tamaño, color,posicion,velocidad
  float x;
  float y;
  float d;
  color c;
  float dx;
  float dy;
  
  //Constructor;
  Particula(float x_, float y_, float d_, color c_){
    x = x_;
    y = y_;
    d = d_;
    c = c_;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  //metodos
  // mover, rebote
  void display(){
    fill(c);
    circle(x,y,d);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
  }
  
  void rebote(){
    if(x<0 || x>width){
    dx *= -1;
    }
    if(y<0 || y>height){
    dy *= -1;
    }  
  } 
}

Particula una;
Particula otra;

void setup(){
  size(800,800);
  una = new Particula(300,300,200,color(255,0,0));
  otra = new Particula(200,200,100,color(225,255,0));
}

void draw(){
  background(255);
  una.display();
  una.mover();
  una.rebote();
  otra.display();
  otra.mover();
  otra.rebote();
}
