#ifndef VRTX_REFLECTIONS_GLSL
#define VRTX_REFLECTIONS_GLSL

// Computes the bounded material coefficient that may scale a future reflection source.
// This helper does not sample or produce reflections by itself.
float computeMaterialReflectionWeight(int materialId, float viewCosine) {
    if (!materialAllowsReflection(materialId)) {
        return 0.0;
    }

    float reflectivity = clamp(getMaterialReflectivity(materialId), 0.0, 1.0);
    float roughness = clamp(getMaterialBaseRoughness(materialId), 0.0, 1.0);
    float fresnelStrength = clamp(getMaterialFresnelStrength(materialId), 0.0, 1.0);
    float fresnelFactor = computeBoundedFresnel(
        viewCosine,
        fresnelStrength,
        fresnelStrength
    );
    float roughnessAttenuation = 1.0 - roughness;

    return clamp(
        reflectivity * fresnelFactor * roughnessAttenuation,
        0.0,
        1.0
    );
}

#endif
