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

ArrayList <Enemigo> enemigos;

void setup(){
  size(800,800);
  enemigos = new ArrayList <Enemigo> ();
  enemigos.add(new Enemigo(400,400,100,0));
  Enemigo e = new Enemigo(300,300,120,1);
  enemigos.add(e);
  for(int  i = 0; i<50;i++){
    enemigos.add(new Enemigo(random(200,400),random(200,400),80,2));
  }
}

void draw(){
  background(255);
  //for(Enemigo e:enemigos){
  //  e.display();
  //  e.moverse();
  //}
  
  for(int i = 0; i<enemigos.size(); i++){
    enemigos.get(i).display();
    enemigos.get(i).moverse();
  }
}

void mousePressed(){
  Enemigo e = new Enemigo(mouseX,mouseY,80,2);
  enemigos.add(e);
}

void keyPressed(){
  enemigos.remove(0);
}
