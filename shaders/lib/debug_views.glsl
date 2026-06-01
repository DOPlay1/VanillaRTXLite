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

vec3 getMaterialCategoryDebugColor(int category) {
    if (category == VRTX_MATERIAL_CATEGORY_MATTE) {
        return vec3(0.35, 0.35, 0.35);
    }

    if (category == VRTX_MATERIAL_CATEGORY_PRIMARY_REFLECTIVE) {
        return vec3(0.0, 0.45, 1.0);
    }

    if (category == VRTX_MATERIAL_CATEGORY_SECONDARY_SPECULAR) {
        return vec3(1.0, 0.65, 0.15);
    }

    if (category == VRTX_MATERIAL_CATEGORY_POLISHED) {
        return vec3(0.9, 0.9, 1.0);
    }

    if (category == VRTX_MATERIAL_CATEGORY_CRYSTALLINE) {
        return vec3(0.65, 0.25, 1.0);
    }

    // Unknown material category.
    return vec3(0.08, 0.08, 0.08);
}

vec3 applyMaterialCategoryDebug(int materialId) {
    // Level 2 placeholder: this visualizes the category of a provided material ID.
    // Real block/material classification is not connected yet.
    int category = getMaterialCategory(materialId);

    return getMaterialCategoryDebugColor(category);
}

vec3 applyDebugView(vec3 color, vec2 uv, int materialId) {
    int mode = getDebugViewMode();

    if (mode == VRTX_DEBUG_FINAL_PASS_MARKER) {
        return applyFinalPassMarker(color);
    }

    if (mode == VRTX_DEBUG_UV_GRADIENT) {
        return applyUvGradientDebug(uv);
    }

    if (mode == VRTX_DEBUG_MATERIAL_CATEGORY) {
        return applyMaterialCategoryDebug(materialId);
    }

    return color;
}

#endif