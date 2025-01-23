class Particula{
  PVector pos;
  PVector v;
  float r;
  float ro;
  float ve;
  float az;
  
  Particula(float x_, float y_, float r_){
    pos = new PVector(x_,y_);
    r = r_;
    ro = random(-50,100);
    ve = random(-50,100);
    az = random(-50,100);
    v = PVector.random2D();
  }
  
  void display(){
    miCirculo(round(pos.x),round(pos.y),round(r));
  }
  
  void mover(){
    pos.add(v);
    if(pos.x<0 || pos.x>width){
      v.x*= -1;
    }
    if(pos.y<0 || pos.y>height){
      v.y*= -1;
    }
  }
  
  void miCirculo(int x_, int y_, int r_){  
  for(int j = y_-r_< 0? 0:y_-r_; j<y_+r_ && j<height; j++){ 
    for(int i = x_-r_<0? 0: x_-r_; i<x_+r_ && i<width ;i++ ){
      float dist = dist(x_,y_,i,j);
      if(dist < r_){ 
        color col = pixels[j*width+i];
        float rojo = red(col);
        float verde= green(col);
        float azul = blue(col);
        float amt = map(dist,0,r_,1,0);
        pixels[j*width+i] = color(rojo+ro*amt,verde+ve*amt, azul+az*amt);
      }
    }
  }  
}
}


Particula una;
ArrayList <Particula> particulas;

void setup(){
  size(600,600);
  una = new Particula(300,300,100);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<150; i++){
    particulas.add(new Particula(300,300,random(30,150)));
  }
}

void draw(){
  loadPixels();
for(int i =0; i<pixels.length; i++){
  pixels[i] = color(0);
}
  una.display();
  una.mover();
  for(Particula p:particulas){
    p.display();
    p.mover();
  }

updatePixels();
}

void miRect(int x_, int y_, int w_, int h_, color c_){  
  for(int j = y_< 0? 0:y_; j<y_+h_ && j<height; j++){ 
    for(int i = x_<0? 0: x_; i<x_+w_ && i<width ;i++ ){
      pixels[j*width+i] = c_;
    }
  }
}

void miCirculo(int x_, int y_, int r_, color c_){  
  for(int j = y_-r_< 0? 0:y_-r_; j<y_+r_ && j<height; j++){ 
    for(int i = x_-r_<0? 0: x_-r_; i<x_+r_ && i<width ;i++ ){
      float dist = dist(x_,y_,i,j);
      if(dist < r_){
        pixels[j*width+i] = c_;
      }
    }
  }  
}

void miCirculo2(int x_, int y_, int r_, color c1_, color c2_ ){  
  for(int j = y_-r_< 0? 0:y_-r_; j<y_+r_ && j<height; j++){ 
    for(int i = x_-r_<0? 0: x_-r_; i<x_+r_ && i<width ;i++ ){
      float dist = dist(x_,y_,i,j);
      if(dist < r_){
        float amt = map(dist,0,r_,0,1);
        color c = lerpColor(c1_,c2_,amt);
        pixels[j*width+i] = c;
      }
    }
  }  
}
void mousePressed(){
  println(pixels[mouseY*width+mouseX]);
  int argb = pixels[mouseY*width+mouseX];
  int a = (argb >> 24) & 0xFF;
  int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = argb & 0xFF; 
  println(a + " " +r + " " +g + " " + b);
}
