#ifdef GL_ES
precision medium float ;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float r [4];
uniform float g [4];
uniform float b [4];
uniform int paso;
uniform float a;


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    pos-= vec2(0.5);
    vec2 pos2 = vec2(pos.x*cos(a)-pos.y*sin(a), pos.x*sin(a)+pos.y*cos(a));
    float dist = distance(vec2(0.0),pos);
    if(paso== 1){
        dist = pos2.x;
    }
    float px = dist*7.+t*0.005;
    int vx = int(floor(mod(px,4)));
    vec3 rgb = vec3(r[vx],g[vx],b[vx]);
    gl_FragColor = vec4(rgb,1.0);
}
