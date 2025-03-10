#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
float PI = 3.1415926535;
uniform float x [50];
uniform float y [50];
uniform float tam [50];
uniform float r [50];
uniform float g [50];
uniform float b [50];
uniform float rota [50];

float miCirculo(vec2 p, vec2 centro, float r){
    float dist = distance(p,centro);
    float v = step(dist,r);
    return v;
}

float sdSegment( in vec2 p, in vec2 a, in vec2 b ) { vec2 pa = p-a, ba = b-a; float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 ); return length( pa - ba*h ); }
      
float ndot(vec2 a, vec2 b ) { return a.x*b.x - a.y*b.y; }

float sdRhombus( in vec2 p, in vec2 b ) { p = abs(p); float h = clamp( ndot(b-2.0*p,b)/dot(b,b), -1.0, 1.0 ); float d = length( p-0.5*b*vec2(1.0-h,1.0+h) ); return d * sign( p.x*b.y + p.y*b.x - b.x*b.y ); }
  

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 rgb = vec3(0.);
    for(int i = 0 ; i<50; i++){
        pos = gl_FragCoord.xy/res;
        pos-= vec2(x[i],y[i]);
        pos*=rotate2d(rota[i]*t);
        float v = sdRhombus(pos,vec2(tam[i],tam[i]*0.7));
        float v1 = smoothstep(0.12,0.,v);
        vec3 color = vec3(r[i],g[i],b[i]);
        rgb += color*v1;
    }
  
    gl_FragColor = vec4(rgb,1.0);
}
