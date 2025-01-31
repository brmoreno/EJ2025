float x;
float y;
float d;
float dx;
float dy;
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
  dy = -1;
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
      case 'a':
        x3-=1;
      break; 
      case 'd':
        x3 +=1;
      break;
    }
  }
  
  x3 = constrain(x3,d3/2,width-d3/2);
  y3 = constrain(y3,d3/2,height-d3/2);
  
  
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
  if(y-d/2 <= 0){
    dy *= -1;
  }
  if(y+d/2 >= height){
    dy *= -1;
  }
  
  x+=dx;
  y+=dy;   
}
