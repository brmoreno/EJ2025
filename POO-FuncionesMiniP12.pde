//Lya Vazquez
void leon(float x_, float y_, float r_, float s_)
{
 pushMatrix();
 translate(x_,y_);
 rotate(r_);
 scale(s_);
 translate(-350,-350);
 noStroke();
 fill(255,198,111);
 ellipse(340,350,60,100);
 ellipse(310,365,30,60);
 ellipse(370,365,30,60);
 fill(255,212,174);
 ellipse(340,360,30,50);
 fill(210,127,53);
 ellipse(340,269,140,120);
 fill(255,198,111);
 ellipse(340,269,110,90);
 fill(255,212,174);
 ellipse(338,290,50,40);
 for(int i=0; i<2;i++)
 {
   fill(0);
   rect(315,285+i*5,-20,1);
 }
 for(int i=0; i<2;i++)
 {
   fill(0);
   rect(385,285+i*5,-20,1);
 }
 fill(255,198,111);
 circle(300,238,35);
 fill(255,198,111);
 circle(380,238,35);
 fill(255,212,174);
 ellipse(300,240,15,18);
 fill(255,212,174);
 ellipse(380,240,15,18);
 fill(190,144,105);
 ellipse(338,280,20,15);
 noFill();
 stroke(0);
 curve(340,260 ,340,288, 360,288, 370,260);
 curve(310,260 ,315,288, 340,288, 355,260);
 fill(0);
 circle(315,260,20);
 fill(0);
 circle(365,260,20);
 fill(255);
 circle(318,257,8);
 fill(255);
 circle(368,257,8);
 fill(255);
 circle(318,265,5);
 fill(255);
 circle(368,265,5);
 noStroke();
 fill(255,198,111);
 ellipse(310,400,30,25);
 ellipse(370,400,30,25);
 ellipse(330,400,40,35);
 ellipse(350,400,40,35);
 fill(0);
 triangle(295,404,297,418,299,410);
 triangle(300,410,303,422,305,412);
 triangle(315,412,317,423,319,416);
 triangle(320,416,323,426,325,416);
 triangle(328,416,330,426,333,416);
 triangle(340,416,343,426,345,416);
 triangle(347,416,350,426,352,416);
 triangle(354,416,356,426,358,414);
 triangle(370,412,372,424,375,412);
 triangle(378,412,380,424,382,408);
 fill(255,198,111);
 rect(372,381,40,10);
 fill(210,127,53);
 ellipse(412,386,30,25);
 popMatrix();
}

//Fernando Barrón
void Vaca(float x_, float y_, float r_,float s_){
  pushMatrix();
  translate(x_,y_);
  fill(0,255,0,80);
  triangle(0,-180,-130,100,130,100);
  rotate(r_);
  scale(s_);
  translate(-100,-100);
  fill(255);
  ellipse(100,100,100,80);
  fill(0);
  ellipse(130,115,33,30);
  fill(255,100,100);
  ellipse(100,120,80,40);
  fill(0); 
  circle(120,120,7);
  circle(80,120,7);
  fill(0);
  circle(80,90,10);
  circle(120,90,10);
  fill(255);
  ellipse(45,80,30,20);
  ellipse(155,80,30,20);
  fill(0);
  ellipse(45,78,20,15);
  ellipse(90,70,35,20);
  fill(242,209,157);
  triangle(58,79,65,35,85,68);
  triangle(116,68,131,37,140,83);
  popMatrix();
}

//Luis Vega
void mapache(float x_, float y_,float r_, float s_) { 
  pushMatrix();
  translate(x_,y_);
  rotate(r_);
  scale(s_);
  fill(75);
  ellipse( - 40,  15, 50, 15);

  //Patas
  fill(100);
  rect(-6, 18, 5, 10);
  rect(- 15,  21, 5, 10);
  fill(50);
  rect(- 24,  18, 5, 10);
  rect(- 33,  21, 5, 10);

  fill(0);
  rect( - 6,  26, 6, 2);
  rect( - 15,  28, 6, 2);
  rect( - 24, 26, 6, 2);
  rect( - 33,  28, 6, 2);

  //Orejas
  fill(75);
  ellipse(- 12,  - 10, 20, 25);
  fill(0);
  ellipse( - 12,  - 10, 12, 20);

  fill(75);
  ellipse( + 10,  - 10, 20, 25);
  fill(0);
  ellipse( + 10,  - 10, 12, 20);

  //Cuerpo
  fill(70);
  ellipse( - 18,  5, 45, 30);
  fill(140);
  ellipse( - 14,  15, 40, 12);

  //Cara
  fill(100);
  ellipse(0, 0, 50, 35);

  //Ojos
  fill(50);
  ellipse( - 9, 0, 20, 18);
  ellipse( 11, 0, 20, 18);

  fill(255);
  ellipse(- 9, 0, 12, 12);
  ellipse( 11, 0, 12, 12);

  fill(0);
  ellipse(- 9, 0, 5, 5);
  ellipse(11, 0, 5, 5);

  //Nariz
  fill(160);
  ellipse(0, 10, 15, 12);
  fill(0);
  ellipse(0, 10, 6, 5);
  popMatrix();
}

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  leon(200,200,mouseX*0.1,map(mouseY,0,width,0.1,2));
  Vaca(300,300,mouseX*0.1,map(mouseY,0,width,0.1,2));
  mapache(400,400,mouseX*0.1,map(mouseY,0,width,0.1,2));
}
