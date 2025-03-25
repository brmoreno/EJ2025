class Nivel{
  //atributos
  Jugador elJugador;
  Item elItem;
  ArrayList <Enemigo> enemigos;
  int estado;// 0: sigo jugando, 1: gane, 2: perdí;
  
  //constructor
  Nivel(float v_, float xi_, float yi_, ArrayList <Enemigo> enemigos_){
    elJugador = new Jugador(v_);
    elItem = new Item(xi_,yi_);
    enemigos = enemigos_;
  }
   
  
  //métodos
  void funcionamiento(){
    elJugador.display();
    elJugador.mover();    
    elItem.display();
    if(elJugador.recolectar(elItem)){
      estado = 1;
    }
    for(Enemigo e:enemigos){
      funcionEnemigo(e);
    }
  }
  
  void funcionEnemigo(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.movimiento();
      if(elJugador.dano(e_)){
        estado = 2;
      }
    }
  }
  
}

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
  
  boolean recolectar(Item i_){
    boolean rec = false;
    float distancia = dist(this.x,this.y,i_.x,i_.y);
    float sumaRadios = this.r + i_.r;
    if(distancia < sumaRadios){
      rec = true;
    }
    return rec;
  } 
}

class Juego {
  int estado; //0:ini, 1:nivel, 2:gané, 3:perdí. 4:triunfo, 5:game over
  Nivel n;
  int vidas;
  int nivelActual;
  int nivelMax;
  
  Juego(){
    estado = 0;
    vidas = 3;
    nivelActual = 1;
    nivelMax = 4;
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    enemigos.add(new Enemigo(700,700,100,0));
    n = new Nivel(2,100,100,enemigos);
  }
  
  void display(){
    switch(estado){
      case 0:
        background(255);
      break;
        
      case 1:
        n.funcionamiento();
        if(n.estado == 1){
          if(nivelActual == nivelMax){
            estado = 4;
          }
          else{
            estado = 2;
          }
        }
        if(n.estado == 2){
          if(vidas == 0){
            estado =5;
          }
          else{
            estado = 3;
          }
        }
      break;
      case 2:
        background(0,255,0);
      break;
      case 3:
        background(255,0,0);
      break;
      case 4:
        background(0,0,255);
      break;
      case 5:
        background(0);
      break;
    }
  }
  
  void generarNivel(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    switch(nivelActual){
      case 1:
      enemigos.add(new Enemigo(700,700,100,0));
      n = new Nivel(2,100,100,enemigos);        
      break;
      case 2:
      enemigos.add(new Enemigo(700,700,100,1));
      enemigos.add(new Enemigo(100,700,100,1));
      n = new Nivel(3,100,100,enemigos);
      break;
      case 3:
      enemigos.add(new Enemigo(700,700,100,1));
      enemigos.add(new Enemigo(100,700,100,2));
      enemigos.add(new Enemigo(700,100,100,1));
      n = new Nivel(3,100,100,enemigos);
      
      break;
      case 4:
      enemigos.add(new Enemigo(100,100,100,2));
      enemigos.add(new Enemigo(700,700,100,2));
      enemigos.add(new Enemigo(100,700,100,2));
      enemigos.add(new Enemigo(700,100,100,2));
      n = new Nivel(3,100,100,enemigos);
      break;
      
    }
  }
  
  void enKeyPressed(){
    switch(estado){
      case 0:
        if(key == 'n'){
          estado = 1;
        }
      break;
      
      case 1:
      break;
      
      case 2:
        if(key == 'n'){
          nivelActual++;
          generarNivel();
          estado = 1;
        }
      break;
      case 3:
        if(key == 'n'){
          vidas --;
          generarNivel();
          estado = 1;
        }
      break;
      case 4:
      if(key == 'n'){
        vidas = 3;
        nivelActual = 1;
        generarNivel();
        estado = 0;
      }
      break;
      case 5:
        if(key == 'n'){
        vidas = 3;
        nivelActual = 1;
        generarNivel();
        estado = 0;
        }
      break;
    }
    
  }
  
  
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

Juego elJuego;

void setup(){
  size(800,800);
  elJuego = new Juego();
}

void draw(){
  background(255);
  elJuego.display();
}

void keyPressed(){
  elJuego.enKeyPressed();
}
