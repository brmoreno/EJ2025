//al presionar cuaquier tecla pasa de una modalidad a otra

PShader shader;
float r [] = {0.1,0.4,0.8,0.4};
float g[] = new float[4];
float b[] = new float[4];
int paso;


void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
  for(int i = 0; i<4; i++){
    g[i] = random(1);
    b[i] = random(1);
  }
}

void draw(){  
  shader(shader);
  shader.set("t", millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("paso",paso);
  shader.set("a",QUARTER_PI);
  rect(0,0,600,600);  
}

void keyPressed(){
  paso++;
  paso %= 2;
}
