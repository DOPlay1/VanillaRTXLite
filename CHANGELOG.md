# Changelog — Vanilla RTX Lite

All notable changes to this project will be documented in this file.

This project follows staged roadmap releases and uses maturity labels such as Pre-alpha, Alpha, Beta, Release Candidate, and Stable.

The format is inspired by Keep a Changelog, but adapted to the project’s documentation-driven workflow.

---

## [Unreleased]

### Added

- Recorded first Level 1 shader load test as `COMP-001`.
- Confirmed the baseline shader pack appears in Iris and loads in an Overworld test environment.

### Known limitations

- The first load test was performed on Minecraft 1.21.1, not yet on the target `26.1.x` line.
- Slight brightness increase compared to Vanilla was observed.
- Compatibility remains experimental until more environments are tested.

### Planned

- Begin Level 1 — Baseline Visuals.
- Add minimal shader loading structure.
- Validate initial `shaders/shaders.properties`.
- Add minimal shader program files.
- Add initial shared GLSL includes.
- Add debug view selector foundation.
- Add first real compatibility validation entries when shader loading begins.

---

## [v0.1.0-prealpha] — Foundation

### Maturity

```plaintext
Pre-alpha
```

### Roadmap level

```plaintext
Level 0 — Foundation
```

### Summary

This milestone establishes the professional foundation of Vanilla RTX Lite before shader implementation begins.

It includes the repository structure, bilingual documentation, project rules, visual philosophy, material system planning, render pipeline planning, performance model, compatibility policy, release strategy, Codex protocol, and Level 0 closure plan.

This version is not a gameplay-ready shader release.

It is a documentation and repository foundation milestone.

---

### Added

- Added professional repository structure.
- Added initial `README.md`.
- Added `ROADMAP.md`.
- Added `CHANGELOG.md`.
- Added `CONTRIBUTING.md`.
- Added `AGENTS.md` for AI-assisted development guidance.
- Added MIT license for code and scripts.
- Added documentation/media license file.
- Added `.gitignore`.
- Added `.gitattributes` to normalize line endings across platforms.
- Added GitHub issue templates:
  - Bug report
  - Feature request
  - Visual regression
- Added pull request template.
- Added `shaders/shaders.properties` placeholder.
- Added `examples/` structure for future screenshots, comparisons, and debug views.
- Added `tools/` structure for future packaging and validation utilities.
- Added `shaders/` structure:
  - Runtime entrypoints directly under `shaders/`
  - `shaders/lib/`
  - `shaders/include/`
  - `shaders/profiles/`

---

### Documentation Added

Added English canonical documentation:

```plaintext
docs/en/master_project_specification.md
docs/en/00_project_charter.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/06_performance_targets.md
docs/en/07_compatibility.md
docs/en/08_code_conventions.md
docs/en/09_git_workflow.md
docs/en/10_architecture_decisions.md
docs/en/11_known_risks.md
docs/en/12_release_strategy.md
docs/en/13_option_registry.md
docs/en/14_compatibility_matrix.md
docs/en/15_release_checklist.md
docs/en/16_codex_task_protocol.md
docs/en/17_visual_baseline_manifest.md
docs/en/18_level_0_foundation_plan.md
```

Added Spanish official documentation:

```plaintext
docs/es/especificacion_maestra_del_proyecto.md
docs/es/00_carta_del_proyecto.md
docs/es/01_vision.md
docs/es/02_especificacion_tecnica.md
docs/es/03_matriz_de_materiales.md
docs/es/04_pipeline_de_render.md
docs/es/05_escenas_de_validacion.md
docs/es/06_objetivos_de_rendimiento.md
docs/es/07_compatibilidad.md
docs/es/08_convenciones_de_codigo.md
docs/es/09_flujo_git.md
docs/es/10_decisiones_de_arquitectura.md
docs/es/11_riesgos_conocidos.md
docs/es/12_estrategia_de_releases.md
docs/es/13_registro_de_opciones.md
docs/es/14_matriz_de_compatibilidad.md
docs/es/15_checklist_de_release.md
docs/es/16_protocolo_codex.md
docs/es/17_manifiesto_visual_base.md
docs/es/18_plan_nivel_0_fundacion.md
```

---

### Project Direction

- Defined the project as a Vanilla+ RTX-like Minecraft Java shader.
- Established that the shader is RTX-like, not real RTX.
- Established OpenGL / GLSL through Iris as the initial production line.
- Established a future Vulkan-oriented track as separate and out of scope for `v1.0.0`.
- Defined Overworld as the target scope for the first stable release.
- Deferred Nether and End support to future milestones.

---

### Visual Rules

- Defined the Vanilla+ visual philosophy.
- Defined the visual baseline manifest.
- Defined no-regression visual rules.
- Defined restrained color direction.
- Defined restrained lighting direction.
- Defined torch light as warm but not white or overly red.
- Defined atmosphere as subtle and gameplay-readable.
- Defined bloom as restrained if implemented.
- Defined tonemapping as neutral by default.
- Defined that Minecraft must remain recognizable.

---

### Material System

- Defined material-based rendering as a core project rule.
- Added initial material matrix.
- Defined primary reflective materials.
- Defined secondary specular materials.
- Defined polished/glossy materials.
- Defined crystalline materials.
- Defined protected matte materials.
- Established that matte materials must not reflect by default.
- Protected dirt, stone, sand, gravel, wood, leaves, and rough terrain from accidental reflections.
- Defined water, glass, ice, quartz-like surfaces, copper, and amethyst behavior expectations.

---

### Render Pipeline

- Defined intended render pipeline:

```plaintext
Gbuffers → Composite → Final
```

- Defined responsibilities for gbuffer stage.
- Defined responsibilities for composite stage.
- Defined responsibilities for final stage.
- Defined shared library structure.
- Defined shared include structure.
- Defined profile structure.
- Defined reflection data flow.
- Defined debug view flow.
- Defined fallback strategy.

---

### Performance and Cost Model

- Defined honest performance communication model.
- Added cost tiers:

```plaintext
Very Low
Low
Medium
High
Very High
```

- Established that the project must not claim exact GPU usage.
- Established that the project must not claim exact VRAM usage.
- Established that the project must not guarantee universal FPS.
- Defined RTX 3070 Ti at 1080p as primary development reference.
- Defined GTX 1050 Ti / RX 570 class hardware as Lite target class.
- Marked integrated graphics as best effort for `v1.0.0`.

---

### Compatibility

- Defined compatibility policy.
- Defined compatibility matrix.
- Established Minecraft Java `26.1.x` as baseline target.
- Established Iris `1.10.9+mc26.1` as planned minimum baseline.
- Established OpenGL / GLSL as initial production backend.
- Marked future Minecraft lines as requiring validation.
- Marked untested combinations as `Unknown`.
- Marked Vulkan as unsupported for `v1.0.0`.

---

### Releases

- Defined release strategy.
- Defined release checklist.
- Defined roadmap levels.
- Defined release maturity labels.
- Defined suggested version mapping from `v0.1.0-prealpha` to `v1.0.0`.
- Defined clean release package expectations.
- Defined GitHub release notes expectations.
- Defined changelog expectations.
- Defined tag strategy.
- Defined `v1.0.0` as first stable Overworld-focused release target.

---

### Git Workflow

- Defined `main` as stable or release-ready branch.
- Defined `dev` as active integration branch.
- Defined short-lived branch naming conventions.
- Defined conventional commit style.
- Defined documentation commit strategy.
- Defined shader code commit strategy.
- Added line-ending normalization rules through `.gitattributes`.

---

### AI-Assisted Development

- Added AI collaboration guide through `AGENTS.md`.
- Added Codex task protocol.
- Defined required context files for Codex tasks.
- Defined allowed files and forbidden files discipline.
- Defined acceptance criteria expectations.
- Defined review process for AI-generated code.
- Defined red flags in Codex output.
- Established that Codex must implement documented decisions, not invent project direction.

---

### Risks

- Added known risks register.
- Documented major project risks:
  - Material classification limitations
  - SSR artifacts
  - Performance cost on lower-end GPUs
  - Matte materials accidentally reflecting
  - Scope creep before Overworld `v1.0.0`
  - English/Spanish documentation drift
  - Iris or Minecraft version changes
  - Driver-specific GLSL behavior
  - AI-generated code violating project rules
  - User expectations around “RTX” wording
  - Release packaging mistakes

---

### Validation

- Added validation scenes specification.
- Defined repeatable scenes for:
  - Midday exterior
  - Sunrise
  - Sunset
  - Night with torches
  - River or lake
  - Glass transition
  - Cave
  - Ice or snow environment
  - Fresh copper vs oxidized copper
  - Rain scene
  - Amethyst scene
  - Matte material stress scene

---

### Known Limitations

- No gameplay-ready shader visuals yet.
- No complete shader implementation yet.
- No SSR implementation yet.
- No advanced water reflections yet.
- No final material mapping implementation yet.
- No final preset implementation yet.
- No release packaging automation yet.
- No compatibility validation entries from a working shader yet.
- No public stable release yet.
- No Nether support.
- No End support.
- No Vulkan production line.
- No built-in updater.
- No exact GPU usage reporting.
- No exact VRAM usage reporting.

---

### Compatibility Notes

Current compatibility status is documentation-only.

The target implementation line is:

```plaintext
Minecraft Java 26.1.x
Iris 1.10.9+mc26.1
OpenGL / GLSL through Iris
```

No shader runtime compatibility has been fully validated yet.

Compatibility results must be added later to:

```plaintext
docs/en/14_compatibility_matrix.md
docs/es/14_matriz_de_compatibilidad.md
```

---

### Release Notes

This milestone is suitable for:

- Repository foundation review
- Portfolio documentation review
- Project planning review
- Transition into Level 1 implementation

This milestone is not suitable for:

- Normal gameplay use
- Shader performance benchmarking
- Public stable shader release
- Visual comparison marketing
- Claims of RTX, ray tracing, or path tracing
