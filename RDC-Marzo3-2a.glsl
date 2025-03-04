#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
float PI = 3.1415926535;
uniform float dx[6];
uniform float dy[6];
uniform float r [8];
uniform float g [8];
uniform float b [8];

vec3 colorCos(float t){
    vec3  a = vec3(0.5);
    vec3  b = vec3(0.5);
    vec3 c = vec3(1.0);
    vec3 d = vec3(0.0, 0.66, 0.33);
    return (a+b*cos((PI*2)*(c*t+d)));
}


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    float ratio = res.x/res.y;
    pos.x *= ratio;
    int tam = 20;
    vec2 posc = pos;
    posc.x *= 0.8;
    posc.y += sin(pos.x*PI+t*0.001)*0.3;
    posc.x+=t*0.0001;
    float c1 = step(distance(fract(posc*tam),vec2(0.5)),.5);
    float c2 = step(distance(fract(posc*tam),vec2(1.,0.)),.5);
    float c3 = step(distance(fract(posc*tam),vec2(1.,1.)),.5);
    float c4 = clamp(c1-(c2+c3),0.,1.0);
    
    float ppy = floor(posc.y*tam)/tam;
    float ppx = floor(posc.x*tam)/tam;
    
    float vf = 0;
    for(int i = 0; i<6; i++){
        vec2 ppos = vec2(ppx,ppy);
        vec2 difff =vec2(t*dx[i],t*dy[i]);
        //difff = vec2(0.);
        float vv =  clamp (1.-distance(fract(ppos*3.0+difff),vec2(0.5))*2.0,0.,1.);;
        vf += vv;
    }
    
    int va = int(mod(floor(vf),4));
    int vb = int(mod(ceil(vf),4));
    vec3 ca = vec3(r[va],g[va],b[va]);
    vec3 cb = vec3(r[vb],g[vb],b[vb]);
    vec3 col1 = mix(ca,cb,fract(vf));
    vec3 rgb =  mix(vec3(0.),col1,c4);
    
    posc-=vec2(0.125);
    if(posc.y>0.5){
        ppy = ceil(posc.y*tam)/tam;
    }
    else{
        ppy = floor(posc.y*tam)/tam;
    }
    if(posc.x>0.5){
        ppx = ceil(posc.x*tam)/tam;
    }
    else{
        ppx = floor(posc.x*tam)/tam;
    }
    
    vf = 0;
    for(int i = 0; i<6; i++){
        vec2 ppos = vec2(ppx,ppy);
        vec2 difff = vec2(t*dx[i],t*dy[i]);
        //difff = vec2(0.);
        float vv =  clamp (1.-distance(fract(ppos*1.0+difff),vec2(0.5))*2.0,0.,1.);;
        vf += vv;
    }
    
    
    float d1 = step(distance(fract(posc*tam),vec2(0.5)),.5);
    float d2 = step(distance(fract(posc*tam),vec2(1.,0.)),.5);
    float d3 = step(distance(fract(posc*tam),vec2(1.,1.)),.5);
    float d4 = clamp(d1-(d2+d3),0.,1.);
    
    va = int(mod(floor(vf),4)+4);
    vb = int(mod(ceil(vf),4)+4);
    ca = vec3(r[va],g[va],b[va]);
    cb = vec3(r[vb],g[vb],b[vb]);
    col1 = mix(ca,cb,fract(vf));
    rgb = mix(rgb,col1,d4);
    
    
    
    gl_FragColor = vec4(rgb,1.0);
}
