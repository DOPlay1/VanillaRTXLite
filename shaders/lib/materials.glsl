#ifndef VRTX_MATERIALS_GLSL
#define VRTX_MATERIALS_GLSL

int getMaterialCategory(int materialId) {
    if (
        materialId == VRTX_MATERIAL_DIRT_MATTE ||
        materialId == VRTX_MATERIAL_STONE_MATTE ||
        materialId == VRTX_MATERIAL_SAND_MATTE ||
        materialId == VRTX_MATERIAL_GRAVEL_MATTE ||
        materialId == VRTX_MATERIAL_WOOD_MATTE ||
        materialId == VRTX_MATERIAL_LEAVES_MATTE ||
        materialId == VRTX_MATERIAL_ROUGH_TERRAIN_MATTE
    ) {
        return VRTX_MATERIAL_CATEGORY_MATTE;
    }

    if (
        materialId == VRTX_MATERIAL_WATER ||
        materialId == VRTX_MATERIAL_GLASS ||
        materialId == VRTX_MATERIAL_TINTED_GLASS ||
        materialId == VRTX_MATERIAL_ICE
    ) {
        return VRTX_MATERIAL_CATEGORY_PRIMARY_REFLECTIVE;
    }

    if (
        materialId == VRTX_MATERIAL_COPPER_FRESH ||
        materialId == VRTX_MATERIAL_COPPER_OXIDIZED
    ) {
        return VRTX_MATERIAL_CATEGORY_SECONDARY_SPECULAR;
    }

    if (materialId == VRTX_MATERIAL_AMETHYST) {
        return VRTX_MATERIAL_CATEGORY_CRYSTALLINE;
    }

    return VRTX_MATERIAL_CATEGORY_UNKNOWN;
}

bool isMatteMaterial(int materialId) {
    return getMaterialCategory(materialId) == VRTX_MATERIAL_CATEGORY_MATTE;
}

bool isProtectedMatteMaterial(int materialId) {
    return isMatteMaterial(materialId);
}

bool materialAllowsReflection(int materialId) {
    int category = getMaterialCategory(materialId);

    if (category == VRTX_MATERIAL_CATEGORY_PRIMARY_REFLECTIVE) {
        return true;
    }

    if (category == VRTX_MATERIAL_CATEGORY_POLISHED) {
        return true;
    }

    return false;
}

float getMaterialBaseRoughness(int materialId) {
    if (materialId == VRTX_MATERIAL_DIRT_MATTE) {
        return 0.85;
    }

    if (materialId == VRTX_MATERIAL_STONE_MATTE) {
        return 0.78;
    }

    if (
        materialId == VRTX_MATERIAL_SAND_MATTE ||
        materialId == VRTX_MATERIAL_GRAVEL_MATTE
    ) {
        return 0.88;
    }

    if (materialId == VRTX_MATERIAL_WOOD_MATTE) {
        return 0.70;
    }

    if (materialId == VRTX_MATERIAL_LEAVES_MATTE) {
        return 0.80;
    }

    if (materialId == VRTX_MATERIAL_ROUGH_TERRAIN_MATTE) {
        return 0.85;
    }

    if (materialId == VRTX_MATERIAL_WATER) {
        return 0.18;
    }

    if (materialId == VRTX_MATERIAL_GLASS) {
        return 0.08;
    }

    if (materialId == VRTX_MATERIAL_TINTED_GLASS) {
        return 0.10;
    }

    if (materialId == VRTX_MATERIAL_ICE) {
        return 0.20;
    }

    if (materialId == VRTX_MATERIAL_COPPER_FRESH) {
        return 0.32;
    }

    if (materialId == VRTX_MATERIAL_COPPER_OXIDIZED) {
        return 0.55;
    }

    if (materialId == VRTX_MATERIAL_AMETHYST) {
        return 0.22;
    }

    // Conservative fallback: unknown materials should behave closer to matte.
    return 1.0;
}

#endif
