#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D gato2;
uniform float px [100];
uniform float py [100];
uniform float a [100];
uniform float dx [100];
uniform float dy [100];


void main(){
    vec2 pos = vertTexCoord.st;
    vec2 defTotal = vec2(0.);
    for (int i = 0; i<100; i++){
        vec2 nodo = vec2(px[i],py[i]);
        float area =  a[i];
        vec2 def = vec2(dx[i],dy[i]);
        float dist = distance(pos,nodo);
        if(dist < area){
            float am = (dist - area)/area;
            def*=am;
            defTotal+=def;
        }
    }
    vec3 color = texture2D(texture,pos+defTotal).rgb;
    
    gl_FragColor = vec4(color,1.0);
}
