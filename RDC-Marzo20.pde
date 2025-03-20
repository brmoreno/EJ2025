class Pez{
  PVector pos;
  PVector dir;
  float tam;
  float r;
  float g;
  float b;
  float angulo;
  float v;
  float escala;
  
  
  Pez(){
    pos = new PVector(random(1),random(1));
    tam = random(0.1,0.3);
    r = random(1);
    g = random(1);
    b = random(1);
    v= random(0.001,0.004);
    escala = random(5,50);
  }
  
  void mover(){
    angulo = noise(pos.x,pos.y,dz)*TWO_PI;
    dir = PVector.fromAngle(angulo);
    dir.y*=-1;
    dir.mult(v);
    pos.add(dir);
    
    if(pos.x>1+tam){
      pos.x= -tam*0.9;
      pos.y = random(1);
    }
    
    if(pos.x<-tam){
      pos.x= 1+tam*0.9;
      pos.y = random(1);
    }
    
    if(pos.y>1+tam){
      pos.y= -tam*0.9;
      pos.x = random(1);
    }
    
    if(pos.y<-tam){
      pos.y= 1+tam*0.9;
      pos.x = random(1);
    }
    
  }
  
}

Pez uno;
ArrayList <Pez> peces;
PShader shader;
float dz;
void setup(){
  size(800,800,P2D);
  shader = loadShader("miShader.glsl");
  uno = new Pez();
  peces = new ArrayList <Pez>();
  for(int i = 0; i<100; i++){
    peces.add(new Pez());
  }
}

void draw(){
  dz+= 0.001;
  float px [] = new float [100];
  float py [] = new float [100];
  float angulo [] = new float [100];
  float tam [] = new float [100];
  float r[] = new float [100];
  float g[] = new float [100];
  float b[] = new float [100];
  float escala[] = new float [100];
  
  
  for(int i = 0; i<100; i++){
    peces.get(i).mover();
    px[i] = peces.get(i).pos.x;
    py[i] = peces.get(i).pos.y;
    angulo[i] = peces.get(i).angulo;
    tam[i] = peces.get(i).tam;
    r[i] = peces.get(i).r;
    g[i] = peces.get(i).g;
    b[i] = peces.get(i).b;
    escala[i] = peces.get(i).escala;
  }
  
  shader.set("t", millis()*1f);
  shader.set("res",width/1f,height*1f);
  shader.set("mouse", mouseX*1f/width,1.0-mouseY*1f/height);
  shader.set("px",px);
  shader.set("py",py);
  shader.set("angulo",angulo);
  shader.set("tam",tam);
  shader.set("r",r);
  shader.set("g",g);
  shader.set("b",b);
  shader.set("escala",escala);
  shader(shader);
  rect(0,0,width,height);
 
}
