#ifndef VRTX_SSR_GLSL
#define VRTX_SSR_GLSL

vec3 reconstructViewPosition(vec2 screenUv, float depth) {
    vec4 clipPosition = vec4(screenUv * 2.0 - 1.0, depth * 2.0 - 1.0, 1.0);
    vec4 viewPosition = gbufferProjectionInverse * clipPosition;
    float safeW = abs(viewPosition.w) > VRTX_EPSILON
        ? viewPosition.w
        : (viewPosition.w >= 0.0 ? VRTX_EPSILON : -VRTX_EPSILON);

    return viewPosition.xyz / safeW;
}

vec3 projectViewPosition(vec3 viewPosition) {
    vec4 clipPosition = gbufferProjection * vec4(viewPosition, 1.0);

    if (abs(clipPosition.w) <= VRTX_EPSILON) {
        return vec3(-1.0);
    }

    vec3 normalizedDevicePosition = clipPosition.xyz / clipPosition.w;
    return normalizedDevicePosition * 0.5 + 0.5;
}

bool isInsideScreen(vec2 screenUv) {
    return screenUv.x > 0.0 && screenUv.x < 1.0
        && screenUv.y > 0.0 && screenUv.y < 1.0;
}

vec3 traceSsrDebugStatus(
    vec2 screenUv,
    int materialId,
    vec3 surfaceNormal
) {
    if (!materialAllowsReflection(materialId)) {
        return vec3(0.0);
    }

    float surfaceDepth = texture2D(depthtex0, screenUv).r;

    if (surfaceDepth >= 1.0 - VRTX_EPSILON) {
        return vec3(1.0, 1.0, 0.0);
    }

    vec3 surfacePosition = reconstructViewPosition(screenUv, surfaceDepth);
    vec3 incidentDirection = normalize(surfacePosition);
    vec3 safeSurfaceNormal = normalize(surfaceNormal);

    if (dot(safeSurfaceNormal, incidentDirection) > 0.0) {
        safeSurfaceNormal = -safeSurfaceNormal;
    }

    vec3 reflectionDirection = normalize(reflect(incidentDirection, safeSurfaceNormal));
    float travelDistance = VRTX_SSR_DEBUG_START_DISTANCE;

    for (int stepIndex = 0; stepIndex < VRTX_SSR_DEBUG_STEP_COUNT; ++stepIndex) {
        float stepScale = float(stepIndex);
        travelDistance += VRTX_SSR_DEBUG_BASE_STEP
            + VRTX_SSR_DEBUG_STEP_GROWTH * stepScale;

        vec3 rayPosition = surfacePosition + reflectionDirection * travelDistance;
        vec3 projectedPosition = projectViewPosition(rayPosition);

        if (!isInsideScreen(projectedPosition.xy)
            || projectedPosition.z <= 0.0
            || projectedPosition.z >= 1.0) {
            return vec3(1.0, 0.0, 0.0);
        }

        float sceneDepth = texture2D(depthtex0, projectedPosition.xy).r;

        if (sceneDepth >= 1.0 - VRTX_EPSILON) {
            continue;
        }

        vec3 scenePosition = reconstructViewPosition(projectedPosition.xy, sceneDepth);
        float depthDifference = rayPosition.z - scenePosition.z;
        float traceThickness = VRTX_SSR_DEBUG_THICKNESS
            * (1.0 + 0.05 * stepScale);

        if (depthDifference <= 0.0 && depthDifference >= -traceThickness) {
            return vec3(0.0, 1.0, 0.0);
        }
    }

    return vec3(0.0, 0.25, 1.0);
}

#endif
