#version 120

#include "/include/constants.glsl"

uniform sampler2D colortex0;
uniform sampler2D colortex4;
uniform vec3 skyColor;
#if VRTX_DEBUG_VIEW == VRTX_DEBUG_SSR_TRACE_STATUS
uniform sampler2D depthtex0;
uniform mat4 gbufferProjection;
uniform mat4 gbufferProjectionInverse;
#endif

varying vec2 texcoord;

#include "/profiles/balanced.glsl"
#include "/lib/materials.glsl"
#include "/lib/normals.glsl"
#include "/lib/fresnel.glsl"
#include "/lib/reflections.glsl"
#if VRTX_DEBUG_VIEW == VRTX_DEBUG_SSR_TRACE_STATUS
#include "/lib/ssr.glsl"
#endif
#include "/lib/color_pipeline.glsl"
#include "/lib/debug_views.glsl"

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;
#if VRTX_MATERIAL_DATA_ENABLED == 1
    vec4 materialData = texture2D(colortex4, texcoord);

    int materialId = int(floor(materialData.r * 255.0 + 0.5));
    float viewCosine = clamp(materialData.g, 0.0, 1.0);
    vec3 viewNormal = decodeOctahedralNormal(materialData.ba);
#else
    int materialId = VRTX_MATERIAL_UNKNOWN;
    float viewCosine = 1.0;
    vec3 viewNormal = vec3(0.0, 0.0, 1.0);
#endif

    color = applyBaselineColorPipeline(color);
    color = applyDebugView(
        color,
        texcoord,
        skyColor,
        materialId,
        viewCosine,
        viewNormal
    );

    gl_FragColor = vec4(color, 1.0);
}
