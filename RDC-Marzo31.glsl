#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER


uniform float t;
uniform vec2 res;
uniform vec2 mouse;
varying vec4 vertTexCoord;
uniform sampler2D texture;




void main(){
    vec2 pos = vertTexCoord.st;
    vec3 color = texture2D(texture,pos).rgb;
    gl_FragColor = vec4(color,1.0);
}
