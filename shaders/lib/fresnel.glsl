#ifndef VRTX_FRESNEL_GLSL
#define VRTX_FRESNEL_GLSL

// Computes a bounded Schlick-style angle response for approved materials.
// This helper must not be used to enable reflection on matte surfaces.
float computeBoundedFresnel(float cosTheta, float strength, float maxValue) {
    float safeCosTheta = clamp(cosTheta, 0.0, 1.0);
    float safeStrength = clamp(strength, 0.0, 1.0);
    float safeMaxValue = clamp(maxValue, 0.0, 1.0);
    float grazingResponse = pow(1.0 - safeCosTheta, 5.0);

    return clamp(grazingResponse * safeStrength, 0.0, safeMaxValue);
}

#endif
