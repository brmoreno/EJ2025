
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


void main(){
    vec2 pos = vertTexCoord.st;
    pos-=vec2(0.5);
    float mag= length(pos);
    float an = atan(pos.y,pos.x);
    if (an<0){
        an=6.28+an;
    }
    int val = int(floor((an/6.28)*8));
    an = fract((an/6.28)*8);
    
    float valy = fract((an*0.25)+mouse.x*2.);
    if(val%2 == 0){
        valy =fract(0.25-((an*0.25)-mouse.x*2.));
    }
    vec3 color = texture2D(texture,vec2(fract(mag*6*mouse.y),valy)).rgb;
    
   
    gl_FragColor = vec4(color,1.0);
}
