PShader shader;
float r[] = new float[6];
float g[] = new float[6];
float b[] = new float[6];
float escalas[] = {1.0,4.0,5.0,8.0};
float petalos[] = {6.0,3.0,5.0, 7.0 };

void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
  for(int i = 0; i<6; i++){
    r[i] = random(1);
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
  shader.set("escalas",escalas);
  shader.set("petalos",petalos);
  rect(0,0,600,600);
}
