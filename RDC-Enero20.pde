int x = 100;

void setup(){
  size(600,600);
  //frameRate(20);
}

void draw(){
  loadPixels();
for(int i =0; i<pixels.length; i++){
  pixels[i] = color(255);
}

miRect(mouseX,mouseY,200,200,color(255,0,0));

updatePixels();
}

void miRect(int x_, int y_, int w_, int h_, color c_){
  //loadPixels();
  for(int j = y_; j<y_+h_; j++){
    for(int i = j*width +x_; i<j*width+x_+w_;i++){
      pixels[i] = c_;
    }
  }
  //updatePixels();
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
