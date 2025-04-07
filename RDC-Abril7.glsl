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
    vec3 color = texture2D(texture,pos).rgb;
    if(proceso == 1){
        float vy = 50*mouse.y;
        int v = int(floor(pos.y*vy));
        float dt = v%2 == 0? 1: -1;
        pos = fract(floor(pos*vec2(50,vy))/vec2(50,vy)+vec2(t*0.0001*dt));
         color = texture2D(texture,pos).rgb;
        
    }
    
    if(proceso == 2){
    
        int v = int(floor(pos.y*100.+ t*0.003));
        if(v%2 == 0){
            color += vec3(-0.1,0.02,0.2)*2.;
        }
        else{
            color += vec3(0.1, 0.12, -0.1)*2;
        }
        float dist = 0.75- distance(pos,vec2(0.5));
        color*=dist;
        
    }
    
    if(proceso == 3){
        float rojo = texture2D(texture,pos+vec2(ofs[0],0.)).r;
        float verde = texture2D(texture,pos + vec2(ofs[1],0.)).g;
        float azul = texture2D(texture,pos+vec2(ofs[2],0.)).b;
        color = vec3(rojo,verde,azul);

    }
    
    if(proceso == 4){
        vec2 d = vec2(sin(pos.y*50.*mouse.x)*0.2*mouse.y,sin(pos.x*50.*mouse.x)*0.2*mouse.y);
        color = texture2D(texture, pos+d).rgb;

    }
    
    if(proceso == 5){
        pos-=vec2(0.5);
        float mag= length(pos);
        float an = atan(pos.y,pos.x);
        if (an<0){
            an=6.29+an;
        }
        color = texture2D(texture,vec2(mag*2.,(an/6.29))).rgb;
    }
    
    
    gl_FragColor = vec4(color,1.0);
}
