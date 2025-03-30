PImage gato;
PShader shader;


void setup(){
  size(450,450,P2D);
  gato = loadImage("gatocubrebocas.png");
  shader = loadShader("miShader.glsl");
}

void draw(){ 
  background(255);
  shader.set("t", millis()*1f);
  shader.set("res",gato.width*1f,gato.height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader(shader);
  image(gato,0,0);
}
