#version 120

varying vec2 texcoord;
varying vec2 lightmapCoord;
varying vec4 vertexColor;

void main() {
    gl_Position = ftransform();

    texcoord = gl_MultiTexCoord0.xy;
    lightmapCoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    vertexColor = gl_Color;
}