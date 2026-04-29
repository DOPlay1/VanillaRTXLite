# Level 0 Foundation Plan

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Milestone: v0.1.0-prealpha — Foundation

---

## Purpose

Level 0 exists to create the professional foundation of Vanilla RTX Lite before implementing complex shader features.

This stage focuses on project structure, documentation, workflow, licensing, release planning, and AI-assisted collaboration rules.

The goal is to make the project understandable, maintainable, and ready for serious development.

---

## Why Level 0 Exists

Shader projects can become chaotic quickly if visual experimentation starts before the architecture and rules are clear.

Level 0 prevents that by defining:

- Project identity
- Scope
- Repository structure
- Documentation strategy
- Git workflow
- Release strategy
- Visual philosophy
- Material rules
- Cost communication model
- Codex and AI collaboration protocol

This makes later shader implementation more controlled and traceable.

---

## Current Scope

Level 0 does not aim to create advanced visual effects.

It prepares the project so future stages can implement them correctly.

---

## Deliverables

Level 0 must produce:

- Repository skeleton
- README
- ROADMAP
- CHANGELOG
- CONTRIBUTING guide
- AGENTS guide
- MIT license for code and scripts
- CC BY 4.0 license for documentation and curated media
- GitHub issue templates
- Pull request template
- Master Project Specification
- Documentation skeleton under `docs/en/` and `docs/es/`
- Initial `.gitignore`
- Initial project workflow

---

## Repository Structure

The intended structure is:

```plaintext
VanillaRTXLite/
├── shaders/
│   ├── program/
│   ├── lib/
│   ├── include/
│   └── profiles/
├── docs/
│   ├── en/
│   └── es/
├── examples/
├── tools/
├── .github/
├── shader.properties
├── README.md
├── ROADMAP.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── AGENTS.md
├── LICENSE
├── LICENSE-DOCS
└── .gitignore
```

---

## Required Root Files

### `README.md`

Introduces the project to users, contributors, and portfolio reviewers.

### `ROADMAP.md`

Defines roadmap levels, maturity labels, planned milestones, and v1.0.0 scope.

### `CHANGELOG.md`

Tracks notable changes over time.

### `CONTRIBUTING.md`

Explains how to contribute without breaking the project philosophy.

### `AGENTS.md`

Provides instructions for Codex and other AI-assisted development workflows.

### `LICENSE`

MIT license for shader code and scripts.

### `LICENSE-DOCS`

Creative Commons Attribution 4.0 International license for documentation and curated media.

### `.gitignore`

Prevents local, temporary, generated, and environment-specific files from entering the repository.

---

## Required Documentation Skeleton

English canonical documentation:

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

Spanish official translation:

```plaintext
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

## What Level 0 Must Not Include

Level 0 must not focus on:

- Complex shader effects
- Screen Space Reflections
- God rays
- Advanced atmosphere
- Material implementation
- Performance claims based on measurements that do not exist yet
- Public user-facing shader builds
- Nether-specific systems
- End-specific systems

---

## Exit Criteria

Level 0 is complete when:

- The repository structure exists.
- Root project files are filled.
- Licenses are defined.
- GitHub templates exist.
- Master Project Specification exists.
- The documentation skeleton exists.
- The roadmap defines levels and maturity states.
- The first foundation commit exists.
- The project is ready to move into Level 1 — Baseline Visuals.

---

## First Commit Recommendation

Recommended commit message:

```plaintext
docs(project): initialize Level 0 foundation
```

This commit should include the repository foundation, not advanced shader code.

---

## Next Stage

After Level 0 is complete, the project moves to:

```plaintext
Level 1 — Baseline Visuals
Maturity: Pre-alpha
Suggested version: v0.2.0-prealpha
```

Level 1 will focus on:

- Minimal shader pipeline
- Basic shader loading
- Initial `shader.properties`
- Baseline output
- Neutral tonemap foundation
- Debug view infrastructure

---

## Level 0 Rule

When uncertain during Level 0, prioritize:

1. Documentation over improvisation
2. Structure over speed
3. Traceability over shortcuts
4. Honest limitations over inflated promises
5. Stable foundations over premature visual effects
