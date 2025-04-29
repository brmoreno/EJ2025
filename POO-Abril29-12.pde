class Enemigo{
  float x,y,r,dx,dy;
  int comportamiento;
  color c ;
  Enemigo(float x_, float y_,float r_,int comp_){
    x = x_;
    y = y_;
    r = r_;
    comportamiento = comp_;
    float dir = random(TWO_PI);
    dx = cos(dir);
    dy = sin(dir);
    c = gato.get(round(x),round(y));
  }
  
  void display(){
    noStroke();
    c = lerpColor(c,gato.get(round(x),round(y)),0.01);
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  
  void display2(){
    imageMode(CENTER);
    image(gato,x,y,r*2,r*2);
  }
  
  void mover(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1:
        erratico();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void erratico(){
    x+= random(-3,3);
    y+= random(-3,3);
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void constante(){
    //por determinar
    x+= dx;
    y+= dy;
    if(x<r){
    dx = abs(dx);
    }
    if(x>width-r){
      dx = -abs(dx);
    }
    if(y<r){
      dy = abs(dy);
    }
    if(y>height-r){
      dy = -abs(dy);
    }
  }
}


PImage gato;
ArrayList <Enemigo> enemigos;


void setup(){
  size(587,587);
  gato = loadImage("gatocubrebocas.png");
  enemigos = new ArrayList <Enemigo> ();
 }

void draw(){
  if(mousePressed){
    Enemigo e = new Enemigo(mouseX,mouseY,random(10,40),2);
    enemigos.add(e);
  }
 //background(255);
  for(Enemigo e: enemigos){
    e.display2();
    e.mover();
  }
}



void keyPressed(){
  saveFrame("foo.png");
}
