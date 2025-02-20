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


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    int vy  = int(floor(pos.y*4.0));
    
    float dx = t*0.0001;
    if(vy%2 == 0){
        dx*=-1;
    }
    
    float v0 = dx+ pos.x + sin(t*0.002+pos.y*PI*12)*0.1;
    int vx = int(floor(mod(v0*6.0,6.0)));
    float v1 = abs(sin(v0*PI*6.));
    float v2 = abs(v1*sin(pos.y*PI*4.));
    float v3 = smoothstep(0.1,0.2,v2);
    vec3 rgb = vec3(r[vx],g[vx],b[vx])*v3;
    gl_FragColor = vec4(rgb,1.0);
}
