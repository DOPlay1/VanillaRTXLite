# Render Pipeline — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Render pipeline specification
- Canonical language: English
- Target renderer: OpenGL / GLSL through Iris
- Target stable scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the intended render pipeline for Vanilla RTX Lite.

It explains the responsibilities of each shader stage, how rendering data should flow through the project, and which systems belong in each part of the pipeline.

The goal is to keep the shader modular, debuggable, and aligned with the Vanilla+ visual direction.

---

## 2. Pipeline Overview

The intended high-level pipeline is:

```plaintext
Gbuffers → Composite → Final
```

Each stage has a specific responsibility.

The project must avoid mixing unrelated responsibilities across stages.

---

## 3. Core Pipeline Rule

Each render stage should do the minimum amount of work required for its role.

Reusable logic must live in:

```plaintext
shaders/lib/
```

Shared definitions must live in:

```plaintext
shaders/include/
```

Preset tuning must live in:

```plaintext
shaders/profiles/
```

Program files should orchestrate rendering stages, not become large containers of unrelated logic.

---

## 4. Stage 1 — Gbuffers

### Purpose

The gbuffer stage prepares the foundational information needed by later stages.

It should capture, encode, or prepare surface-level data.

### Expected responsibilities

The gbuffer stage may handle:

- Base color preparation
- Normal preparation
- Depth information
- Material category or material mask data where possible
- Basic per-surface information needed by lighting and reflection stages

### Files

Expected program files:

```plaintext
shaders/program/gbuffers_terrain.vsh
shaders/program/gbuffers_terrain.fsh
shaders/program/gbuffers_water.vsh
shaders/program/gbuffers_water.fsh
```

### What belongs here

- Surface identification
- Basic geometry-related outputs
- Material mask preparation
- Data required by composite stage

### What does not belong here

The gbuffer stage should not contain:

- Full color grading
- Final tonemapping
- Heavy atmospheric composition
- Full SSR logic
- Final bloom or final post-processing
- Large material-specific visual hacks

### Design rule

Gbuffers should prepare data, not decide the entire final look.

---

## 5. Stage 2 — Composite

### Purpose

The composite stage integrates the main visual systems.

This is where most mid-pipeline visual logic is combined.

### Expected responsibilities

The composite stage may handle:

- Primary lighting composition
- Specular response
- Reflection selection
- SSR where allowed
- Roughness-aware response
- Fresnel-based modulation
- Fog
- Subtle atmosphere
- Intermediate debug output

### Files

Expected program files:

```plaintext
shaders/program/composite.vsh
shaders/program/composite.fsh
```

### What belongs here

- Applying material-aware lighting response
- Combining reflection contribution
- Applying fog and atmosphere before final grading
- Debugging intermediate rendering systems
- Respecting preset quality levels

### What does not belong here

The composite stage should not contain:

- Final heavy color grading
- Unbounded global effects
- Hardcoded material hacks
- User option definitions
- Large reusable functions that should be in `shaders/lib/`

### Design rule

Composite may integrate visual systems, but reusable logic must remain modular.

---

## 6. Stage 3 — Final

### Purpose

The final stage prepares the final image for output.

It should remain clean, restrained, and minimal.

### Expected responsibilities

The final stage may handle:

- Exposure adjustment
- Neutral tonemapping
- Final color pipeline
- Minimal restrained color grading
- Final debug output selection if needed
- Final output preparation

### Files

Expected program files:

```plaintext
shaders/program/final.fsh
```

A `final.vsh` file may be added if needed by the implementation.

### What belongs here

- Final tonemap
- Final exposure handling
- Final output transforms
- Last consistency adjustments

### What does not belong here

The final stage should not introduce:

- Heavy cinematic grading
- Strong teal/orange bias
- Excessive bloom
- Material classification logic
- Full SSR
- Large lighting systems
- Global visual hacks that override material logic

### Design rule

Final should polish the image, not redefine the shader’s visual identity.

---

## 7. Shared Library Structure

Reusable rendering logic should be placed in `shaders/lib/`.

Planned modules:

```plaintext
materials.glsl
material_mapping.glsl
lighting.glsl
fresnel.glsl
specular.glsl
reflections.glsl
ssr.glsl
fog.glsl
atmosphere.glsl
tonemap.glsl
color_pipeline.glsl
debug_views.glsl
```

### Library principles

Shader libraries should be:

- Focused
- Small when possible
- Reusable
- Documented when behavior is non-obvious
- Safe for future preset tuning

Avoid large utility files that become dumping grounds.

---

## 8. Shared Include Structure

Shared definitions should be placed in `shaders/include/`.

Planned files:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### Include principles

Includes should contain:

- Shared constants
- Common macros
- Shared structs
- Uniform declarations
- Cross-stage definitions

Includes should not contain large rendering systems.

---

## 9. Profile Structure

Preset-specific tuning should be placed in `shaders/profiles/`.

Planned files:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

### Profile principles

Profiles should control:

- Quality levels
- Feature toggles
- Sample counts
- Cost-sensitive parameters
- Preset-specific limits

Profiles should not duplicate entire rendering systems.

---

## 10. Data Flow Philosophy

The pipeline should move from raw scene data toward final presentation.

Suggested conceptual flow:

```plaintext
Surface data
→ Material classification
→ Lighting response
→ Specular / reflection response
→ Atmosphere / fog
→ Exposure / tonemap
→ Final output
```

Each stage should make the next stage easier, not more chaotic.

---

## 11. Material Data Flow

Material data should be prepared as early as practical and consumed consistently.

Expected material flow:

```plaintext
Gbuffers:
  capture or encode material category/mask

Composite:
  use material data for lighting, specular, reflection, roughness and Fresnel decisions

Final:
  avoid changing material identity
```

### Material data rule

Material identity must not be reinterpreted randomly in later stages.

If a surface is matte, later stages must not accidentally treat it as reflective.

---

## 12. Reflection Data Flow

Reflection logic should be selective and late enough to use required screen data.

Expected reflection flow:

```plaintext
Gbuffers:
  provide depth, normals, and material category where possible

Composite:
  decide if reflection is allowed
  apply Fresnel and roughness
  run SSR only when material and preset allow it

Final:
  preserve the reflected result without turning it into global shine
```

### Reflection rule

Reflection must never be applied globally.

---

## 13. Debug View Flow

Debug views must be planned from the start.

Minimum intended debug views:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

### Debug view rule

Any major visual system should eventually expose enough debug information to validate it.

Debug views are part of the engineering process, not optional polish.

---

## 14. Preset Flow

Presets should affect cost and quality without changing the project philosophy.

### Lite

Expected behavior:

- Lower sample counts
- Reduced SSR
- Simpler atmosphere
- Lower cost defaults
- Same Vanilla+ identity

### Balanced

Expected behavior:

- Reference visual target
- Default intended look
- Controlled cost
- Full core identity

### Quality

Expected behavior:

- Higher fidelity
- Smoother effects
- Better reflection quality
- Same visual direction

### Experimental

Expected behavior:

- Unstable features
- Testing-only behavior
- No guarantee of visual stability

### Custom

Expected behavior:

- Bounded user control
- No access to settings that break material identity
- Options documented in the option registry

---

## 15. Cost Flow

The pipeline must avoid expensive work unless it is needed.

Cost-sensitive systems include:

- SSR
- High-quality shadows
- Volumetric or god ray effects
- High-sample blur
- High-resolution intermediate buffers
- Complex per-fragment material logic

### Cost rule

Expensive features should be gated by:

- Preset
- Material mask
- User option
- Visual necessity
- Fallback availability

---

## 16. Fallback Strategy

The shader should degrade gracefully when expensive systems are disabled or reduced.

Examples:

### SSR fallback

If SSR is disabled or fails:

- Use reduced reflection contribution
- Use sky/environment approximation if available
- Fade reflection instead of producing harsh artifacts

### Atmosphere fallback

If atmosphere quality is low:

- Use simpler fog
- Reduce sample count
- Avoid noisy god rays

### Material fallback

If material classification is limited:

- Prefer matte behavior over accidental reflection
- Prefer subtle response over strong incorrect response

---

## 17. Pipeline Boundaries

### Gbuffers should not

- Do final grading
- Run SSR
- Apply full atmosphere
- Override final image identity

### Composite should not

- Contain all reusable logic inline
- Apply uncontrolled global effects
- Ignore material masks
- Break preset constraints

### Final should not

- Add cinematic identity
- Change material behavior
- Add strong global bloom
- Hide earlier pipeline mistakes

---

## 18. Validation Requirements

Pipeline behavior must be validated with scenes that include:

- Water
- Glass
- Ice
- Quartz-like surfaces
- Copper fresh and oxidized
- Amethyst
- Dirt
- Stone
- Wood
- Leaves
- Night torch lighting
- Rain or fog when supported

Each pipeline stage should be debuggable enough to explain visual issues.

---

## 19. Common Failure Modes

The pipeline must be designed to avoid:

- Material identity drift
- Reflective matte surfaces
- Overloaded final pass
- Too much logic in composite
- Presets becoming inconsistent styles
- Expensive features running globally
- Debug views added too late
- Color grading hiding material problems
- Reflection artifacts without fallback

---

## 20. Stage Ownership Summary

| Stage | Owns | Must Avoid |
| --- | --- | --- |
| Gbuffers | Surface data, masks, normals, depth | Final look, SSR, color grading |
| Composite | Lighting, reflections, atmosphere, debug integration | Global hacks, giant inline libraries |
| Final | Exposure, tonemap, restrained final output | Cinematic override, material changes |

---

## 21. Implementation Order

Recommended implementation order for Level 1 and Level 2:

1. Minimal shader loading
2. Basic `shader.properties`
3. Basic final output
4. Initial color pipeline
5. Debug view selector
6. Material mask placeholder
7. Roughness placeholder
8. Fresnel helper
9. Specular helper
10. Reflection gate logic

Advanced SSR should not be implemented before material gating and debug views exist.

---

## 22. Pipeline Governance Rule

When uncertain, choose:

1. Clear stage responsibility over convenience
2. Reusable libraries over duplicated logic
3. Material masks before expensive effects
4. Debug visibility before complex visuals
5. Fallbacks before ambitious features
6. Restrained final output over cinematic overrides
