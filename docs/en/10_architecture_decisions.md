# Architecture Decisions — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Architecture decision record
- Canonical language: English

---

## 1. Purpose

This document records important architecture decisions for Vanilla RTX Lite.

The goal is to preserve the reasoning behind technical, visual, structural, and workflow decisions.

Architecture decisions should explain not only what was decided, but also why it was decided and what tradeoffs were accepted.

---

## 2. Why Architecture Decisions Matter

Shader projects can become difficult to maintain when decisions are made informally.

Without documented decisions, the project may suffer from:

- Scope drift
- Conflicting visual behavior
- Inconsistent material logic
- Repeated debates
- Unclear technical direction
- AI-generated changes that ignore project constraints
- Features added without understanding consequences

This document exists to make important decisions traceable.

---

## 3. Decision Record Format

Each architecture decision should follow this structure:

```plaintext
ADR-000 — Decision Title

Status:
Date:
Context:
Decision:
Rationale:
Consequences:
Alternatives considered:
Related documents:
```

### Status values

Allowed status values:

| Status | Meaning |
| --- | --- |
| Proposed | Under discussion |
| Accepted | Current active decision |
| Superseded | Replaced by a newer decision |
| Deprecated | Still documented but no longer recommended |
| Rejected | Considered and intentionally not adopted |

---

## 4. Decision Scope

Architecture decisions should be created for changes that affect:

- Shader architecture
- Render pipeline
- Material system
- Reflection strategy
- Preset strategy
- Performance model
- Compatibility policy
- Release strategy
- Documentation structure
- Git workflow
- AI-assisted development workflow
- Packaging strategy
- Future Vulkan direction

Small wording edits or minor typo fixes do not need architecture decisions.

---

# ADR-001 — Documentation-Driven Development

## Status

Accepted

## Context

Vanilla RTX Lite is intended to be a serious portfolio, GitHub, and public shader project.

The project also expects collaboration with AI tools such as Codex.

Without clear documentation, future code generation and feature implementation may drift away from the intended visual philosophy.

## Decision

The project will follow a documentation-driven development approach.

Core project rules must be documented before complex shader implementation begins.

## Rationale

This makes the project easier to:

- Maintain
- Explain
- Review
- Share publicly
- Use with Codex
- Present as portfolio evidence
- Expand without losing direction

## Consequences

Positive consequences:

- Better project clarity
- Better onboarding for future contributors
- Safer AI-assisted development
- Stronger portfolio value
- More traceable decisions

Tradeoffs:

- Slower early progress
- More initial writing before code
- More maintenance required to keep docs synchronized

## Alternatives considered

- Start coding immediately and document later
- Keep documentation only in chat
- Use only a README

These were rejected because they would make the project less traceable and easier to derail.

## Related documents

```plaintext
README.md
AGENTS.md
docs/en/master_project_specification.md
docs/en/00_project_charter.md
docs/en/01_vision.md
```

---

# ADR-002 — English as Canonical Documentation Language

## Status

Accepted

## Context

The project is intended for GitHub, portfolio use, public release, and possible international visibility.

The project owner works in Spanish, but shader development, open-source tooling, and graphics programming documentation often use English.

## Decision

English will be the canonical documentation language.

Spanish will be maintained as an official translation.

## Rationale

English improves:

- Open-source accessibility
- GitHub readability
- Compatibility with Codex and AI tools
- Graphics programming terminology consistency
- Public contributor access

Spanish remains important because:

- It supports the project owner’s workflow
- It helps explain the project in Spanish-speaking contexts
- It supports YouTube content and portfolio explanation in Spanish

## Consequences

Positive consequences:

- Better international presentation
- Stronger compatibility with AI-assisted tools
- Clear source of truth

Tradeoffs:

- More translation work
- Risk of English/Spanish documentation drift
- Need to update English first and Spanish after

## Alternatives considered

- Spanish only
- English only
- Mixed language in the same files

These were rejected because they either reduce international clarity or make documents harder to maintain.

## Related documents

```plaintext
README.md
docs/en/
docs/es/
```

---

# ADR-003 — Overworld-Only Scope for v1.0.0

## Status

Accepted

## Context

Minecraft has multiple dimensions with very different visual needs.

The Overworld, Nether, and End require different lighting, atmosphere, materials, and validation scenes.

Trying to support all dimensions in the first stable release would increase complexity and delay a polished public release.

## Decision

The first stable release, `v1.0.0`, will focus on the Overworld only.

Nether and End support are future milestones.

## Rationale

The Overworld is the most common gameplay environment.

Focusing on the Overworld allows the project to:

- Ship a coherent first stable release
- Validate common materials first
- Avoid scope creep
- Build a stronger foundation
- Deliver something usable before expanding

## Consequences

Positive consequences:

- More realistic roadmap
- Better polish for v1.0.0
- Easier validation
- Clearer scope

Tradeoffs:

- Nether and End users must wait
- Some shader systems may need future adaptation
- Documentation must clearly communicate scope

## Alternatives considered

- Support all dimensions from the start
- Add Nether support before v1.0.0
- Add End support before v1.0.0

These were rejected because they would increase risk and delay the core release.

## Related documents

```plaintext
ROADMAP.md
docs/en/00_project_charter.md
docs/en/05_validation_scenes.md
docs/en/07_compatibility.md
```

---

# ADR-004 — OpenGL / GLSL via Iris as Initial Production Line

## Status

Accepted

## Context

The project targets Minecraft Java shaders using the Iris pipeline.

The user is interested in a future Vulkan-oriented line, but the current Minecraft shader ecosystem still depends heavily on OpenGL/GLSL and Iris.

## Decision

The initial production line will target OpenGL / GLSL through Iris.

A future Vulkan-oriented implementation may be explored separately when the ecosystem is viable.

## Rationale

OpenGL / GLSL through Iris is the practical starting point because:

- It is currently accessible for Minecraft Java shader development
- It aligns with existing shader workflows
- It allows earlier experimentation
- It supports the current mod ecosystem
- It is appropriate for a first public shader project

## Consequences

Positive consequences:

- Practical start
- Existing tooling and knowledge available
- Easier path to early shader loading
- Better compatibility with current mod stacks

Tradeoffs:

- Vulkan work is postponed
- Some future technical designs may need rethinking
- OpenGL limitations must be accepted

## Alternatives considered

- Start directly with Vulkan
- Wait until Vulkan ecosystem matures
- Build both OpenGL and Vulkan from day one

These were rejected because they would slow or complicate the project too early.

## Related documents

```plaintext
docs/en/02_technical_spec.md
docs/en/04_render_pipeline.md
docs/en/07_compatibility.md
```

---

# ADR-005 — Material-Based Rendering as Core Design Rule

## Status

Accepted

## Context

A key risk in shader development is applying effects globally without respecting material identity.

This can make dirt, stone, wood, and leaves look reflective or wet, breaking the Vanilla+ philosophy.

## Decision

Vanilla RTX Lite will use material-based rendering decisions.

Effects such as reflections, specular highlights, roughness response, and Fresnel behavior must be gated by material logic.

## Rationale

Material-based rendering supports:

- More believable visuals
- Better Vanilla consistency
- Selective reflections
- Clear debug views
- Safer implementation
- Better control over visual regressions

## Consequences

Positive consequences:

- Dirt, stone, wood, and leaves remain protected
- Reflections are selective
- Visual identity is easier to maintain
- Debug views become meaningful

Tradeoffs:

- Requires material mapping work
- Requires more planning
- May be limited by available shader pipeline data
- Some material behavior may need approximation

## Alternatives considered

- Apply reflections globally
- Use simple block-specific hacks
- Add effects manually per visual case

These were rejected because they are harder to maintain and more likely to break consistency.

## Related documents

```plaintext
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/17_visual_baseline_manifest.md
```

---

# ADR-006 — Cost Tiers Instead of Exact GPU/VRAM Claims

## Status

Accepted

## Context

The shader pack cannot reliably detect or report exact GPU usage or exact VRAM usage across all systems.

Hardware performance depends on many factors, including GPU, driver, resolution, render distance, mods, operating system, and Iris version.

## Decision

The project will use relative cost tiers and explanatory tooltips instead of exact hardware usage claims.

Allowed cost tiers:

```plaintext
Very Low
Low
Medium
High
Very High
```

## Rationale

Cost tiers are honest and useful without pretending false precision.

They allow the project to communicate relative impact while avoiding misleading claims.

## Consequences

Positive consequences:

- Honest performance communication
- Better user trust
- Easier option documentation
- More realistic release notes

Tradeoffs:

- Less precise than real profiling
- Requires clear wording
- Users may still want exact numbers

## Alternatives considered

- Claim exact VRAM estimates
- Claim exact GPU usage
- Hide performance cost entirely

These were rejected because they are either misleading or unhelpful.

## Related documents

```plaintext
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

# ADR-007 — Debug Views as Required Engineering Infrastructure

## Status

Accepted

## Context

Visual shader bugs can be difficult to diagnose without internal views.

Material classification, reflections, roughness, Fresnel, exposure, and SSR can all fail silently.

## Decision

Debug views are required from the first coding phase.

They are part of the engineering workflow, not optional polish.

## Rationale

Debug views help:

- Validate material classification
- Detect reflection leaks
- Explain visual regressions
- Support issue reports
- Support development videos
- Support AI-assisted debugging

## Consequences

Positive consequences:

- Easier validation
- Better troubleshooting
- Stronger technical credibility
- More reliable development process

Tradeoffs:

- More initial code
- More options to document
- Requires maintenance as systems evolve

## Alternatives considered

- Add debug views later
- Use screenshots only
- Debug manually through code inspection

These were rejected because they make visual debugging slower and less reliable.

## Related documents

```plaintext
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/08_code_conventions.md
```

---

# ADR-008 — Lite, Balanced, Quality, Experimental, and Custom Presets

## Status

Accepted

## Context

The project needs to support multiple user needs without fragmenting the visual identity.

The user wants configurable quality levels and a custom mode, but the shader must remain bounded and honest.

## Decision

The project will use five official presets:

```plaintext
Lite
Balanced
Quality
Experimental
Custom
```

## Rationale

These presets create a clear structure:

- Lite supports lower-end dedicated GPUs.
- Balanced defines the intended default look.
- Quality improves fidelity without changing art direction.
- Experimental isolates unstable features.
- Custom allows bounded user control.

## Consequences

Positive consequences:

- Clear user-facing options
- Better cost communication
- Easier release notes
- Safer experimentation
- Stronger product identity

Tradeoffs:

- More testing required
- More documentation required
- Custom settings must be carefully bounded

## Alternatives considered

- Only three presets
- No custom mode
- Many micro-presets
- Fully unrestricted settings

These were rejected because they either reduce flexibility or make the project harder to maintain.

## Related documents

```plaintext
README.md
ROADMAP.md
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

# ADR-009 — No Built-In Updater for v1.0.0

## Status

Accepted

## Context

The user considered whether the shader could update itself or check for new versions.

Inside a shader pack, reliable update checking and downloading are outside the realistic scope for v1.0.0.

## Decision

A built-in updater is out of scope for v1.0.0.

Future update helpers may exist as companion tools, but not as a required shader-pack feature.

## Rationale

This keeps v1.0.0 focused on the shader itself.

A built-in updater would introduce:

- Additional complexity
- Platform concerns
- Distribution concerns
- Security concerns
- Maintenance burden
- Unclear feasibility inside shader settings

## Consequences

Positive consequences:

- Cleaner scope
- Less technical risk
- More focus on rendering quality
- Simpler release process

Tradeoffs:

- Users must download updates manually
- Future update discovery may require documentation or external pages

## Alternatives considered

- Built-in download button
- In-shader update checker
- Automatic update system

These were rejected for v1.0.0 as unrealistic or out of scope.

## Related documents

```plaintext
docs/en/02_technical_spec.md
docs/en/07_compatibility.md
docs/en/12_release_strategy.md
```

---

# ADR-010 — Validation Scenes Before Visual Claims

## Status

Accepted

## Context

The project aims to avoid judging quality only through random screenshots.

Because the shader relies on subtle realism and material correctness, repeatable validation scenes are required.

## Decision

Major visual claims and public release notes should be supported by validation scenes whenever possible.

## Rationale

Validation scenes help prevent:

- Overfitting to one screenshot
- Ignoring gameplay readability
- Missing material regressions
- Publishing unsupported performance claims
- Hiding edge cases

## Consequences

Positive consequences:

- More reliable visual direction
- Better release discipline
- Stronger public credibility
- Better issue reporting

Tradeoffs:

- More setup work
- More screenshots and notes to maintain
- Requires consistent validation habits

## Alternatives considered

- Validate only by subjective impression
- Use random worlds only
- Delay validation until beta

These were rejected because they reduce reliability.

## Related documents

```plaintext
docs/en/05_validation_scenes.md
examples/
```

---

## 5. Updating This Document

When a new architecture decision is needed:

1. Add a new ADR section.
2. Use the next available number.
3. Set the status.
4. Explain context and rationale.
5. Document consequences.
6. Link related documents.
7. Update translations when applicable.

---

## 6. Architecture Governance Rule

When uncertain, choose:

1. Documented decisions over informal memory
2. Accepted tradeoffs over hidden assumptions
3. Traceability over speed
4. Stable architecture over impulsive features
5. Clear constraints over vague flexibility
6. Future maintainability over short-term convenience
