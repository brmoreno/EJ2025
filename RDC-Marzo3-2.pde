PShader shader;
PShader shader2;
float dx [] = new float[6];
float dy [] = new float[6];
float r [] = new float [8];
float g [] = new float [8];
float b [] = new float [8];


void setup(){
  size(1000,500,P2D);
 //
 fullScreen(P2D);
  shader =  loadShader("miShader.glsl");
  shader2 = loadShader("miShader2.glsl");
  for(int i = 0; i<6; i++){
    dx[i] = random(-1,1)*0.0001;
    dy[i] = random(-1,1)*0.0001;
  }
  
  for(int i = 0; i<8; i++){
    r[i] = random(1);
    g[i] = random(1);
    b[i] = random(1);
  }
  
}

void draw(){  
  shader.set("t", millis()*1f);
  shader.set("res",width/2*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("dx",dx);
  shader.set("dy",dy);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader(shader);
  rect(0,0,width/2,height);
  resetShader();
  fill(255,0,0);
  
  shader2.set("t", millis()*1f);
  shader2.set("res",width/2*1f,height*1f);
  shader2.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);

  shader(shader2);
  
  rect(width/2,0,width/2,height);
  resetShader();
}
