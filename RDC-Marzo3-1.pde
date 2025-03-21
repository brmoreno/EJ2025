import oscP5.*;
import netP5.*;

PShader shader;
float limite[] = new float[10];
float escala[] = new float[10];
float r[] = new float[10];
float g[] = new float[10];
float b[] = new float[10];
float mov[] = new float [10];
float a[] = new float [10];

OscP5 oscP5;
NetAddress myRemoteLocation;


void setup(){
  size(1200,600,P2D);
  randomSeed(2);
  shader =  loadShader("miShader.glsl");
  for(int i = 0; i<10; i++){
  limite[i] = 0.75;//random(0.6,1);
  escala[i] = round(random(3,10));
  r[i] = random(1);
  g[i] = random(1);
  b[i] = random(1);
  a[i]= 0;//random(-1,1)*0.0005;
  mov[i] = random(-1,1)*0.001;
  }
  
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("10.70.68.180",12001);
}

void draw(){  
  shader(shader);
  float t = millis()*1f;
  shader.set("t", t );
  shader.set("res",width*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("limite", limite);
  shader.set("escala",escala);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("mov",mov);
  shader.set("a",a);
  rect(0,0,1200,600);
  OscMessage mensaje = new OscMessage("/t");
  mensaje.add(t);
  oscP5.send(mensaje, myRemoteLocation);
}
