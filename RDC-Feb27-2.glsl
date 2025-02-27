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
    
    
    float v1  = step(distance(pos,vec2(1.0,0.5)),0.5);
    float v0 = step(distance(pos,vec2(1.0,0.1)),0.5);
    //float v = step(2.,v0+v1);
    
    float v = step(fract(pos.x*4.0),fract(abs(sin(PI+pos.y*PI*4.0))));
    vec3 rgb = vec3(v);
    
    gl_FragColor = vec4(rgb,1.0);
}
