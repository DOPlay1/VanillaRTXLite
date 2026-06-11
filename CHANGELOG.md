# Changelog — Vanilla RTX Lite

All notable changes to this project will be documented in this file.

This project follows staged roadmap releases and uses maturity labels such as Pre-alpha, Alpha, Beta, Release Candidate, and Stable.

The format is inspired by Keep a Changelog, but adapted to the project’s documentation-driven workflow.

---

## [Unreleased]

### Added

- Recorded Level 1 baseline shader load tests as `COMP-001`, `COMP-002`, `COMP-003`, `COMP-004`, `COMP-005`, and `COMP-006`.
- Confirmed the baseline shader pack appears in Iris and loads in an Overworld test environment.
- Confirmed baseline shader pack loads on Minecraft 26.1.2 with Iris 1.10.9.
- Added and validated internal baseline debug view modes for final pass marker and UV gradient output.
- Exposed internal Level 1 debug view mode through Iris shader settings.
- Added English and Spanish labels for the baseline debug view option.
- Validated Iris shader settings integration for the baseline debug view option.
- Began Level 2 — Material Core.
- Added material category constants and initial material IDs.
- Added `shaders/lib/materials.glsl` with conservative material category helpers.
- Added base roughness helper for planned material-aware rendering.
- Recorded material core compile validation as `COMP-007`.
- Added internal material category debug view mode as a Level 2 placeholder.
- Recorded material category debug view validation as `COMP-008`.
- Added internal reflective mask debug view mode with a conservative non-reflective fallback.
- Recorded reflective mask debug view validation as `COMP-009`.
- Added internal roughness debug view mode with a fully rough unknown-material fallback.
- Recorded roughness debug view validation as `COMP-010`.
- Added a bounded Schlick-style Fresnel helper without enabling reflection output.
- Recorded bounded Fresnel helper compile validation as `COMP-011`.
- Added material Fresnel strength defaults aligned with the canonical material matrix.

### Fixed

- Added a minimal hand rendering pass to prevent handheld wheat seeds from rendering almost black.
- Added minimal hand lightmap support to improve handheld item lighting after the initial hand rendering pass.
- Aligned material base roughness defaults with the canonical material matrix.

### Known limitations

- The first load test was performed on Minecraft `1.21.1`.
- Slight brightness increase compared to Vanilla was observed in `COMP-001`.
- Handheld item lighting is improved after minimal lightmap support, but it is still not final.
- Full material-aware lighting, shadow interaction, and handheld item refinement are still pending.
- Compatibility remains experimental.
- Additional hand/item lighting, lightmap, and shadow handling are required before Level 1 can be considered visually clean.
- Debug view modes are exposed for validation only and are not intended for normal gameplay.
- Material classification is not connected to real block/material data yet.
- Material-aware rendering is not implemented yet.
- Reflection logic is not implemented yet.
- Material category debug view currently uses placeholder material IDs until real block/material classification is connected.

### Planned

- Begin Level 2 — Material Core.
- Add material constants and category helpers.
- Add conservative material classification placeholders.
- Add material and reflective mask debug views.
- Add bounded Fresnel helper.
- Add roughness placeholder logic.

---

## [v0.2.0-prealpha] — Level 1 Baseline Visuals

### Maturity

```plaintext
Pre-alpha
```

### Roadmap level

```plaintext
Level 1 — Baseline Visuals
```

### Summary

This milestone establishes the first working shader baseline for Vanilla RTX Lite.

It confirms that the shader pack is detected by Iris, loads on the target 26.1.x line, renders through a minimal final pass, supports a minimal hand rendering pass, includes baseline debug view routing, and exposes the debug view option through Iris shader settings.

This version is still not a stable gameplay-ready shader release.

---

### Added

- Added minimal baseline shader structure.
- Added `shaders/shaders.properties`.
- Added `shaders/final.vsh`.
- Added `shaders/final.fsh`.
- Added `shaders/include/constants.glsl`.
- Added `shaders/lib/color_pipeline.glsl`.
- Added `shaders/lib/debug_views.glsl`.
- Added placeholder profile files:
  - `shaders/profiles/lite.glsl`
  - `shaders/profiles/balanced.glsl`
  - `shaders/profiles/quality.glsl`
  - `shaders/profiles/experimental.glsl`
- Added minimal hand rendering pass:
  - `shaders/gbuffers_hand.vsh`
  - `shaders/gbuffers_hand.fsh`
- Added minimal hand lightmap support.
- Added baseline debug modes:
  - Off
  - Final Pass Marker
  - UV Gradient
- Exposed baseline debug view mode through Iris shader settings.
- Added English and Spanish labels for the baseline debug view option.
- Recorded Level 1 compatibility/validation entries:
  - `COMP-001`
  - `COMP-002`
  - `COMP-003`
  - `COMP-004`
  - `COMP-005`
  - `COMP-006`

---

### Fixed

- Corrected runtime shader entrypoint documentation.
- Corrected shader include paths.
- Moved shader pack configuration from root `shader.properties` to `shaders/shaders.properties`.
- Added a minimal hand rendering pass to prevent handheld wheat seeds from rendering almost black.
- Added minimal hand lightmap support to improve handheld item lighting.

---

### Validation

- Confirmed shader pack appears in Iris shader list.
- Confirmed shader pack loads on Minecraft `1.21.1`.
- Confirmed shader pack loads on Minecraft `26.1.2`.
- Confirmed Overworld pipeline creation.
- Confirmed `final.fsh` controls final output.
- Confirmed UV debug routing works.
- Confirmed Iris shader settings integration for baseline debug view option.
- Confirmed handheld wheat seeds no longer render almost black after hand pass/lightmap work.

---

### Known limitations

- Compatibility remains experimental.
- Visual output remains baseline-level.
- Material-aware rendering is not implemented yet.
- Reflections are not implemented yet.
- Atmosphere is not implemented yet.
- Handheld item lighting is improved but not final.
- Full material-aware lighting, shadow interaction, and handheld item refinement are still pending.
- Debug view modes are exposed for validation only and are not intended for normal gameplay.
- No stable release package has been published yet.

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
