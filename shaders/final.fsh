#version 120

uniform sampler2D colortex0;

varying vec2 texcoord;

#include "/shaders/include/constants.glsl"
#include "/shaders/lib/color_pipeline.glsl"
#include "/shaders/lib/debug_views.glsl"

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;

    color = applyBaselineColorPipeline(color);
    color = applyDebugView(color);

    gl_FragColor = vec4(color, 1.0);
}