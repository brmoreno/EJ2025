#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float px [100];
uniform float py [100];
uniform float a [100];
uniform float r [100];
uniform float g [100];
uniform float b [100];
uniform float f [100];

float random (vec2 st, vec2 a_, float b_) {
    return fract(sin(dot(st.xy,
                         a_))*
        b_);
}

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    float distmin= 1.0;
    int indice = 0;
    for(int i = 0;i <100; i++){
        vec2 nodo = vec2(px[i],py[i]);
        float dist = distance(pos,nodo);
        if(dist<distmin){
            distmin = dist;
            indice = i;
        }
    }
    gl_FragColor = vec4(r[indice],g[indice],b[indice],1.0);
}


/*
void main(){
    vec2 pos = gl_FragCoord.xy/res;;
    float fTotal = 0.;
    for (int i = 0; i<100; i++){
        vec2 nodo = vec2(px[i],py[i]);
        float area =  a[i];
        float f = f[i];
        float dist = distance(pos,nodo);
        if(dist < area){
            float am = (dist - area)/area;
            f*=am;
            fTotal+=f;
        }
    }
    
    float v1 = fract(abs(fTotal)*50.);
    int v2 = int(floor(abs(fTotal)*50));
    vec3 color = vec3(1.0);
    if(v2%2==0){
        color = vec3(0.);
    }
    
    gl_FragColor = vec4(color,1.0);
}
*/


