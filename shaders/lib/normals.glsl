#ifndef VRTX_NORMALS_GLSL
#define VRTX_NORMALS_GLSL

vec2 getNonZeroSign(vec2 value) {
    return vec2(
        value.x >= 0.0 ? 1.0 : -1.0,
        value.y >= 0.0 ? 1.0 : -1.0
    );
}

vec2 encodeOctahedralNormal(vec3 normal) {
    vec3 safeNormal = normalize(normal);
    safeNormal /= max(
        abs(safeNormal.x) + abs(safeNormal.y) + abs(safeNormal.z),
        VRTX_EPSILON
    );

    if (safeNormal.z < 0.0) {
        safeNormal.xy = (1.0 - abs(safeNormal.yx)) * getNonZeroSign(safeNormal.xy);
    }

    return safeNormal.xy * 0.5 + 0.5;
}

vec3 decodeOctahedralNormal(vec2 encodedNormal) {
    vec2 octahedral = encodedNormal * 2.0 - 1.0;
    vec3 normal = vec3(
        octahedral.xy,
        1.0 - abs(octahedral.x) - abs(octahedral.y)
    );

    if (normal.z < 0.0) {
        normal.xy = (1.0 - abs(normal.yx)) * getNonZeroSign(normal.xy);
    }

    return normalize(normal);
}

#endif
