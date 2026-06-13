#version 120

uniform sampler2D colortex0;
uniform sampler2D colortex4;

varying vec2 texcoord;

#include "/include/constants.glsl"
#include "/lib/materials.glsl"
#include "/lib/fresnel.glsl"
#include "/lib/color_pipeline.glsl"
#include "/lib/debug_views.glsl"

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;
#if VRTX_DEBUG_VIEW >= VRTX_DEBUG_MATERIAL_CATEGORY
    vec4 materialData = texture2D(colortex4, texcoord);

    int materialId = int(floor(materialData.r * 255.0 + 0.5));
    float viewCosine = clamp(materialData.g, 0.0, 1.0);
#else
    int materialId = VRTX_MATERIAL_UNKNOWN;
    float viewCosine = 1.0;
#endif

    color = applyBaselineColorPipeline(color);
    color = applyDebugView(color, texcoord, materialId, viewCosine);

    gl_FragColor = vec4(color, 1.0);
}
