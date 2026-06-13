#version 120

#include "/include/constants.glsl"

#if VRTX_DEBUG_VIEW >= VRTX_DEBUG_MATERIAL_CATEGORY
attribute vec2 mc_Entity;
#endif

varying vec2 texcoord;
varying vec2 lightmapCoord;
varying vec4 vertexColor;
varying vec3 viewPosition;
#if VRTX_DEBUG_VIEW >= VRTX_DEBUG_MATERIAL_CATEGORY
varying vec3 viewNormal;
varying float materialId;
#endif

void main() {
    vec4 vertexViewPosition = gl_ModelViewMatrix * gl_Vertex;

    gl_Position = gl_ProjectionMatrix * vertexViewPosition;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lightmapCoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    vertexColor = gl_Color;
    viewPosition = vertexViewPosition.xyz;
#if VRTX_DEBUG_VIEW >= VRTX_DEBUG_MATERIAL_CATEGORY
    viewNormal = normalize(gl_NormalMatrix * gl_Normal);

    // mc_Entity.x is assigned by block.properties. Iris reports -1 for
    // unmapped blocks, which is converted to the conservative fallback later.
    materialId = mc_Entity.x;
#endif
}
