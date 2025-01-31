void setup(){
  size(900,900);
  noStroke();
  fill(255,0,0);
  background(255);
  for(int i = 0 ; i < 900 ; i+=3 ){
    fill(i*0.5,255-i*0.1,0);
    rect(i,height/2 +sin(i*0.01)*200,2,20+i*0.3);
  }  
}
