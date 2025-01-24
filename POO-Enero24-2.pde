//Variables Globales;
color fondo;
color relleno;
int x;
int y;
float d;
float dd;
float ddd;

float r;
float g;
float b;

float dr;
float dg;
float db;



//función setup;
void setup(){
  size(800,800);
  background(255);
  fondo = color(255);
  relleno = color(255,0,0);
  x = 400;
  y = 400;
  d= 600;
  dd = 0;
  ddd = 0.01;
  r= 0;
  g = 0;
  b = 0;
  dr = 0.02;
  dg = 0.05;
  db = 0.08;
}


// funcíon draw;

void draw(){
  
  noStroke();
  float rojo = sin(r)*255;
  float verde = sin(g)*255;
  float azul = sin(b)*255;
  fill(rojo,verde,azul);
  circle(x,y,sin(dd)*d);
  x++;
  x %= 800;
  dd+=ddd;
  r += dr;
  g +=dg;
  b +=db;
  
}
