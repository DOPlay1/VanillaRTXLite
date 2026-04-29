# Contributing to Vanilla RTX Lite

Thank you for your interest in contributing to Vanilla RTX Lite.

This project is not only a shader pack. It is a documentation-driven graphics engineering project focused on subtle realism, Vanilla+ consistency, material-aware rendering, and honest performance communication.

Before contributing, please read:

```plaintext
README.md
ROADMAP.md
docs/en/master_project_specification.md
AGENTS.md
```

---

## Project Philosophy

Vanilla RTX Lite must feel like a natural evolution of Minecraft.

Core rule:

> It should still look like Minecraft — just better.

The project prioritizes:

- Vanilla identity
- Subtle realism
- Material-based rendering decisions
- Selective reflections
- Controlled lighting
- Performance-aware implementation
- Honest documentation

---

## What Contributions Are Welcome?

Contributions are welcome in these areas:

- Documentation improvements
- Translation improvements
- Shader architecture
- GLSL cleanup and modularization
- Material matrix refinement
- Debug views
- Validation scenes
- Performance profiling
- Preset tuning
- Bug reports
- Visual regression reports
- Packaging and release tooling

---

## What Contributions Are Not Aligned?

The following changes are not aligned with the project unless explicitly discussed and approved:

- Reflections on matte materials such as dirt, stone, wood, leaves, sand, or gravel
- Excessive bloom
- Oversaturated colors
- Heavy cinematic grading
- White default torch lighting
- Global reflections without material logic
- Motion blur or cinematic depth of field as default features
- Features that make screenshots look impressive but reduce gameplay readability
- Claims of exact GPU or VRAM usage without a reliable measurement method

---

## Branching Model

The project uses these branches:

```plaintext
main
dev
feature/*
docs/*
fix/*
perf/*
chore/*
```

### `main`

Stable or release-ready state.

### `dev`

Active integration branch.

Most work should be based on `dev`.

### `feature/*`

New shader features or systems.

Example:

```plaintext
feature/debug-views
feature/material-core
```

### `docs/*`

Documentation work.

Example:

```plaintext
docs/material-matrix
docs/release-strategy
```

### `fix/*`

Bug fixes.

Example:

```plaintext
fix/torch-overbright
```

### `perf/*`

Performance improvements.

Example:

```plaintext
perf/ssr-sampling
```

---

## Commit Convention

Use conventional-style commits.

Recommended types:

- `docs`
- `feat`
- `fix`
- `refactor`
- `perf`
- `test`
- `chore`

Examples:

```plaintext
docs(readme): add bilingual project introduction
docs(roadmap): define Level 0 through v1.0.0
chore(repo): add conservative gitignore
feat(shader): add material debug view
perf(ssr): reduce sample count for Lite preset
fix(lighting): reduce torch overbright response
```

---

## Pull Request Expectations

A pull request should explain:

- What changed
- Why it changed
- Which files were modified
- Which validation scenes were checked, if applicable
- Whether performance might be affected
- What must not regress

Before submitting a PR, check:

```plaintext
docs/en/master_project_specification.md
docs/en/17_visual_baseline_manifest.md
docs/en/13_option_registry.md
```

when relevant.

---

## Visual No-Regression Checklist

Any visual change must preserve:

- No reflections on matte materials
- No exaggerated bloom
- No oversaturation
- No cinematic drift
- No loss of Vanilla identity
- No unjustified global effect
- Torch lighting remains warm and believable
- Reflections remain selective and material-based

---

## Shader Option Rules

Do not add new user-facing options without documenting them in:

```plaintext
docs/en/13_option_registry.md
```

Every important option should define:

- Description
- Allowed values
- Default value
- Affected presets
- GPU cost tier
- Memory cost tier
- Visual impact
- Constraints

---

## Performance Communication Rules

The project uses cost tiers, not fake precision.

Allowed cost tiers:

- Very Low
- Low
- Medium
- High
- Very High

Do not claim exact GPU usage or exact VRAM consumption from the shader pack.

Performance notes must be useful but honest.

---

## Documentation Language Policy

English is the canonical documentation language.

Spanish is maintained as an official translation.

When changing important project behavior, update English docs first, then update Spanish docs to stay synchronized.

---

## AI-Assisted Development

AI-assisted development is allowed and encouraged when it remains controlled.

Before using Codex or another AI coding assistant, read:

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
```

AI-generated contributions must still respect:

- Project scope
- Material rules
- Visual baseline
- Code conventions
- Performance expectations
- Documentation requirements

---

## Validation Scenes

When relevant, visual changes should be checked against these scenes:

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

---

## Current Project Stage

```plaintext
Roadmap stage: Level 0 — Foundation
Maturity: Pre-alpha
```

At this stage, contributions should focus on:

- Repository foundation
- Documentation
- Workflow
- Planning
- Project structure

Complex shader effects are not the priority yet.

---

## Final Rule

When in doubt, choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Performance over unnecessary complexity
5. Documentation over improvisation
6. Honest limitations over inflated promises
