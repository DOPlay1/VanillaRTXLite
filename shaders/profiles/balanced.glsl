#ifndef VRTX_PROFILE_BALANCED_GLSL
#define VRTX_PROFILE_BALANCED_GLSL

#define VRTX_PROFILE_NAME_BALANCED 1

// Restrained non-SSR fallback used by the initial Level 3 reflection path.
const float VRTX_ENVIRONMENT_REFLECTION_SCALE = 0.35;
const float VRTX_ENVIRONMENT_REFLECTION_SATURATION = 0.70;

// Validation-only SSR trace budget. SSR is not composed into gameplay yet.
const int VRTX_SSR_DEBUG_STEP_COUNT = 12;
const float VRTX_SSR_DEBUG_START_DISTANCE = 0.20;
const float VRTX_SSR_DEBUG_BASE_STEP = 0.25;
const float VRTX_SSR_DEBUG_STEP_GROWTH = 0.10;
const float VRTX_SSR_DEBUG_THICKNESS = 0.30;

#endif
