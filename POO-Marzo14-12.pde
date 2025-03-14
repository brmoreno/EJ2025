class Juego{
  Nivel n;
  int estado; //0: ini, 1:nivel, 2:gané, 3:perdí 4: triunfo, 5: gameover
  int vidas;
  int nivelActual;
  int nivelMax;
  
  
  Juego(){
    estado = 0;
    vidas = 3;
    nivelActual = 1;
    nivelMax = 4;
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo>();
    enemigos.add(new Enemigo(700,700,100,0));
    n = new Nivel(2,100,100,enemigos);
  }
  
  // M V C 
  
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
            estado = 5;
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
  
  
  void producirNivel(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo> ();
    switch(nivelActual){
      case 1:
      enemigos.add(new Enemigo(700,700,100,0));
      n = new Nivel(2,100,100,enemigos);
      break;
      case 2:
      enemigos.add(new Enemigo(700,700,100,1));
      enemigos.add(new Enemigo(100,700,100,1));
      n = new Nivel(3,700,100,enemigos);
      break;
      case 3:
      enemigos.add(new Enemigo(700,700,100,1));
      enemigos.add(new Enemigo(100,700,100,2));
      enemigos.add(new Enemigo(100,100,100,1));
      n = new Nivel(3,700,100,enemigos);
      
      break;
      case 4:
      enemigos.add(new Enemigo(700,700,100,2));
      enemigos.add(new Enemigo(100,700,100,2));
      enemigos.add(new Enemigo(100,100,100,2));
      enemigos.add(new Enemigo(700,100,100,2));
      n = new Nivel(3,700,100,enemigos);
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
          producirNivel();
          estado =  1;
        }
      break;
      case 3:
        if(key == 'n'){
          vidas --;
          producirNivel();
          estado = 1;
        }
      break;
      
      case 4:  
      if(key == 'n'){
        vidas = 3;
        nivelActual = 1;
        producirNivel();
        estado = 0;
      }
      break;
      
      
      case 5:
        if(key == 'n'){
          vidas = 3;
          nivelActual = 1;
          producirNivel();
          estado = 0;
        }
      break;
    }
  }
}


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
  
  boolean captura(Item i_){
    boolean capt = false;
    float dist = dist(this.x,this.y,i_.x,i_.y);
    float sumaRadios = this.r+i_.r;
    if(dist<sumaRadios){
      capt = true;
    }
    return(capt);
  }
}

class Nivel{
  //atributos;
  Pers elPersonaje;
  Item elItem;
  ArrayList <Enemigo> enemigos;
  int estado; //0:sigo jugando, 1:gane, 2:perdí;
   
  //constructor
  Nivel(float v_, float xi_, float yi_, ArrayList <Enemigo> enemigos_){
    elPersonaje = new Pers(v_);
    elItem = new Item(xi_,yi_);
    enemigos = enemigos_;
  }
    
  //métodos
  
  void funcionamiento(){
    elPersonaje.display();
    elPersonaje.mover();
    elItem.display();
    if(elPersonaje.captura(elItem)){
      estado = 1;
    }
    for(Enemigo e:enemigos){
      funcionEnemigo(e);
    }
  }
  
  void funcionEnemigo(Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.moverse();
      if(elPersonaje.colision(e_)){
        estado = 2;
      }
    }
  } 
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
