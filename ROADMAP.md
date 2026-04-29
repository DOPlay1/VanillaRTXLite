# Roadmap — Vanilla RTX Lite

Vanilla RTX Lite uses two progress systems:

1. **Roadmap levels** for internal engineering progress.
2. **Release maturity labels** for public stability.

This keeps technical planning separate from user-facing release expectations.

---

## Current Status

- **Roadmap stage:** Level 0 — Foundation
- **Maturity:** Pre-alpha
- **Current milestone:** v0.1.0-prealpha — Foundation
- **v1.0.0 target scope:** Overworld only
- **Rendering backend:** OpenGL / GLSL through Iris

---

## Version and Maturity Strategy

### Roadmap Levels

Roadmap levels describe what part of the project is being built.

They answer:

- What are we working on?
- What depends on what?
- What should not be implemented yet?
- What needs to be validated before moving forward?

### Maturity Labels

Maturity labels describe how stable or usable the project is for users.

They answer:

- Is this safe for public users?
- Is this only experimental?
- Is this feature-complete?
- Is this stable?

---

## Suggested Version Mapping

| Version | Roadmap Level | Maturity | Main Goal |
| --- | --- | --- | --- |
| v0.1.0-prealpha | Level 0 — Foundation | Pre-alpha | Repository, documentation, workflow |
| v0.2.0-prealpha | Level 1 — Baseline Visuals | Pre-alpha | Minimal shader pipeline and debug views |
| v0.3.0-prealpha | Level 2 — Material Core | Pre-alpha | Material classification, roughness, Fresnel |
| v0.4.0-alpha | Level 3 — Selective Reflections | Alpha | Water, glass, ice, selective SSR |
| v0.5.0-alpha | Level 4 — Atmosphere | Alpha | Fog, torch lighting, subtle atmosphere |
| v0.8.0-beta | Level 5 — Optimization and Release Prep | Beta | Presets, benchmarks, packaging |
| v1.0.0 | Stable Overworld Release | Stable | Public Overworld-focused release |

---

# Level 0 — Foundation

## Maturity

Pre-alpha

## Goal

Create the professional foundation of the project before implementing complex shader features.

This level exists to make sure the repository is understandable, maintainable, and ready for serious development.

## Deliverables

- Repository structure
- README
- ROADMAP
- CHANGELOG
- CONTRIBUTING
- AGENTS guide for AI-assisted work
- Licenses
- GitHub issue templates
- Pull request template
- Documentation skeleton
- Master project specification
- Level 0 foundation plan

## Required Documentation

- `docs/en/master_project_specification.md`
- `docs/en/00_project_charter.md`
- `docs/en/01_vision.md`
- `docs/en/02_technical_spec.md`
- `docs/en/03_material_matrix.md`
- `docs/en/04_render_pipeline.md`
- `docs/en/05_validation_scenes.md`
- `docs/en/06_performance_targets.md`
- `docs/en/07_compatibility.md`
- `docs/en/08_code_conventions.md`
- `docs/en/09_git_workflow.md`
- `docs/en/10_architecture_decisions.md`
- `docs/en/11_known_risks.md`
- `docs/en/12_release_strategy.md`
- `docs/en/13_option_registry.md`
- `docs/en/14_compatibility_matrix.md`
- `docs/en/15_release_checklist.md`
- `docs/en/16_codex_task_protocol.md`
- `docs/en/17_visual_baseline_manifest.md`
- `docs/en/18_level_0_foundation_plan.md`

Spanish translations will be maintained under `docs/es/`.

## Exit Criteria

Level 0 is complete when:

- The repository structure exists.
- The main documentation files exist.
- The README explains the project clearly.
- The scope of v1.0.0 is defined.
- The shader philosophy is documented.
- The Git workflow is documented.
- The release strategy is documented.
- Codex/AI collaboration rules are documented.
- The first pre-alpha foundation commit is created.

## Not Required Yet

Level 0 does not require:

- Complex shader code
- SSR
- God rays
- Advanced fog
- Material implementation
- Public user-facing builds
- Performance claims based on real measurements

---

# Level 1 — Baseline Visuals

## Maturity

Pre-alpha

## Goal

Create the first functional shader baseline.

This level focuses on proving that the shader can load, render, and expose debug infrastructure before advanced visual effects are introduced.

## Planned Work

- Minimal shader program files
- Basic `shader.properties`
- Baseline color output
- Initial exposure control
- Neutral tonemap foundation
- Initial debug view switch
- Basic settings structure

## Required Debug Views

Initial debug view system should prepare for:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Not all debug views need full data at this stage, but the architecture must allow them.

## Exit Criteria

Level 1 is complete when:

- The shader loads in Iris.
- The project has a minimal stable visual output.
- Basic debug view infrastructure exists.
- The color pipeline has a restrained baseline.
- No advanced reflection feature is required yet.

---

# Level 2 — Material Core

## Maturity

Pre-alpha

## Goal

Build the foundation of material-aware rendering.

This level establishes how the shader decides what kind of physical response a surface should have.

## Planned Work

- Initial material classification
- Material matrix implementation plan
- Roughness model
- Fresnel utility
- Base specular response
- Reflective mask debug view
- Protection for matte materials

## Exit Criteria

Level 2 is complete when:

- Matte materials remain non-reflective.
- Reflective candidates are classified separately.
- Fresnel and roughness are implemented as reusable helpers.
- Material debug views are functional.
- The material matrix matches the documented philosophy.

---

# Level 3 — Selective Reflections

## Maturity

Alpha

## Goal

Implement selective reflection behavior for approved materials.

This level introduces reflection features while preserving the non-negotiable rule that matte materials must not reflect.

## Planned Work

- Water reflection behavior
- Glass reflection behavior
- Ice response
- Quartz/polished response
- Initial SSR logic
- SSR fallback policy
- Reflection strength controls
- Reflection debug view

## Exit Criteria

Level 3 is complete when:

- Water, glass, and ice show controlled reflective behavior.
- Matte terrain does not reflect.
- SSR artifacts are documented.
- Reflection behavior is bounded by Fresnel and roughness.
- Validation scenes for water and glass pass initial review.

---

# Level 4 — Atmosphere

## Maturity

Alpha

## Goal

Add restrained atmospheric improvements without turning the shader into a cinematic showcase.

## Planned Work

- Subtle fog
- Torch lighting refinement
- Sunrise/sunset tone refinement
- Optional subtle god rays
- Atmosphere settings
- Cost tier documentation for atmospheric effects

## Exit Criteria

Level 4 is complete when:

- Fog improves depth without hiding the world.
- Torch lighting remains warm but not red-heavy or white.
- God rays, if enabled, remain subtle.
- Atmosphere does not damage vanilla readability.
- Validation scenes for caves, night, sunset, and rain pass review.

---

# Level 5 — Optimization and Release Prep

## Maturity

Beta

## Goal

Prepare the project for a serious public release.

## Planned Work

- Preset tuning
- Lite/Balanced/Quality validation
- Experimental isolation
- Cost tier review
- Performance notes
- Compatibility matrix updates
- Packaging scripts
- Release checklist
- Screenshots and comparisons
- Known issues documentation

## Exit Criteria

Level 5 is complete when:

- Presets are usable and documented.
- The shader can be packaged cleanly.
- Known issues are documented.
- Validation scenes have been reviewed.
- Performance expectations are honest.
- The project is ready for a release candidate.

---

# v1.0.0 — Stable Overworld Release

## Maturity

Stable

## Scope

The first stable release focuses on the Overworld only.

## Required State

- Overworld visual experience is coherent.
- Material behavior is stable.
- Presets are documented.
- Performance cost is communicated honestly.
- Documentation is complete enough for users and contributors.
- Known limitations are documented.
- Release package is tested.
- GitHub release notes are published.

## Out of Scope

- Full Nether support
- Full End support
- Built-in updater
- Exact hardware telemetry
- Path tracing
- Real ray tracing

---

# Future Milestones

These milestones are intentionally outside v1.0.0.

## Nether Support

Possible future focus:

- Lava lighting
- Nether fog
- Emissive material behavior
- Basalt/blackstone treatment
- Nether atmosphere

## End Support

Possible future focus:

- End sky atmosphere
- End stone response
- Void depth treatment
- End crystal behavior

## Companion Tooling

Possible future tools:

- Update checker
- Hardware recommendation assistant
- Packaging helper
- Compatibility reporter

## Vulkan-Oriented Line

Possible future direction:

- Reuse visual philosophy
- Reuse material logic concepts
- Reuse validation scenes
- Rebuild technical implementation for Vulkan when ecosystem support is viable

---

# Roadmap Rule

When in doubt, the project must choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Performance over unnecessary complexity
5. Documentation over improvisation
6. Honest limitations over inflated promises
