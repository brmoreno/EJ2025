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
uniform float r [4];
uniform float g [4];
uniform float b [4];

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
    float vf = 0;
    for(int i = 0; i<6; i++){
        float v =  clamp (1.-distance(fract(pos+vec2(t*dx[i],t*dy[i])),vec2(0.5))*2.0,0.,1.);;
        vf += v;
    }
    int va = int(mod(floor(vf),4));
    int vb = int(mod(ceil(vf),4));
    vec3 ca = vec3(r[va],g[va],b[va]);
    vec3 cb = vec3(r[vb],g[vb],b[vb]);
    //mandando paleta
    vec3 rgb = mix(ca,cb,fract(vf));
    
    //utilizando paleta de coseno
    //vec3 rgb = colorCos(vf*0.5);
    gl_FragColor = vec4(rgb,1.0);
}
