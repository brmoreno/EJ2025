float x[] = new float [200];
float y[] = new float [200];
float t[] = new float [200];
color c[] = new color [200];
color c2[] = new color [200];
float dx[] = new float [200];
float dy[] = new float [200];
int n[] = new int [200];

void setup(){
  size(800,800);    
    for(int i = 0; i<200;i++){
      x[i] = random(width);
      y[i] = random(width);
      t[i] = random(100,250);
      c[i] = color(random(255),random(255),random(255));
      c2[i] = color(random(255),random(255),random(255));
      dx[i] = random(-1,1);
      dy[i] = random(-1,1);
      n[i] = round(random(3,10));
    }
}




void draw(){
  background(255);
  noStroke();
  for(int i = 0; i<200; i++){

    concentricos(x[i],y[i],t[i],n[i],c[i],c2[i]);
    
    x[i]+=dx[i];
    y[i]+=dy[i]; 
    
    if(x[i]<0 || x[i]>width){
      dx[i] *= -1;
    }
    if(y[i]<0 || y[i]>height){
      dy[i] *= -1;
    }  
  }
}

void concentricos (float x_, float y_, float t_, int n_, color c1_, color c2_){
  for(int i = 0; i<n_; i++){
    fill(lerpColor(c1_,c2_,i*1f/n_));
    circle(x_,y_,t_ - (t_/n_)*i);
  }
}
