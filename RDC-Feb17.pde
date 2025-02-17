PShader shader;
float limite[] = new float[10];
float escala[] = new float[10];
float r[] = new float[10];
float g[] = new float[10];
float b[] = new float[10];
float mov[] = new float [10];
float a[] = new float [10];

void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
  for(int i = 0; i<10; i++){
  limite[i] = random(1);
  escala[i] = round(random(5,20));
  r[i] = random(.25);
  g[i] = random(0.25);
  b[i] = random(0.25);
  a[i]= random(-1,1)*0.001;
  mov[i] = random(-1,1)*0.001;
  }
}

void draw(){  
  shader(shader);
  shader.set("t", millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("limite", limite);
  shader.set("escala",escala);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("mov",mov);
  shader.set("a",a);
  rect(0,0,600,600);
}
