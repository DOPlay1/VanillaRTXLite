#ifndef VRTX_REFLECTIONS_GLSL
#define VRTX_REFLECTIONS_GLSL

// Computes the bounded material coefficient used to scale an approved source.
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

vec3 getEnvironmentReflectionSource(vec3 skyColor) {
    vec3 safeSkyColor = clamp(skyColor, vec3(0.0), vec3(1.0));
    float skyLuminance = dot(safeSkyColor, vec3(0.2126, 0.7152, 0.0722));
    vec3 neutralSkyColor = vec3(skyLuminance);

    return mix(neutralSkyColor, safeSkyColor, VRTX_ENVIRONMENT_REFLECTION_SATURATION);
}

vec3 computeEnvironmentReflectionContribution(
    vec3 skyColor,
    int materialId,
    float viewCosine
) {
    float reflectionWeight = computeMaterialReflectionWeight(materialId, viewCosine);

    if (reflectionWeight <= VRTX_EPSILON) {
        return vec3(0.0);
    }

    float boundedWeight = clamp(
        reflectionWeight * VRTX_ENVIRONMENT_REFLECTION_SCALE,
        0.0,
        1.0
    );

    return getEnvironmentReflectionSource(skyColor) * boundedWeight;
}

vec3 applyEnvironmentReflection(
    vec3 baseColor,
    vec3 skyColor,
    int materialId,
    float viewCosine
) {
    float reflectionWeight = computeMaterialReflectionWeight(materialId, viewCosine);

    if (reflectionWeight <= VRTX_EPSILON) {
        return baseColor;
    }

    float boundedWeight = clamp(
        reflectionWeight * VRTX_ENVIRONMENT_REFLECTION_SCALE,
        0.0,
        1.0
    );

    return mix(baseColor, getEnvironmentReflectionSource(skyColor), boundedWeight);
}

#endif
