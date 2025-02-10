PShader shader;


PVector v1;
PVector v2;
float t1;
float t2;
PVector c1;
PVector c2;


void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
 
  
  v1 = new PVector(0.1,0.5);
  v2 = new PVector(0.9,0.5);
  t1 = 1.5;
  t2 = 1.5;
  c1= new PVector(0.7,0.2,0.5);
  c2= new PVector(0.2,0.3,0.9);
}

void draw(){  
  shader(shader);
  shader.set("t", millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("v1",v1.x,v1.y);
  shader.set("v2",v2.x,v2.y);
  shader.set("t1",t1);
  shader.set("t2",t2);
  shader.set("c1",c1.x,c1.y,c1.z);
  shader.set("c2",c2.x,c2.y,c2.z);
  rect(0,0,600,600);
}
