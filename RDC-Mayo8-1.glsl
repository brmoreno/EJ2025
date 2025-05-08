#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float freq[3];
uniform float ofs [3];
uniform int proceso;

float sdBox( in vec2 p, in vec2 b ) { vec2 d = abs(p)-b; return length(max(d,0.0)) + min(max(d.x,d.y),0.0); }

void main(){
    vec2 pos = vertTexCoord.st;
    vec2 pos2 = pos;
    pos2 -= vec2(0.5,sin(t*0.002)*0.5+0.5);
    float v = sdBox(pos2, vec2(0.5,0.1));
    vec3 colorA = texture2D(texture,pos).rgb;
    float rojo = texture2D(texture,pos+vec2(ofs[0],0.)).r;
    float verde = texture2D(texture,pos + vec2(ofs[1],0.)).g;
    float azul = texture2D(texture,pos+vec2(ofs[2],0.)).b;
    vec3 colorB = vec3(rojo,verde,azul);
    vec3 color = mix(colorB,colorA,step(0.,v));
    
    vec2 pos3 = pos;
    pos3 -= vec2(0.5,-sin(t*0.0024)*0.5+0.5);
    float v2  = sdBox(pos3, vec2(0.5,0.1));
    colorB = vec3(1.)-colorA;
    color = mix(colorB,color,step(0.,v2));
    
    gl_FragColor = vec4(color,1.0);
}
