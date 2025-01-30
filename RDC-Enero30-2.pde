class osciladorC{
  float a;
  float b;
  float min;
  float max;
  
  osciladorC(){
    a = random(TWO_PI);
    b = random(0.05);
    min = random(0.3);
    max = random(0.5,1.0);
  }
  
  void update(){
    a+=b;
  }
  
  float val(){
    return(map(sin(a),1,-1,max,min));
  }
}



PShader shader;
ArrayList <osciladorC> oscs;


void setup(){
  size(600,600,P2D);
  shader =  loadShader("miShader.glsl");
  oscs = new ArrayList <osciladorC>();
  for(int i = 0; i<6; i++){
    oscs.add(new osciladorC());
  }
}

void draw(){
  for(int i = 0; i<6; i++){
    oscs.get(i).update();
  }
  shader(shader);
  shader.set("t", millis()*1f);
  shader.set("res",width*1f,height*1f);
  shader.set("color1",oscs.get(0).val(),oscs.get(1).val(),oscs.get(2).val());
  shader.set("color2",oscs.get(3).val(),oscs.get(4).val(),oscs.get(5).val());
  
  fill(255,0,0);
  rect(0,0,600,600);
}
