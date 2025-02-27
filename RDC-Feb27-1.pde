PShader shader;
float dx [] = new float[6];
float dy [] = new float[6];
float r [] = new float [4];
float g [] = new float [4];
float b [] = new float [4];


void setup(){
  size(1000,500,P2D);
  //fullScreen(P2D);
  shader =  loadShader("miShader.glsl");
  for(int i = 0; i<6; i++){
    dx[i] = random(-1,1)*0.0001;
    dy[i] = random(-1,1)*0.0001;
  }
  
  for(int i = 0; i<4; i++){
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
  shader.set("dx",dx);
  shader.set("dy",dy);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  rect(0,0,width,height);
}
