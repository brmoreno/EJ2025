//Variables Globales;
color fondo;
color relleno;
int x;
int y;
int d;


//función setup;
void setup(){
  size(800,800);
  background(255);
  fondo = color(255);
  relleno = color(255,0,0);
  x = 200;
  y = 400;
  d= 400;
}


// funcíon draw;

void draw(){
  background(fondo);
  noStroke();
  fill(relleno);
  circle(x,y,d);
  x++;
}
