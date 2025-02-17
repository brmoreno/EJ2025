#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform float t;
uniform vec2 res;
uniform vec2 mouse;
uniform float limite[10];
uniform float escala[10];
uniform float r[10];
uniform float g[10];
uniform float b[10];
uniform float mov[10];
uniform float a[10];




void main(){
    vec2 pos = gl_FragCoord.xy/res;
    pos-= vec2(0.5);
    vec3 rgb = vec3(0.);
    for(int i = 0; i<10; i++){
        
        vec2 pos2 = vec2(pos.x*cos(a[i]*t)-pos.y*sin(a[i]*t), pos.x*sin(a[i]*t)+pos.y*cos(a[i]*t));
        float v = step(limite[i],fract(mov[i]*t+pos2.x*escala[i]));
        if(i%2 == 0){
            v = step(limite[i],fract(mov[i]*t+pos2.y*escala[i]));
        }
        // aditivo
        rgb += vec3(r[i],g[i],b[i])*v;
        //sustucion
        //rgb = mix(rgb,vec3(r[i],g[i],b[i]),v);
        
    }
    
    gl_FragColor = vec4(rgb,1.0);
}
