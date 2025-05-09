import processing.sound.*;
SoundFile sample;
Amplitude vol;
AudioIn micro;
Reverb rev;
PitchDetector pitch;
color cols  [] = new color[12];

void setup(){
  size(500,500);
  sample = new SoundFile(this,"vibraphon.aiff");
  vol = new Amplitude(this);
  micro = new AudioIn(this);
  //rev = new Reverb(this);
  micro.play();
  //sample.loop();
  vol.input(micro);
  //rev.process(micro);
  pitch = new PitchDetector(this,0.5);
  pitch.input(micro);
  for(int i = 0; i<12; i++){   
   cols[i] =  color(random(255),random(255),random(255));
  }
}

void draw(){
  background(255);
  //float amp = map(mouseX,0,width,0,1);
  //sample.amp(amp);
  //float rate = map(mouseY,0,height,0.1,2);
  //sample.rate(rate);
  int notaMIDI = floor(12 * log(pitch.analyze() / 440)/log(2) + 69);
  println(notaMIDI);
  notaMIDI = constrain(notaMIDI,0,127);
  println(notaMIDI);
  fill(cols[notaMIDI%12]);
  noStroke();
  circle(width/2,height/2,vol.analyze()*3000);
}

void keyPressed(){
  if(key == 'a'){
    sample.pause();
  }
  if(key == 's'){
    if(!sample.isPlaying()){
      sample.play();
    }
  }
}


