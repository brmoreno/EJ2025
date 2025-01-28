// agregar : movimiento vertical y rebote a instancia que se mueve sola.
// agregar movimiento horizontal a instancia que se mueve con teclado
// limitar movimiento de instancia de teclado a el área de la pantalla
float x;
float y;
float d;
float dx;
color fondo;
color relleno;

float x2;
float y2;
float d2;
color relleno2;

float x3;
float y3;
float d3;
color relleno3;

void setup(){
  size(800,800);
  x = random(200,600);
  y = random(200,600);
  d = random(100,200);
  dx = 2;
  fondo = color(random(255),random(255),random(255));
  relleno = color(random(255),random(255),random(255));
  background(fondo);
    
  x2 = width/2;
  y2 = height/2;
  d2 = random(100,200);
  relleno2 = color(random(255),random(255),random(255));

  x3 = width/2;
  y3 = height/2;
  d3 = random(100,200);
  relleno3 = color(random(255),random(255),random(255));  
}

void draw(){ 
  background(fondo);
  fill(relleno);
  circle(x,y,d);
  
  fill(relleno2);
  circle(x2,y2,d2);
  
  fill(relleno3);
  circle(x3,y3,d3);
  
  
  if(keyPressed){
    switch(key){
      case 'w':
        y3-=1;
      break;
      case 's':
        y3+=1;
      break;
    }
  }
  
  
  if(mousePressed){
    x2 = mouseX;
    y2 = mouseY;
  }
  
  
  if(x+d/2 >= width){
    dx *= -1;
  }
  if(x-d/2<0){
    dx *=-1;
  }  
  x+=dx;
   
}
