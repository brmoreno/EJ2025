#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
float PI = 3.1415926535;
uniform float px[100];
uniform float py[100];
uniform float angulo[100];
uniform float tam[100];
uniform float r[100];
uniform float g[100];
uniform float b[100];
uniform float escala[100];

float sdVesica(vec2 p, float r, float d)
{
    p = abs(p);

    float b = sqrt(r*r-d*d);  // can delay this sqrt by rewriting the comparison
    return ((p.y-b)*d > p.x*b) ? length(p-vec2(0.0,b))*sign(d)
                               : length(p-vec2(-d,0.0))-r;
}

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


float sdPie( in vec2 p, in vec2 c, in float r )
{
    p.x = abs(p.x);
    float l = length(p) - r;
    float m = length(p-c*clamp(dot(p,c),0.0,r)); // c=sin/cos of aperture
    return max(l,m*sign(c.y*p.x-c.x*p.y));
}

float pez (vec2 p, float x, float y, float r, float w, float h){
    p -= vec2(x,y);
    p *= rotate2d( -PI/2+ r);
    float v = sdVesica(p,w,w*h);
    if (v<0.){
        v = 1;
    }
    else{
        v = 0;
    }
    p -= vec2(0,+w*0.7);
    float v1 = sdPie(p,vec2(sin(0.6),cos(0.6)),w*0.4);
    if (v1<0.){
        v1 = 1;
    }
    else{
        v1 = 0;
    }
    return  v+v1;
}

void main(){
    vec2 pos = gl_FragCoord.xy/res;
    vec3 rgb = vec3(0.);
    for(int i = 0; i<100; i++){
        float v = pez(pos,px[i],py[i],angulo[i],tam[i],0.7);
        vec3 colora = vec3(r[i],g[i],b[i])*v;
        vec3 colorb = vec3(r[(i+2)%100],g[(i+2)%100],b[(i+2)%100])*v;
        vec2 ve = vec2(-tam[i]*0.5,0.)*rotate2d(angulo[i]);
        ve.y*= -1;
        vec2 posa = vec2(px[i],py[i]) - ve;
        float vvx = step(fract(distance(posa,pos)*escala[i]+t*0.001),0.5);
        vec3 color = mix(colora,colorb,vvx);
        //rgb = mix(rgb,color,v);
        rgb+= color*v;
    }
    gl_FragColor = vec4(rgb,1.0);
}
