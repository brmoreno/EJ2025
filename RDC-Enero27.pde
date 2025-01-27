PShader shader; 

void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
}

void draw(){
  shader(shader);
  shader.set("rojo",mouseX/600f);
  shader.set("verde",mouseY/600f);
  shader.set("azul",0.0);
  fill(255,0,0);
  rect(0,0,600,600);
}
