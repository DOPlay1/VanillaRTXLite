#version 120

uniform sampler2D colortex0;

varying vec2 texcoord;

#include "/include/constants.glsl"
#include "/lib/materials.glsl"
#include "/lib/color_pipeline.glsl"
#include "/lib/debug_views.glsl"

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;

    int materialId = VRTX_MATERIAL_UNKNOWN;

    color = applyBaselineColorPipeline(color);
    color = applyDebugView(color, texcoord, materialId);

    gl_FragColor = vec4(color, 1.0);
}
