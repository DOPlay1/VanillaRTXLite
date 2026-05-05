#ifndef VRTX_DEBUG_VIEWS_GLSL
#define VRTX_DEBUG_VIEWS_GLSL

int getDebugViewMode() {
    return VRTX_DEBUG_OFF;
}

vec3 applyDebugView(vec3 color) {
    // Level 1 placeholder: debug routing exists, but normal output remains unchanged.
    return color;
}

#endif