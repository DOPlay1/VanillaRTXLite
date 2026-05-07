#ifndef VRTX_DEBUG_VIEWS_GLSL
#define VRTX_DEBUG_VIEWS_GLSL

int getDebugViewMode() {
    return VRTX_DEBUG_VIEW;
}

vec3 applyFinalPassMarker(vec3 color) {
    // Level 1 debug marker: confirms that final.fsh is controlling output.
    // This is intentionally visible but not intended as a final visual effect.
    return mix(color, vec3(1.0, 0.0, 1.0), 0.35);
}

vec3 applyUvGradientDebug(vec2 uv) {
    // Level 1 debug view: visualizes screen-space UV coordinates.
    return vec3(uv.xy, 0.0);
}

vec3 applyDebugView(vec3 color, vec2 uv) {
    int mode = getDebugViewMode();

    if (mode == VRTX_DEBUG_FINAL_PASS_MARKER) {
        return applyFinalPassMarker(color);
    }

    if (mode == VRTX_DEBUG_UV_GRADIENT) {
        return applyUvGradientDebug(uv);
    }

    return color;
}

#endif