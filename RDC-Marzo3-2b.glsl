#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
float PI = 3.1415926535;


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec2 centro = vec2(1.5,0.5);
    float distancia = sin(-t*0.01+distance(centro,pos)*20.0)*0.5+0.5;
    vec3 color1= vec3(1.0,0.,0.);
    vec3 color2= vec3(0.0,0.,1.);
    vec3 rgb = mix(color1,color2,distancia);
    gl_FragColor = vec4(rgb,1.0);
}
