//Frida Negrón
void bodoque(float x_, float y_,float r_, float s_){
  noStroke();
  pushMatrix();
  translate(x_,y_);
  rotate(r_);
  scale(s_);
  translate(-100,-100);  
  noStroke();
  fill(255,51,51);
  ellipse(100,100,100,80);
  fill(255,51,51);
  ellipse(75,50,35,70);
  ellipse(125,50,35,70);  
  float raya1 = 125;
  float raya2 = 10;
  for (int i = 0; i < 6; i++) {
    if (i % 2 == 0) {
      fill(255);
   } else {
      fill(0);
   }
   rect(60, raya1 + i * raya2, 80, raya2); 
  }
  fill(255);
  circle(80,90,30);
  circle(120,90,30);
  fill(0);
  circle(80,90,14);
  circle(120,90,20);
  fill(255,255,102);
  triangle (90, 100, 110, 100, 100, 115);
  popMatrix();
}

//Rosas Delgado
void mono (float x_,float y_,float r_, float s_){ 
  pushMatrix();
  translate(x_,y_); 
  rotate (r_); 
  scale(s_);
  translate(-40,-150);   
  noStroke(); 
  fill(#FAE8B8);
  circle(10,100,30);
  circle(70,100,30);
  fill(#CE9A08);
  circle (40,95,60);
  rect (20,100,40,70);
   fill (#FAE8B8);
  ellipse(40,110,40,20);
  ellipse(30,95,20,40);
  ellipse(50,95,20,40);
  fill(0);
  circle(30,95,10);
  circle(50,95,10);
  circle (40,100,2);
  fill(255);
  circle(31,92,4);
  circle(51,92,4);
  fill (#E8579D);
  ellipse(40,112,10,13);
   fill(#CE9A08);
   ellipse(25,175,10,50);
   ellipse(55,175,10,50);
  rotate(-0.3);
  ellipse(-30, 125, 50,10);
  rotate(0.5);
  ellipse(95, 110, 50,10);
  rotate(0.3);
  ellipse(85,135,50,5);
  fill(#F2CF02);//sombrero
  rotate(-0.5);
  ellipse(40,75,80,7);
  ellipse(40,66,60,30);
  fill(255,0,0);
  rect(10,70,60,4);
  popMatrix();
}

//Paloma Romero
void ardilla(float x_, float y_, float r_, float s_ ) {
  pushMatrix();
  translate(x_, y_);
  rotate(r_);
  scale(s_);
  fill(130);
  float angle = PI / 4; 
  for (int i = 0; i < 10; i++) {
    float x1 = cos(angle) * i * 3;
    float y1 = sin(angle) * i * 3;
    rect(0, -20, x1, 30 + y1); 
    angle += PI / 8;
  }
  fill(150);  
  ellipse(10, -10, -30, -30); 
  fill(150);  
  ellipse(10, 10, 30, 30); 
  fill(150); 
  ellipse(-0, -20, 10, 10);
  ellipse(10, -25, 10, 10);
  fill(0);  
  ellipse(5, -10, 5, 5); 
  ellipse(20, -10, 5, 5);
  fill(255, 0, 0); 
  ellipse(15, -5, 5, 5);
  
  // Piernas
  fill(150);
  rect(5, 15, 5, 15); // Pierna izquierda
  rect(15, 15, 5, 15); // Pierna derecha
  
  stroke(255);
  popMatrix();
}


void setup(){
  size(600,600);
}

void draw(){
  background(255);
  bodoque(200,200,mouseX*0.1,map(mouseY,0,width,0.1,2));
  mono(300,300,mouseX*0.1,map(mouseY,0,width,0.1,2));
  ardilla(400, 400,mouseX*0.1,map(mouseY,0,width,0.1,2));
}
