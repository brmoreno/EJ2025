PShader shader;
PImage gato;


float px [] = new float [10];
float py []= new float [10];
float escala[]= new float [10];
float dz[]= new float [10];
float amp[]= new float [10];
float rojo [] = {1,0,0,1,0,0,1,0};
float verde [] ={0,1,0,0,1,0,0,1};
float azul [] = {0,0,1,0,0,1,0,0};


void setup(){
  size(700,700,P2D);
  shader = loadShader("miShader.glsl"); 
  for(int i = 0; i<10; i++){
    px[i] = random(20);
    py[i] = random(20);
    escala[i] = random(5,20);
    dz[i] = random(-0.001,0.001);
    amp[i] = random(0.75);
  }
  gato = loadImage("gatocubrebocas.png");
}


void draw(){ 
  
  shader.set("t", millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("escala",escala);
  shader.set("dz",dz);
  shader.set("amp",amp);
  shader.set("rojo", rojo);
  shader.set("verde", verde);
  shader.set("azul", azul);
  shader.set("gato",gato);
  
  shader(shader);
  rect(0,0,width,height);
}
