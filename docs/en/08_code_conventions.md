# Code Conventions — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Code style and implementation conventions
- Canonical language: English
- Target renderer: OpenGL / GLSL through Iris

---

## 1. Purpose

This document defines the coding conventions for Vanilla RTX Lite.

The goal is to keep shader code readable, modular, maintainable, and aligned with the project’s Vanilla+ philosophy.

These conventions apply to GLSL shader code, shader configuration files, helper scripts, documentation-adjacent code examples, and AI-generated code contributions.

---

## 2. Core Code Philosophy

Shader code should be understandable before it is clever.

The project prioritizes:

- Readability
- Modularity
- Predictable behavior
- Performance awareness
- Debuggability
- Material correctness
- Clear preset boundaries

Avoid clever one-line tricks when a clear helper function would be easier to maintain.

---

## 3. File Organization

Shader code should follow the repository structure:

```plaintext
shaders/
├── final.fsh
├── composite.vsh
├── composite.fsh
├── gbuffers_*.vsh
├── gbuffers_*.fsh
├── lib/
├── include/
└── profiles/
```

### `shaders/`

Contains stage entry files.

Program files should orchestrate rendering stages.

They should not become large containers of unrelated reusable logic.

### `shaders/lib/`

Contains reusable rendering functions.

Examples:

```plaintext
materials.glsl
lighting.glsl
fresnel.glsl
specular.glsl
reflections.glsl
fog.glsl
tonemap.glsl
debug_views.glsl
```

### `shaders/include/`

Contains shared definitions.

Examples:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### `shaders/profiles/`

Contains preset-specific tuning.

Examples:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

---

## 4. Runtime Entrypoint File Rules

Runtime entrypoint files should be short and focused.

They may contain:

- Stage input/output handling
- Calls to reusable functions
- Stage-specific composition
- Debug output routing
- Minimal local logic

They should avoid:

- Large reusable functions
- Hardcoded material hacks
- Uncontrolled feature logic
- Long blocks of duplicated code
- Preset values embedded directly in stage code

If logic is reused or conceptually important, move it to `shaders/lib/`.

---

## 5. Library File Rules

Library files should group related behavior.

Recommended examples:

### `materials.glsl`

Material category definitions and material utility helpers.

### `material_mapping.glsl`

Mapping from available shader/block data to internal material categories.

### `fresnel.glsl`

Fresnel helpers and bounded angle-response functions.

### `specular.glsl`

Specular response helpers.

### `reflections.glsl`

Reflection gating and material-aware reflection composition.

### `ssr.glsl`

Screen-space reflection functions and fallback behavior.

### `color_pipeline.glsl`

Exposure, tonemap, and restrained color correction helpers.

### `debug_views.glsl`

Debug view routing and visualization helpers.

Each library file should have a clear reason to exist.

---

## 6. Include File Rules

Include files should define shared values, not large systems.

They may contain:

- Constants
- Uniform declarations
- Struct definitions
- Macros
- Shared enums or integer IDs

They should avoid:

- Long rendering functions
- Large feature implementations
- Stage-specific behavior
- Preset-specific tuning

---

## 7. Naming Conventions

### Files

Use lowercase snake case:

```plaintext
material_mapping.glsl
color_pipeline.glsl
debug_views.glsl
```

### Functions

Use lower camel case:

```glsl
float computeFresnel(float cosTheta, float strength)
vec3 applyNeutralTonemap(vec3 color)
bool isReflectiveMaterial(int materialId)
```

### Constants

Use uppercase snake case:

```glsl
const float EPSILON = 0.0001;
const int MATERIAL_WATER = 1;
const int DEBUG_REFLECTIVE_MASK = 2;
```

### Local variables

Use lower camel case:

```glsl
vec3 baseColor;
float roughness;
float fresnelFactor;
```

### Material IDs

Use clear names:

```glsl
MATERIAL_WATER
MATERIAL_GLASS
MATERIAL_ICE
MATERIAL_WOOD_MATTE
MATERIAL_STONE_MATTE
```

Avoid vague names like:

```glsl
MAT_1
THING_REFLECT
SURFACE_A
```

---

## 8. Commenting Rules

Comments should explain why, not just what.

Good comment:

```glsl
// Clamp Fresnel contribution to prevent exaggerated edge glow.
fresnel = clamp(fresnel, 0.0, maxFresnel);
```

Weak comment:

```glsl
// Clamp value.
fresnel = clamp(fresnel, 0.0, maxFresnel);
```

Comments are required when:

- Behavior protects a visual rule
- A performance tradeoff is intentional
- A fallback exists to avoid artifacts
- A value is tuned for Vanilla+ restraint
- A workaround exists for pipeline limitations

---

## 9. Material Logic Rules

Material logic must be centralized where possible.

Do not scatter material rules across unrelated files.

A bad pattern:

```glsl
if (blockId == 1) {
    reflection = 0.4;
}
```

A better pattern:

```glsl
MaterialInfo material = getMaterialInfo(materialId);
reflection = computeMaterialReflection(material, viewData);
```

The implementation should make it difficult for matte materials to accidentally receive reflection.

---

## 10. Reflection Logic Rules

Reflection logic must always be gated.

Before applying reflection, check:

- Material category
- Reflective permission
- Roughness
- Fresnel factor
- Preset quality
- Feature availability

Reflection must not be applied globally.

A conceptual pattern:

```glsl
if (material.allowsReflection && profile.enableReflections) {
    reflection = computeReflection(material, viewData);
}
```

Never use reflection as a global full-screen effect without material logic.

---

## 11. Fresnel Rules

Fresnel helpers should be bounded.

Fresnel should:

- Increase response at grazing angles
- Reduce response at front-facing angles
- Avoid exaggerated glowing edges
- Respect material-specific strength
- Respect preset quality if needed

The project should avoid unbounded Fresnel effects that make every surface look glossy.

---

## 12. Roughness Rules

Roughness should influence:

- Reflection clarity
- Specular sharpness
- Blur amount
- Material response intensity

Roughness should help preserve matte material identity.

High roughness should generally reduce or eliminate reflective clarity.

---

## 13. Preset Rules

Preset values should live in `shaders/profiles/`.

Runtime entrypoint and library files should consume preset values, not define them casually.

Presets should control:

- Feature enable/disable state
- Sample counts
- Quality multipliers
- Fallback thresholds
- Cost-sensitive limits

Presets must not change the core visual philosophy.

---

## 14. Debug View Rules

Debug views must be treated as part of the engineering workflow.

Debug view code should be:

- Centralized
- Easy to extend
- Clearly named
- Safe to enable
- Useful for validation scenes

Minimum planned debug views:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Debug view IDs should be named constants.

---

## 15. Performance Rules

Performance must be considered while writing code.

Avoid:

- Expensive effects on all materials
- Unbounded loops
- High sample counts without preset gating
- Repeated calculations that can be shared
- Full-screen work when material-gated work is possible
- Complex branches without purpose

Prefer:

- Material masks before expensive effects
- Early exits where appropriate
- Preset-based quality gates
- Lower-cost fallbacks
- Clear sample count limits
- Reusing computed values when safe

---

## 16. Fallback Rules

Expensive or artifact-prone systems must define fallbacks.

Examples:

### SSR fallback

If SSR fails or is disabled:

- Fade reflection contribution
- Use lower-cost approximation if available
- Avoid harsh artifacts

### Material fallback

If material classification is uncertain:

- Prefer matte behavior
- Prefer subtle response
- Avoid accidental reflection

### Atmosphere fallback

If atmosphere quality is low:

- Use simpler fog
- Reduce samples
- Avoid noisy god rays

---

## 17. Constants and Magic Numbers

Avoid unexplained magic numbers.

Bad:

```glsl
color *= 1.37;
```

Better:

```glsl
const float TORCH_WARMTH_BALANCED = 1.37;
color *= TORCH_WARMTH_BALANCED;
```

Best:

```glsl
// Balanced preset warmth tuned to keep torches warm without becoming red-heavy.
color *= TORCH_WARMTH_BALANCED;
```

Values that affect visual identity should be named and documented.

---

## 18. Function Size

Functions should be focused.

Avoid very large functions that perform unrelated work.

A function should usually do one conceptual task:

- compute Fresnel
- classify material
- apply tonemap
- compute specular
- select debug output
- apply fog

If a function becomes hard to explain in one sentence, consider splitting it.

---

## 19. Branching Rules

Branches are acceptable when they protect performance or correctness.

Valid reasons for branches:

- Material gating
- Preset gating
- Debug output selection
- Feature fallback
- Quality level selection

Avoid branches that create inconsistent visual identity across similar materials.

---

## 20. User Option Rules

Do not add user-facing options casually.

Every user-facing option must be documented in:

```plaintext
docs/en/13_option_registry.md
```

An option should have:

- Clear purpose
- Safe range
- Default value
- Preset interaction
- Cost tier
- Visual impact
- Dependencies
- Constraints

Options should not allow users to break non-negotiable material rules.

---

## 21. AI-Generated Code Rules

AI-generated code must follow the same rules as human-written code.

Before asking Codex or another AI tool to modify code, provide:

- Objective
- Files allowed to modify
- Files forbidden to modify
- Constraints
- Acceptance criteria
- What must not break

AI-generated code should be reviewed for:

- Material rule violations
- Overly broad effects
- Hardcoded hacks
- Performance issues
- Documentation drift
- Preset inconsistencies

---

## 22. Documentation Comments

When a function is important to visual identity, add a short documentation comment.

Example:

```glsl
// Computes bounded Fresnel response for approved reflective materials.
// This function must not be used to enable reflection on matte surfaces.
float computeBoundedFresnel(float cosTheta, float strength, float maxValue) {
    ...
}
```

Important helpers should explain their constraints.

---

## 23. Error Prevention Rules

The codebase should make incorrect behavior harder to introduce.

Prefer patterns that prevent:

- Reflective matte materials
- Global reflections
- Unbounded bloom
- Uncontrolled color grading
- Expensive systems running globally
- Debug views breaking final output
- Presets drifting into different art styles

---

## 24. Commit-Safe Code Rule

A code change should be small enough to review.

Avoid commits that mix:

- Reflection logic
- Tonemapping
- Presets
- Documentation
- Debug views
- Refactors

unless the change is intentionally structured and documented.

Prefer small, traceable commits.

---

## 25. Code Review Checklist

Before accepting code changes, check:

- Does it preserve Vanilla identity?
- Does it respect material rules?
- Does it avoid global effects without gating?
- Does it remain modular?
- Does it include fallback behavior where needed?
- Does it avoid fake performance claims?
- Does it keep debug views possible?
- Does it update documentation if behavior changes?

---

## 26. Code Governance Rule

When uncertain, choose:

1. Readability over cleverness
2. Modularity over convenience
3. Material safety over visual shortcuts
4. Debuggability over hidden behavior
5. Bounded cost over expensive defaults
6. Documentation over assumptions
