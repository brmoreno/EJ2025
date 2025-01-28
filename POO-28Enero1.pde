//Var Glob
float x;
float y;
float d;
color fondo;
color relleno;


//Setup
void setup(){
  size(800,800);
  x = random(200,600);
  y = random(200,600);
  d = random(100,200);
  fondo = color(random(255),random(255),random(255));
  relleno = color(random(255),random(255),random(255));
  background(fondo);
  //frameRate(20);
}


//Draw
void draw(){
 
  background(fondo);
  fill(relleno);
  circle(x,y,d);
  //cuando x llegue al valor de 800;
  if(x >= 800){
    x-=1;
  }
  
  x+= 1;
  println(x);
  
}
