//falta captura
class Pers{
  //posicion,color, dirección, velocidad,tamaño
  float x;
  float y;
  color c;
  float r;
  float v; //mag
  float d; //ang
  
  //constructor
  Pers(float v_){
    x = width/2;
    y = height/2;
    c = color(255,0,0);
    r = 50;
    v = v_;
    d = -HALF_PI;
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(x,y,r*2);
  }
  
  void mover(){    
    if(keyPressed){
      if(key == 'a'){
        d -= 0.05;
      }
      if(key == 'd'){
        d += 0.05;
      }
    }
    float dx = cos(d)*v;
    float dy = sin(d)*v;
    x+= dx;
    y+= dy;
    
    x = constrain(x,r,width - r);
    y = constrain(y,r,height -r );
  }
  
  boolean colision(Enemigo e_){
    boolean colision = false;
    float dist = dist(this.x,this.y,e_.x,e_.y);
    float sumaRadios = this.r+e_.r;
    if(dist<sumaRadios){
      colision = true;
    }
    return colision;
  }
  
  void captura(){}
}



class Item{
  //posicion, tamaño, color
  float x;
  float y;
  float r;
  color c;
  
  //constructor
  Item(float x_, float y_){
    x = x_;
    y = y_;
    r = 15;
    c = color(0,255,0);
  }
  
  //métodos;
  void display(){
    noStroke();
    fill(c);
    circle(x,y,r*2);
  }
}

class Enemigo{
  //posición, tamaño, color, comportamiento 
  float x;
  float y;
  float r;
  color c;
  int comportamiento; // 0: estático, 1: aleatoria, 2: costante
  float dx;
  float dy;
  
  //Constructor
  Enemigo(float x_, float y_, float r_, int comp_){
    x = x_;
    y = y_;
    r = r_;
    c = color(0,0,255);
    comportamiento = comp_;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  //métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,r*2);
  }
  
  void moverse(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1:
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void aleatorio(){
    x+= random(-2,2);
    y+=random(-2,2);
    x = constrain(x,r,width-r);
    y = constrain(y,r,height-r);
  }
  
  void constante(){
    x+=dx;
    y+=dy;
    if(x<r || x>width-r){
      dx *= -1;
    }
    if(y<r || y>height-r){
      dy *= -1;
    }
  }
}

//falta niveles, vidas , flujo de pantalla.
Pers elPers;
Enemigo uno;
Enemigo dos; 

void setup(){
  size(800,800);
  elPers = new Pers(2);
  uno = new Enemigo(100,100,70,2);
  dos = new Enemigo(600,600,100,1);
}

void draw(){
  background(255);
  uno.display();
  uno.moverse();
  dos.display();
  dos.moverse();
  elPers.display();
  elPers.mover();
  if(elPers.colision(uno)){
    println("colision");
  }
  else if(elPers.colision(dos)){
    println("colision");
  }
  else{
    println("no colision");
  }
}
