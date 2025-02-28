//falta método recolectar,
class Jugador{
  // velocidad, direccion, posicion, tamaño, color
  float x;
  float y;
  float r;
  color c;
  float vel;
  float dir;
  
  
  Jugador(float vel_){
    x = width/2;
    y = height/2;
    r =  50;
    c = color(255,0,0);
    vel = vel_;
    dir = -HALF_PI;
  }
  
  //métodos;
  void display(){
    noStroke();
    fill(c);
    circle(x,y,r*2);
  }
  
  void mover(){
    //actualiza posicion, cambiar val x,y
    float dx = cos(dir) * vel;
    float dy = sin(dir)* vel;
    x+= dx;
    y+= dy;
    //implementar el giro de la direccion 
    if(keyPressed){
      if(key == 'a'){
        dir-= 0.05;
      }
      if(key == 'd'){
        dir+=0.05;
      }
    }
    //limitar el movmiento a la pantalla
    x = constrain(x,r,width-r);
    y = constrain(y,r,height-r);
  }
  
  boolean dano(Enemigo e_){
    boolean contacto = false;
    float distancia = dist(this.x,this.y, e_.x,e_.y);
    float sumaRadios = this.r+e_.r;
    if(distancia<sumaRadios){
      contacto = true;
    }
    return contacto;
  } 
  
  void recolectar(){} 
}

class Item{
 // color, tamaño, posicion
 float x;
 float y;
 float r; 
 color c;
 
 Item(float x_, float y_){
   x = x_;
   y = y_;
   r = 15;
   c = color(0,255,0);
 }
 
 //método
 void display(){
   noStroke();
   fill(c);
   circle(x,y,r*2);
 };
 
}

class Enemigo {
  //color, tamaño, posición, comportamiento;
  float x;
  float y;
  float r;
  color c;
  int comp; //0: estático, 1: aleatorio, 2: constante;
  float dx;
  float dy;
  
  Enemigo(float x_, float y_, float r_, int comp_){
    x = x_;
    y = y_;
    r = r_;
    c = color(0,0,255);
    comp = comp_;
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  //Métodos
  void movimiento(){
    switch(comp){
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
    y+= random(-2,2);
    x = constrain(x,r,width-r);
    y = constrain(y,r,height-r);
  }
  
  void constante(){
    x+=dx;
    y+=dy;
    if(x<r || x>width-r){
      dx*=-1;
    }
    if(y<r || y>height-r){
      dy*=-1;
    }
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(x,y,r*2);
  }
  
}


//falta niveles, flujo de pantalla, vidas
Jugador elJugador;
Enemigo uno;
Enemigo dos;

void setup(){
  size(800,800);
  elJugador = new Jugador(2);
  uno = new Enemigo(200,200,100,1);
  dos = new Enemigo(600,600,110,2);
}

void draw(){
  background(255);
  uno.display();
  uno.movimiento();
  
  dos.display();
  dos.movimiento();
  
  elJugador.display();
  elJugador.mover();
  
  if(elJugador.dano(uno)){
    println("hay daño");
  }
  else if(elJugador.dano(dos)){
    println("hay daño");
  }
  else{
    println("no hay daño");
  }
  
}
