#version 120

/* RENDERTARGETS: 0 */

uniform sampler2D colortex0;
uniform sampler2D colortex4;
uniform vec3 skyColor;

varying vec2 texcoord;

#include "/include/constants.glsl"
#include "/profiles/balanced.glsl"
#include "/lib/materials.glsl"
#include "/lib/fresnel.glsl"
#include "/lib/reflections.glsl"

void main() {
    vec4 sceneColor = texture2D(colortex0, texcoord);

#if VRTX_ENVIRONMENT_REFLECTIONS_ENABLED == 1
    vec4 materialData = texture2D(colortex4, texcoord);
    int materialId = int(floor(materialData.r * 255.0 + 0.5));
    float viewCosine = clamp(materialData.g, 0.0, 1.0);

    sceneColor.rgb = applyEnvironmentReflection(
        sceneColor.rgb,
        skyColor,
        materialId,
        viewCosine
    );
#endif

    gl_FragColor = sceneColor;
}
