#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform vec2 v1;
uniform vec2 v2;
uniform float t1;
uniform float t2;
uniform vec3 c1;
uniform vec3 c2;



void main(){
    vec2 pos = gl_FragCoord.xy/res;
    float dist  = 1.0-clamp(distance(v1,pos),0.0,1.0)*t1;
    float dist2 = 1.0 - clamp(distance(v2,pos),0.0,1.0)*t2;
    vec3 rgb = c1*dist + c2*dist2;
    gl_FragColor = vec4(rgb,1.0);
}
