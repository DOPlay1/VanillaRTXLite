# Level 0 Foundation Plan — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Foundation plan and closure record
- Canonical language: English
- Current state: Ready for Level 0 closure review

---

## 1. Purpose

This document defines and closes the Level 0 foundation phase for Vanilla RTX Lite.

Level 0 exists to prepare the project before shader implementation begins.

The purpose of this phase is to establish:

- Repository structure
- Project identity
- Technical direction
- Documentation standards
- Git workflow
- AI-assisted development rules
- Release strategy
- Risk awareness
- Validation philosophy
- Visual baseline rules

Level 0 does not aim to create the final shader visuals.

It exists to make future shader implementation controlled, traceable, and professional.

---

## 2. Level 0 Definition

Level 0 is the foundation phase.

It answers:

- What is this project?
- What visual philosophy does it follow?
- What is allowed and forbidden?
- What technologies does it target?
- How will materials be handled?
- How will performance be communicated?
- How will releases be prepared?
- How will Codex or AI tools be used safely?
- What risks are already known?
- What must be validated before public release?

The project should not move into complex shader implementation until Level 0 has a coherent baseline.

---

## 3. Level 0 Scope

Level 0 includes:

- Professional repository setup
- Core documentation
- Bilingual documentation structure
- Project rules
- Shader architecture planning
- Material system planning
- Render pipeline planning
- Performance and compatibility policies
- Release process planning
- AI collaboration process
- Visual no-regression rules

Level 0 excludes:

- Full shader implementation
- Final visual effects
- SSR implementation
- Advanced reflections
- Final presets
- Packaging automation
- Public stable release
- Nether support
- End support
- Vulkan production line

---

## 4. Repository Foundation

The repository foundation includes:

```plaintext
.github/
docs/
examples/
shaders/
tools/
README.md
ROADMAP.md
CHANGELOG.md
CONTRIBUTING.md
LICENSE
LICENSE-DOCS
AGENTS.md
.gitattributes
.gitignore
shaders/shaders.properties
```

The repository is designed to support:

- Public GitHub presentation
- Portfolio review
- Shader implementation
- Documentation-driven development
- Future Codex-assisted work
- Future release packaging
- Future validation screenshots
- Future compatibility tracking

---

## 5. Documentation Foundation

Level 0 establishes the main documentation set.

Completed documents:

| Document | Purpose |
| --- | --- |
| `00_project_charter.md` | Defines project identity, scope, and principles |
| `01_vision.md` | Defines visual philosophy and design direction |
| `02_technical_spec.md` | Defines technical architecture and constraints |
| `03_material_matrix.md` | Defines material categories and intended behavior |
| `04_render_pipeline.md` | Defines render stages and data flow |
| `05_validation_scenes.md` | Defines repeatable visual validation scenes |
| `06_performance_targets.md` | Defines performance targets and cost model |
| `07_compatibility.md` | Defines compatibility policy |
| `08_code_conventions.md` | Defines coding conventions and review rules |
| `09_git_workflow.md` | Defines Git workflow and branching process |
| `10_architecture_decisions.md` | Records architecture decisions |
| `11_known_risks.md` | Documents known risks and mitigations |
| `12_release_strategy.md` | Defines versioning and release strategy |
| `13_option_registry.md` | Defines planned user-facing options |
| `14_compatibility_matrix.md` | Tracks real compatibility validation results |
| `15_release_checklist.md` | Defines release verification checklist |
| `16_codex_task_protocol.md` | Defines safe AI-assisted development protocol |
| `17_visual_baseline_manifest.md` | Defines visual baseline and no-regression rules |

Spanish equivalents are maintained under:

```plaintext
docs/es/
```

English remains the canonical documentation language.

Spanish is an official translation.

---

## 6. Master Specification

The project includes a master specification:

```plaintext
docs/en/master_project_specification.md
docs/es/especificacion_maestra_del_proyecto.md
```

The master specification is the high-level source of truth for:

- Project philosophy
- Hard constraints
- Material thinking
- Rendering direction
- Performance honesty
- AI collaboration expectations

Any future work must remain aligned with the master specification.

---

## 7. AI Collaboration Foundation

Level 0 establishes AI collaboration rules through:

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
```

AI tools must not be used as unrestricted project drivers.

They must receive:

- Specific objectives
- Allowed files
- Forbidden files
- Constraints
- Acceptance criteria
- Validation steps
- Expected commit scope

AI-generated changes must be reviewed before commit.

Codex or similar tools must not invent the project direction.

They should implement documented decisions.

---

## 8. Git and Traceability Foundation

Level 0 establishes a traceable Git workflow.

Current branch strategy:

```plaintext
main
dev
```

Primary rules:

- `main` represents stable or release-ready state.
- `dev` is the active integration branch.
- Short-lived branches may be used for larger tasks.
- Commits should follow conventional style.
- Bilingual documentation pairs should be committed together.
- Significant changes should remain small and reviewable.

The repository now includes `.gitattributes` to normalize line endings and reduce cross-platform formatting noise.

---

## 9. Visual Foundation

Level 0 defines the project’s visual identity.

Vanilla RTX Lite must be:

- Vanilla+
- Subtle
- Material-aware
- Playable
- Performance-conscious
- More believable without becoming cinematic-heavy

The visual baseline forbids:

- Global reflections
- Reflective dirt
- Reflective stone
- Glossy wood by default
- Wet leaves by default
- Excessive bloom
- Oversaturation
- Heavy cinematic color grading
- False RTX/path tracing claims

The shader should still look like Minecraft.

---

## 10. Material Foundation

Level 0 defines the initial material philosophy.

The shader must think in materials, not isolated block gimmicks.

Initial material groups include:

- Primary reflective materials
- Secondary specular materials
- Polished/glossy materials
- Crystalline materials
- Matte materials
- Future optional materials

Protected matte materials include:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain
- Most organic surfaces

These materials must not receive reflections by default.

---

## 11. Performance Foundation

Level 0 defines an honest performance model.

The project uses cost tiers:

```plaintext
Very Low
Low
Medium
High
Very High
```

The project must not claim:

- Exact GPU usage
- Exact VRAM usage
- Guaranteed FPS
- Guaranteed integrated graphics performance
- Automatic exact hardware cost detection

Performance communication should be honest, relative, and tied to validated environments.

---

## 12. Compatibility Foundation

Level 0 defines compatibility policy.

Initial target line:

```plaintext
Minecraft Java 26.1.x
Iris 1.10.9+mc26.1
OpenGL / GLSL through Iris
```

Future compatibility with later Minecraft lines must be validated before being claimed.

The Vulkan-oriented line is a future separate track and is not part of v1.0.0.

The compatibility matrix must record tested results only.

Untested combinations must remain marked as `Unknown`.

---

## 13. Release Foundation

Level 0 defines the release strategy.

The project uses:

- Roadmap levels
- Maturity labels
- Versioned releases
- Changelog updates
- Release checklists
- Compatibility notes
- Known limitations
- Clean release packages

Suggested first milestone:

```plaintext
v0.1.0-prealpha — Foundation
```

This milestone represents documentation and repository foundation.

It does not represent a gameplay-ready shader release.

---

## 14. Validation Foundation

Level 0 defines validation scenes.

Validation scenes are required to avoid judging the shader only through random screenshots.

Key scenes include:

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

Future visual work should be validated against these scenes whenever possible.

---

## 15. Risk Foundation

Level 0 documents known risks.

Important risks include:

- Material classification limitations
- SSR artifacts
- Performance cost on lower-end GPUs
- Matte materials accidentally reflecting
- Scope creep before Overworld v1.0.0
- Documentation drift between English and Spanish
- Iris or Minecraft version changes
- Driver-specific GLSL behavior
- AI-generated code violating project rules
- User expectations around “RTX” wording
- Release packaging mistakes

These risks must continue to be reviewed as the project evolves.

---

## 16. Level 0 Completion Checklist

| Item | Status |
| --- | --- |
| Repository structure created | Complete |
| README created | Complete |
| ROADMAP created | Complete |
| CHANGELOG created | Complete |
| Licenses added | Complete |
| `.gitignore` added | Complete |
| `.gitattributes` added | Complete |
| GitHub issue templates added | Complete |
| Pull request template added | Complete |
| AGENTS.md added | Complete |
| Master project specification added | Complete |
| English documentation set 00–17 completed | Complete |
| Spanish documentation set 00–17 completed | Complete |
| Material matrix documented | Complete |
| Render pipeline documented | Complete |
| Performance model documented | Complete |
| Compatibility policy documented | Complete |
| Release strategy documented | Complete |
| Codex protocol documented | Complete |
| Visual baseline documented | Complete |
| Level 0 closure document created | In progress |

---

## 17. Remaining Level 0 Closure Tasks

Before fully closing Level 0, complete:

| Task | Status |
| --- | --- |
| Update this Level 0 foundation plan | In progress |
| Update Spanish Level 0 foundation plan | Pending |
| Review `README.md` for consistency | Pending |
| Review `ROADMAP.md` for Level 0 completion | Pending |
| Update `CHANGELOG.md` with Level 0 foundation work | Pending |
| Confirm `git status` is clean | Pending |
| Merge `dev` into `main` when ready | Pending |
| Optionally create `v0.1.0-prealpha` tag | Pending |

---

## 18. Criteria to Enter Level 1

The project may enter Level 1 when:

- Level 0 documentation is complete.
- README, ROADMAP, and CHANGELOG are consistent.
- The repository structure is stable enough for shader code.
- The Git workflow is working.
- Codex protocol is available.
- Material and visual constraints are documented.
- No unresolved Level 0 repository setup blockers remain.
- `dev` is clean and pushed.

Level 1 should begin with minimal shader loading and baseline visual infrastructure, not advanced effects.

---

## 19. Level 1 Preview

Level 1 — Baseline Visuals should focus on:

- Minimal shader loading
- Basic `shaders/shaders.properties`
- Minimal program files
- Basic final pass
- Initial color pipeline placeholder
- Debug view selector foundation
- Basic constants/includes
- No advanced SSR
- No complex reflection system yet

The goal of Level 1 is to get a safe, minimal, understandable shader foundation running.

---

## 20. What Must Not Happen Immediately After Level 0

After Level 0, the project must not jump directly into:

- Full SSR
- Complex water reflections
- Advanced cinematic atmosphere
- Large shader rewrites
- Unbounded custom options
- Vulkan implementation
- Nether or End support
- Public stable release claims

The correct next step is small, traceable Level 1 implementation.

---

## 21. Portfolio Value of Level 0

Level 0 is valuable because it demonstrates:

- Planning discipline
- Technical documentation
- Bilingual documentation
- Architecture thinking
- Release planning
- Risk management
- Git workflow
- AI collaboration discipline
- Product thinking
- Visual direction
- Performance honesty

This foundation helps show that Vanilla RTX Lite is not a random shader experiment.

It is a structured graphics programming project.

---

## 22. Level 0 Closure Statement

Level 0 may be considered complete when this document and its Spanish equivalent are committed, and README, ROADMAP, and CHANGELOG have been reviewed for consistency.

At that point, the project can move into:

```plaintext
Level 1 — Baseline Visuals
```

Level 1 should begin carefully, with small commits and minimal shader code.

---

## 23. Governance Rule

When closing Level 0, choose:

1. Consistency over speed
2. Traceability over rushing into code
3. Clear documentation over assumptions
4. Small next steps over ambitious jumps
5. Stable foundation over premature features
6. Professional process over improvised progress
