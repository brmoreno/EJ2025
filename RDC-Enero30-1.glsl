#ifdef GL_ES
precision medium float ;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    float r = sin(t*0.01 +pos.x*50.0)*0.5+0.5;
    float g = sin(-t*0.01 +pos.x*80.0)*0.4+0.4;
    float b = sin(t*0.02 +pos.x*30.0)*0.5+0.5;;
    vec3 rgb = vec3(r,g,b);
    gl_FragColor = vec4(rgb,1.0);
}
