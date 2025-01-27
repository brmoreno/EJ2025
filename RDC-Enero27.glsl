#ifdef GL_ES
precision medium float ;
#endif

#define PROCESSING_COLOR_SHADER
uniform float rojo;
uniform float verde;
uniform float azul;

void main(){
    vec3 rgb = vec3(rojo,verde,azul);
    gl_FragColor = vec4(rgb,1.0);
}
