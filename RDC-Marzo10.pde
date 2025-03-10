PShader shader;
float x [] = new float [50];
float y [] = new float [50];
float tam [] = new float [50];
float r[] = new float [50];
float g[] = new float [50];
float b[] = new float [50];
float rota [] = new float [50];
float dx[] = new float[50];
float dy[] = new float [50];

void setup(){
  size(500,500,P2D);
  shader = loadShader("miShader.glsl");
  for( int i = 0; i<50; i++){
    x[i] = random(1);
    y[i] = random(1);
    tam[i] = random(0.05,0.1);
    r[i] = random(1);
    g[i] = random(1);
    b[i] = random(1);
    dx[i] = random(-0.001,0.001);
    dy[i] = random(-0.001,0.001);
    rota[i] = random(-0.002,0.002);
  }
}

void draw(){
  for(int i = 0; i<50; i++){
    x[i]+=dx[i];
    y[i]+=dy[i];
  }
  shader.set("t", millis()*1f);
  shader.set("res",width/1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("x",x);
  shader.set("y",y);
  shader.set("tam",tam);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("rota",rota);
  shader(shader);
  rect(0,0,width,height);
  
}
