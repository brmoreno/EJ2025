#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
float PI = 3.1415926535;
uniform float r [6];
uniform float g [6];
uniform float b [6];
uniform float escalas [4];
uniform float petalos [4];

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 rgb = vec3(0.);
    float valColor = 0;
    for(int i = 0 ; i<4; i++){
        float escala = escalas[i];
        float a = atan(fract(pos.x*escala)-0.5,fract(pos.y*escala)-0.5);
        float v0 = 1.-distance(fract(pos*escala),vec2(0.5));
        float v1 = step(sin(t*0.001+a*petalos[i])*0.1 +0.6,v0);
        valColor += v1;
        int vC = int(floor(mod(valColor,6)));
        rgb = vec3(r[vC],g[vC],b[vC]);
    }
    
    gl_FragColor = vec4(rgb,1.0);
}
