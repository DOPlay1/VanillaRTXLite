# AGENTS.md — AI Collaboration Guide

This file provides instructions for AI agents working on the Vanilla RTX Lite repository.

Vanilla RTX Lite is a documentation-driven Minecraft Java shader project using Iris/GLSL. The project follows a strict Vanilla+ philosophy: subtle realism, material-based rendering decisions, restrained effects, and honest performance communication.

---

## Required Reading Before Making Changes

Before modifying shader code, presets, options, documentation, or repository structure, read the following files:

```plaintext
docs/en/master_project_specification.md
README.md
ROADMAP.md
```

Before modifying material behavior, reflections, roughness, Fresnel, specular response, or any visual material logic, also read:

```plaintext
docs/en/03_material_matrix.md
docs/en/17_visual_baseline_manifest.md
```

Before modifying shader options, presets, user-facing settings, cost tiers, or `shader.properties`, also read:

```plaintext
docs/en/13_option_registry.md
docs/en/06_performance_targets.md
```

Before modifying coding style, shader structure, or GLSL organization, also read:

```plaintext
docs/en/08_code_conventions.md
docs/en/04_render_pipeline.md
```

Before creating or changing tasks intended for AI-assisted work, also read:

```plaintext
docs/en/16_codex_task_protocol.md
```

---

## Project Philosophy

The shader must feel like a natural evolution of Minecraft, not a cinematic reinterpretation.

Core rule:

> It should still look like Minecraft — just better.

The project prioritizes:

- Vanilla identity
- Material-based rendering logic
- Selective reflections
- Subtle lighting
- Controlled atmosphere
- Performance-aware implementation
- Honest documentation
- Maintainable GLSL structure

---

## Non-Negotiable Visual Rules

Do not introduce reflective behavior on matte materials such as:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain materials
- Most organic or matte construction blocks

Do not introduce:

- Excessive bloom
- Extreme saturation
- Heavy cinematic grading
- White default torch lighting
- Mirror-like terrain
- Global reflections without material logic
- Visual effects that exist only for screenshots but hurt gameplay consistency

---

## Material Logic Rules

Always separate these concepts:

- Reflection
- Specular
- Gloss
- Emissive response

Reflection is only allowed on approved materials.

Specular response may exist on some materials without turning them into reflective surfaces.

Gloss is not the same as mirror reflection.

Every material change must respect the material matrix and the visual baseline.

---

## Preset and Option Rules

The official presets are:

- Lite
- Balanced
- Quality
- Experimental
- Custom

Balanced represents the intended default look of the project.

Lite prioritizes lower cost and broader usability.

Quality may increase fidelity but must not change the artistic direction.

Experimental is not considered stable.

Custom may expose user control, but settings must remain bounded so the user cannot break the project philosophy.

Do not add new user-facing options without documenting them in:

```plaintext
docs/en/13_option_registry.md
```

Every important option must define:

- Description
- Allowed values
- Default value
- Affected presets
- GPU cost tier
- Memory cost tier
- Visual impact
- Constraints

---

## Cost Model Rules

The project uses cost tiers and tooltips.

Do not claim exact GPU usage.

Do not claim exact VRAM usage.

Do not present estimates as precise measurements.

Allowed cost labels:

- Very Low
- Low
- Medium
- High
- Very High

Performance communication must be useful but honest.

---

## Code Organization Rules

Shader code should remain modular.

Use:

```plaintext
shaders/program/
shaders/lib/
shaders/include/
shaders/profiles/
```

Avoid putting large amounts of reusable logic directly inside program entry files.

Prefer clear, small, reusable GLSL helpers.

Avoid unnecessary calculations in fragment-heavy paths.

Prefer guarded feature logic where possible.

---

## Debug and Validation Rules

Debug views are required for serious visual work.

Important debug views include:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Before changing visual behavior, consider which validation scene should be used.

Validation scenes include:

- Midday exterior
- Sunrise
- Sunset
- Night with torches
- River or lake
- Glass scene
- Cave
- Ice or snow
- Fresh copper vs oxidized copper
- Rain

---

## Codex Task Format

When creating a task for Codex or another AI coding agent, use this format:

```markdown
# Codex Task

## Objective

## Files allowed to modify

## Files forbidden to modify

## Constraints

## Acceptance criteria

## Validation scenes

## Performance expectations

## What must not break

## Notes
```

Tasks must be specific, bounded, and aligned with the Master Project Specification.

---

## Git Rules

Use conventional-style commits.

Recommended commit types:

- docs
- feat
- fix
- refactor
- perf
- test
- chore

Examples:

```plaintext
docs(readme): add bilingual project introduction
docs(roadmap): define Level 0 through v1.0.0
feat(shader): add material debug view
perf(ssr): reduce sample count for Lite preset
```

Do not commit generated release archives, local Minecraft folders, screenshots not curated for the project, or personal IDE settings.

---

## Release and Scope Rules

Current stage:

```plaintext
Level 0 — Foundation
Pre-alpha
```

The first stable release targets:

```plaintext
v1.0.0 — Stable Overworld Release
```

Nether and End support are future milestones.

Do not add Nether or End-specific systems to v1.0.0 scope unless the roadmap is explicitly updated.

---

## Built-in Updater Policy

Do not implement or promise a built-in updater inside the shader pack for v1.0.0.

Future update helpers may exist as companion tooling, but not as a shader-pack requirement.

---

## Final Decision Rule

When uncertain, choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Performance over unnecessary complexity
5. Documentation over improvisation
6. Honest limitations over inflated promises
