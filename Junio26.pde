class Rubix{
  int[][] v;
  int tam;
  float difx[];
  float dify[];  
  float difxOb[]; // 
  float difyOb[];
  float difxAn[];
  float difyAn[];
  float tObx[];
  float tAnx[];
  float tOby[];
  float tAny[];
  
  Rubix(int tam_){
    tam = tam_;
    difx = new float[tam];
    dify = new float[tam];
    difxOb = new float[tam];
    difyOb = new float[tam];
    difxAn = new float[tam];
    difyAn = new float[tam];
    tObx = new float[tam];
    tAnx = new float[tam];
    tOby = new float[tam];
    tAny = new float[tam];
    v = new int[tam][tam];
    for(int i = 0; i<tam;i++){
      for(int j = 0; j<tam;j++){
        v[i][j] = i+j*tam;
      }
      tObx [i] = -1;
      tAnx [i] = -1;
      tOby [i] = -1;
      tAny [i] = -1;
    }
  }
  
  int getV(int i_, int j_){
    return(v[i_][j_]);
  }
  
  void arriba(int n_){
    int sa = v[n_][tam-1];
    for(int i = tam-1;i>0;i--){
      v[n_][i] = v[n_][i-1];
    }
    v[n_][0] = sa;
  }
  
  void abajo(int n_){
    int sa = v[n_][0];
    for(int i = 0;i<tam-1;i++){
      v[n_][i] = v[n_][i+1];
    }
    v[n_][tam-1] = sa;
  }
  
  void izq(int n_){
    int sa = v[tam-1][n_];
    for(int i = tam-1;i>0;i--){
      v[i][n_] = v[i-1][n_];
    }
    v[0][n_] = sa;
  }
  
  void dere(int n_){
    int sa = v[0][n_];
    for(int i = 0;i<tam-1;i++){
      v[i][n_] = v[i+1][n_];
    }
    v[tam-1][n_] = sa;
  }
  
   void update(){
     for(int i = 0; i<tam;i++){
       if (t>= tAnx[i] && t<=tObx[i]){
         difx[i] = map(t,tAnx[i],tObx[i],difxAn[i],difxOb[i]);
       }
       if (t>= tAny[i] && t<=tOby[i]){
         dify[i] = map(t,tAny[i],tOby[i],difyAn[i],difyOb[i]);
       }
     }
     for(int i = 0; i<tam;i++){
       if (t==tObx[i]){
         difx[i] = 0;
         if(difxOb[i]>0){
           for(int j = 0; j<difxOb[i];j++){
             abajo(i);
           }
         }
         if(difxOb[i]<0){
           for(int j = 0; j<abs(difxOb[i]);j++){
             arriba(i);
           }
         }
       }
       if (t==tOby[i]){
         dify[i] = 0;
         if(difyOb[i]>0){
           for(int j = 0; j<difyOb[i];j++){
             dere(i);
           }
         }
         if(difyOb[i]<0){
           for(int j = 0; j<abs(difyOb[i]);j++){
             izq(i);
           }
         }
       }
     }
   }
   
   void setY(int v_, float val_, float tO_ ){
     difxOb[v_] = val_; 
     difxAn[v_] = 0; 
     tObx[v_] = t+tO_; 
     tAnx[v_] = t;
   }
   
   void setX(int v_, float val_, float tO_ ){
     difyOb[v_] = val_; 
     difyAn[v_] = 0; 
     tOby[v_] = t+tO_; 
     tAny[v_] = t;
   }
}

int tamC = 8;
color []cols = new color[tamC*tamC];


float px = 100000;
float py = 100000;
int tam = 100;
int t;
Rubix rub;

void setup(){
  size(1000,500);
  for(int i = 0; i<tamC*tamC;i++){
    
    cols[i] = color(random(255),random(255),random(255));
   
  }
  rub = new Rubix(tamC);
}

void draw(){
   tam = 100;
  py-=0.01;
  px+=0.02;
  
  rub.update();
  
  float inix = width*0.5 +(px%1)*tam;
  float iniy = height*0.5 +(py%1)*tam;
  background(255);
  int aDere = ceil((width-inix)/tam)+1;
  int aIzq = ceil(inix/tam)+2;
  int aArriba = ceil(iniy/tam)+2;
  int aAbajo = ceil((height-iniy)/tam)+1;
  
  for(int i = 0; i< tamC; i++){
    if(i%2 == 0){
      //dify[i] = map(mouseX,0,width,-1,1);
    }
  }
  
  for(int i = 0;i<aDere; i++){
    int vx = (floor(px)-i)%tamC;
    for(int j = 0; j<aAbajo; j++){
      int vy = (floor(py)-j)%tamC;
      
      fill(cols[rub.getV(vx,vy)]);
      rect(inix+i*tam+rub.dify[vy]*tam,iniy+j*tam+rub.difx[vx]*tam,tam,tam);
    }
     for(int j = 1; j<aArriba; j++){
      int vy = (floor(py)+j)%tamC;
      fill(cols[rub.getV(vx,vy)]);
      rect(inix+i*tam+rub.dify[vy]*tam,iniy-j*tam+rub.difx[vx]*tam,tam,tam);
    }
  }
  
  for(int i = 1;i<aIzq; i++){
    int vx = (floor(px)+i)%tamC;
    for(int j = 0; j<aAbajo; j++){
      int vy = (floor(py)-j)%tamC;
      fill(cols[rub.getV(vx,vy)]);
      rect(inix-i*tam+rub.dify[vy]*tam,iniy+j*tam+rub.difx[vx]*tam,tam,tam);
    }
     for(int j = 1; j<aArriba; j++){
      int vy = (floor(py)+j)%tamC;
      fill(cols[rub.getV(vx,vy)]);
      rect(inix-i*tam+rub.dify[vy]*tam,iniy-j*tam+rub.difx[vx]*tam,tam,tam);
    }
  }
  t++;
}

void keyPressed(){
  if (key == 'q'){
    rub.abajo(0);
    rub.abajo(2);
    rub.abajo(4);
    rub.abajo(6);
  }
  if (key == 'w'){
    rub.arriba(0);
    rub.arriba(2);
    rub.arriba(4);
    rub.arriba(6);
  }
  
  if (key == 'e'){
    rub.izq(0);
    rub.izq(2);
    rub.izq(4);
    rub.izq(6);
  }
  if (key == 'r'){
    rub.dere(0);
    rub.dere(2);
    rub.dere(4);
    rub.dere(6);
  }
  
  if(key =='a'){
    rub.setY(0,-1,50);
    rub.setY(2,-1,50);
    rub.setY(4,-1,50);
    rub.setY(6,-1,50);
    println("f");
  }
  
  if(key =='d'){
    rub.setX(0,-1,50);
    rub.setX(2,-1,50);
    rub.setX(4,-1,50);
    rub.setX(6,-1,50);
    println("f");
  }
  
  if(key =='s'){
    rub.setY(0,1,50);
    rub.setY(2,1,50);
    rub.setY(4,1,50);
    rub.setY(6,1,50);
    println("f");
  }
  
  if(key =='f'){
    rub.setX(0,1,50);
    rub.setX(2,1,50);
    rub.setX(4,1,50);
    rub.setX(6,1,50);
    println("f");
  }
}
