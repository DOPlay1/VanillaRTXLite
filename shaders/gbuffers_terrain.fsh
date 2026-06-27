#version 120

#include "/include/constants.glsl"
#include "/lib/normals.glsl"

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform vec3 fogColor;
uniform float fogDensity;
uniform float fogStart;
uniform float fogEnd;
uniform int fogMode;

varying vec2 texcoord;
varying vec2 lightmapCoord;
varying vec4 vertexColor;
varying vec3 viewPosition;
#if VRTX_MATERIAL_DATA_ENABLED == 1
varying vec3 viewNormal;
varying float materialId;
#endif

#if VRTX_MATERIAL_DATA_ENABLED == 1
/* RENDERTARGETS: 0,4 */
#else
/* RENDERTARGETS: 0 */
#endif

float computeVanillaFogFactor(float viewDistance) {
    if (fogMode == 2048) {
        return clamp(exp(-viewDistance * fogDensity), 0.0, 1.0);
    }

    if (fogMode == 2049) {
        float densityDistance = viewDistance * fogDensity;
        return clamp(exp(-(densityDistance * densityDistance)), 0.0, 1.0);
    }

    float fogRange = max(fogEnd - fogStart, VRTX_EPSILON);
    return clamp((fogEnd - viewDistance) / fogRange, 0.0, 1.0);
}

#if VRTX_MATERIAL_DATA_ENABLED == 1
float encodeMaterialId(float rawMaterialId) {
    if (rawMaterialId < 0.0) {
        return 0.0;
    }

    float roundedMaterialId = floor(rawMaterialId + 0.5);
    return clamp(roundedMaterialId, 0.0, 255.0) / 255.0;
}

float computeViewCosine(vec3 surfaceNormal, vec3 surfaceViewPosition) {
    float viewDistance = length(surfaceViewPosition);

    if (viewDistance <= VRTX_EPSILON) {
        return 1.0;
    }

    vec3 safeNormal = normalize(surfaceNormal);
    vec3 viewDirection = -surfaceViewPosition / viewDistance;

    // The absolute value keeps translucent backfaces bounded and symmetric.
    return clamp(abs(dot(safeNormal, viewDirection)), 0.0, 1.0);
}
#endif

void main() {
    vec4 albedo = texture2D(texture, texcoord) * vertexColor;

    if (albedo.a < 0.1) {
        discard;
    }

    albedo.rgb *= texture2D(lightmap, lightmapCoord).rgb;

    float viewDistance = length(viewPosition);
    float fogFactor = computeVanillaFogFactor(viewDistance);
    albedo.rgb = mix(fogColor, albedo.rgb, fogFactor);

    gl_FragData[0] = albedo;

#if VRTX_MATERIAL_DATA_ENABLED == 1
    float encodedMaterialId = encodeMaterialId(materialId);
    float viewCosine = computeViewCosine(viewNormal, viewPosition);
    vec2 encodedViewNormal = encodeOctahedralNormal(viewNormal);

    gl_FragData[1] = vec4(encodedMaterialId, viewCosine, encodedViewNormal);
#endif
}
