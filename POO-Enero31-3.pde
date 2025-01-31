float x;
float z;

void setup(){
  size(900,900);
}

void draw(){
  x+=0.01;
  z+=0.01;
  for(int j = 0; j<height; j+=20){
    for(int i = 0; i<width; i+=20){
      float r = noise(i*0.005+x,j*0.005,z)*300;
      float g = noise(7+i*0.005+x,j*0.005+5,z+1)*300;
      float b = noise(9+i*0.005+x,6+j*0.005+5,z+11)*300;
      fill(r,g,b);
      rect(i,j,20,20);
    }
  }
}
