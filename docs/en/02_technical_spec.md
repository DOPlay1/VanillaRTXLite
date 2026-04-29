# Technical Specification — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Technical specification
- Canonical language: English
- Target renderer: OpenGL / GLSL through Iris
- Target stable scope: Overworld only

---

## 1. Purpose

This document defines the technical direction of Vanilla RTX Lite.

It describes the intended rendering architecture, shader organization, material system, presets, performance model, debug infrastructure, and technical constraints that must guide implementation.

The goal is to make future shader development controlled, modular, traceable, and aligned with the project vision.

---

## 2. Technical Goals

Vanilla RTX Lite must be implemented as a modular Iris/GLSL shader pack.

The technical implementation should support:

- Material-aware rendering
- Selective reflections
- Fresnel-based response
- Roughness-aware highlights
- Controlled lighting
- Neutral color pipeline
- Subtle atmosphere
- Debug views
- Preset-based quality control
- Honest performance cost communication

The project must avoid large, unstructured shader files where unrelated logic is mixed together.

---

## 3. Rendering Backend

### Current backend

The current production line targets:

- Minecraft Java
- Iris shader pipeline
- OpenGL
- GLSL

### Future backend

A future Vulkan-oriented line may exist later.

The Vulkan line should reuse:

- Visual philosophy
- Material concepts
- Validation scenes
- Cost model principles
- Documentation strategy

The Vulkan line should not be assumed to reuse OpenGL shader code directly.

---

## 4. Target Compatibility

### Minecraft

Baseline target:

```plaintext
Minecraft Java 26.1.x
```

Future compatibility:

```plaintext
Best-effort validation for later 2026 release lines such as 26.2+
```

The project must not promise automatic support for future Minecraft versions before validation.

### Iris

Minimum supported baseline:

```plaintext
Iris 1.10.9+mc26.1
```

Recommended version:

```plaintext
Latest stable Iris release validated against the currently supported Minecraft line
```

---

## 5. Repository Shader Architecture

The shader source is organized into four main areas:

```plaintext
shaders/
├── program/
├── lib/
├── include/
└── profiles/
```

### `shaders/program/`

Contains shader entry files used by Iris rendering stages.

Expected files:

```plaintext
gbuffers_terrain.vsh
gbuffers_terrain.fsh
gbuffers_water.vsh
gbuffers_water.fsh
composite.vsh
composite.fsh
final.fsh
```

Program files should remain focused on stage orchestration.

Large reusable logic should not be placed directly in program entry files.

### `shaders/lib/`

Contains reusable rendering logic.

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

### `shaders/include/`

Contains shared definitions.

Planned files:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### `shaders/profiles/`

Contains preset-specific tuning.

Planned files:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

---

## 6. Render Pipeline Overview

The intended render pipeline is:

```plaintext
Gbuffers → Composite → Final
```

### 6.1 Gbuffer Stage

The gbuffer stage should capture or prepare:

- Base color
- Normals
- Depth
- Material category or material mask data where possible
- Information required by later lighting/reflection stages

The gbuffer stage should not become a dumping ground for all visual logic.

### 6.2 Composite Stage

The composite stage should handle:

- Main lighting composition
- Specular response
- Selective reflection logic
- SSR where allowed
- Fog
- Subtle atmosphere
- Debug outputs for intermediate systems

The composite stage is expected to host most of the visual integration logic, but reusable functions must remain in `shaders/lib/`.

### 6.3 Final Stage

The final stage should handle:

- Tonemapping
- Exposure adjustment
- Final color pipeline
- Minimal restrained color grading
- Final output preparation

The final stage must not introduce a heavy cinematic look.

---

## 7. Material System Requirements

The material system is a core feature of the project.

The shader must separate:

- Reflection
- Specular response
- Gloss
- Emissive-like response

### 7.1 Material Categories

Initial categories:

- Primary reflective
- Secondary specular
- Polished / glossy
- Matte
- Emissive-like
- Future optional

### 7.2 Reflective Materials

Approved reflective candidates include:

- Water
- Glass
- Tinted glass
- Glass panes
- Ice
- Polished quartz-like surfaces
- Calcite with extremely subtle response

### 7.3 Secondary Specular Materials

Approved secondary materials include:

- Iron-like surfaces
- Gold-like surfaces
- Copper
- Oxidized copper
- Amethyst

### 7.4 Matte Materials

The following materials must remain non-reflective:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain materials
- Most organic or matte construction blocks

### 7.5 Material Matrix Dependency

Any implementation of material behavior must align with:

```plaintext
docs/en/03_material_matrix.md
docs/en/17_visual_baseline_manifest.md
```

---

## 8. Reflection System Requirements

Reflections must be selective.

They must depend on:

- Material category
- Fresnel factor
- Roughness
- View angle
- Lighting condition
- Preset quality
- Performance setting

### 8.1 Reflection Rules

The reflection system must not:

- Reflect matte terrain
- Apply reflection globally
- Make wood or leaves glossy
- Make dirt or stone look wet by default
- Turn water into a perfect mirror under all conditions

### 8.2 Fresnel Requirement

Reflective materials must use Fresnel-style behavior.

Expected behavior:

- More reflection at grazing angles
- Less reflection at front-facing angles
- Bounded intensity to avoid exaggerated edge glow

### 8.3 Roughness Requirement

Roughness must influence reflection clarity and highlight sharpness.

Expected behavior:

- Low roughness: clearer response
- Medium roughness: softened response
- High roughness: mostly diffuse response

---

## 9. Lighting System Requirements

Lighting must support the Vanilla+ direction.

### 9.1 Global Lighting

Global lighting should be:

- Natural
- Balanced
- Soft
- Readable
- Not aggressively dramatic by default

### 9.2 Torch Lighting

Torch lighting must be:

- Warm
- Fire-like
- Controlled
- Not white by default
- Not overly red
- Adjustable only within safe bounds

### 9.3 Shadows

Shadows should be soft and readable.

The project must avoid shadow settings that make gameplay unnecessarily difficult.

### 9.4 Day/Night Behavior

Day and night should affect visual response naturally.

Daytime may show more reflection detail.

Nighttime should remain restrained unless local light supports visible response.

---

## 10. Color Pipeline Requirements

The color pipeline must preserve Vanilla identity.

It should include:

- Exposure control
- Neutral tonemapping
- Subtle color correction
- Restrained saturation handling

The color pipeline must avoid:

- Heavy cinematic grading
- Strong teal/orange bias
- Oversaturation
- Crushed blacks
- Burned highlights
- Global movie-filter appearance

---

## 11. Atmosphere Requirements

Atmosphere should improve depth without taking over the image.

Planned atmospheric systems:

- Subtle fog
- Sunrise/sunset warmth
- Optional subtle god rays
- Distance depth support
- Rain-aware adjustments in future stages

Atmosphere must not:

- Hide the world
- Oversaturate the sky
- Make caves unreadable
- Turn every scene into a cinematic screenshot

---

## 12. Debug View Requirements

Debug views are required from the first coding phase.

Minimum intended debug views:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Debug views must support validation and issue reporting.

They are not optional polish; they are part of the engineering workflow.

---

## 13. Preset System Requirements

Official presets:

- Lite
- Balanced
- Quality
- Experimental
- Custom

### Lite

Prioritizes lower cost and broader usability.

### Balanced

Represents the intended default look.

### Quality

Increases fidelity without changing the visual philosophy.

### Experimental

Allows controlled testing of unstable or incomplete features.

### Custom

Allows bounded user configuration.

Custom settings must not allow users to break non-negotiable material rules.

---

## 14. Option Registry Requirements

Any user-facing option must be documented in:

```plaintext
docs/en/13_option_registry.md
```

Every important option should define:

- Option ID
- Display name
- Category
- Description
- Allowed values
- Default value
- Affected presets
- GPU cost tier
- Memory cost tier
- Visual impact
- Dependencies
- Constraints

Options must not be added casually.

Each option increases testing, documentation, and support cost.

---

## 15. Cost Model Requirements

The project uses cost tiers, not fake precision.

Allowed cost tiers:

- Very Low
- Low
- Medium
- High
- Very High

The project must not claim:

- Exact GPU usage
- Exact VRAM usage
- Exact performance impact on all hardware

The cost model should communicate relative impact honestly.

---

## 16. Hardware Targets

Reference development hardware:

```plaintext
RTX 3070 Ti
1080p
```

Lite target class:

```plaintext
GTX 1050 Ti / RX 570 class
Reduced settings
Realistic expectations
```

Integrated graphics:

```plaintext
Best effort only for v1.0.0
No formal promise without validation
```

---

## 17. Performance Principles

Implementation should prioritize:

- Avoiding unnecessary fragment-heavy calculations
- Using masks before expensive effects
- Keeping sample counts bounded
- Providing lower-cost fallbacks
- Separating expensive systems by preset
- Documenting cost clearly
- Avoiding global effects that do not need to be global

Performance must be considered during design, not only after implementation.

---

## 18. Validation Requirements

Technical and visual changes should be validated against documented scenes.

Initial validation scenes:

- Midday exterior
- Sunrise
- Sunset
- Night with torches
- River or lake
- Glass interior/exterior transition
- Cave
- Ice or snow environment
- Fresh copper vs oxidized copper
- Rain scene

Visual changes must respect the no-regression checklist.

---

## 19. No-Regression Checklist

Every significant visual change must preserve:

- No reflections on matte materials
- No exaggerated bloom
- No oversaturation
- No cinematic drift
- No loss of Vanilla identity
- No unjustified global effect
- Torch lighting remains believable
- Reflections remain selective and material-based

---

## 20. Packaging Requirements

The shader pack should eventually be distributable as a clean `.zip`.

Future packaging scripts may live in:

```plaintext
tools/packaging/
```

A release package should include only the files required to use the shader and required notices.

Development-only files should not be included in release packages unless intentionally documented.

---

## 21. Built-in Updater Policy

A built-in updater is out of scope for v1.0.0.

Future update helpers may exist as companion tools, but the shader pack itself should not promise update checks or downloads from inside shader settings.

---

## 22. AI-Assisted Development Requirements

AI-assisted work must follow:

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
docs/en/master_project_specification.md
```

AI-generated code must respect:

- Visual philosophy
- Material rules
- Preset boundaries
- Code organization
- Performance principles
- Documentation requirements

---

## 23. Technical Success Criteria

The technical direction succeeds when:

- Shader code remains modular.
- Material logic is centralized and documented.
- Reflections are selective and bounded.
- Debug views support validation.
- Presets are meaningful and not cosmetic labels.
- Cost tiers are documented honestly.
- The pipeline can evolve without becoming chaotic.
- Future contributors and AI tools can understand the project rules.

---

## 24. Technical Governance Rule

When unsure, choose:

1. Modular code over large unstructured files
2. Material logic over global effects
3. Debuggability over hidden behavior
4. Bounded settings over uncontrolled customization
5. Performance-aware design over visual excess
6. Documented constraints over assumptions
