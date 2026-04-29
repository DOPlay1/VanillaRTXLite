# Project Charter — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Milestone: v0.1.0-prealpha — Foundation
- Target stable scope: v1.0.0 — Overworld only

---

## 1. Project Purpose

Vanilla RTX Lite exists to create a Minecraft Java shader that improves visual realism while preserving the original Vanilla identity of the game.

The project aims to deliver a restrained RTX-like experience through material-aware rendering, selective reflections, controlled lighting, subtle atmosphere, and honest performance communication.

This is not a cinematic shader project. It is a Vanilla+ graphics engineering project.

---

## 2. Core Vision

The shader should feel like a natural evolution of Minecraft.

Core motto:

> It should still look like Minecraft — just better.

The visual direction must remain:

- Subtle
- Clean
- Readable
- Material-aware
- Performance-conscious
- Consistent with Minecraft’s original style

---

## 3. Problem Statement

Many Minecraft shader packs improve visuals by applying strong global effects such as heavy bloom, oversaturation, cinematic grading, excessive reflections, and dramatic atmosphere.

While these effects can look impressive in screenshots, they often reduce gameplay readability and may make different materials behave inconsistently.

Vanilla RTX Lite addresses this by prioritizing:

- Material-specific rendering logic
- Selective reflections
- Controlled lighting
- Neutral color handling
- Documented performance tradeoffs
- Clear visual constraints

---

## 4. Target Audience

Primary users:

- Minecraft Java players who want a refined Vanilla+ visual experience
- Players who dislike exaggerated shader aesthetics
- Users with mid-range and high-end dedicated GPUs
- Users who want configurable visuals without losing consistency

Secondary audiences:

- Graphics programming learners
- Portfolio reviewers
- GitHub visitors
- YouTube viewers following the development process
- Future contributors
- AI-assisted development workflows such as Codex

---

## 5. Scope for v1.0.0

The first stable release targets the Overworld only.

This scope is intentional. The Overworld is the most common gameplay environment and must reach a polished, coherent, and enjoyable state before expanding into other dimensions.

### In scope

- Overworld lighting
- Controlled exposure
- Neutral tonemapping
- Subtle color pipeline
- Material classification
- Selective reflections
- Fresnel-based reflection response
- Roughness-aware material behavior
- Water reflection behavior
- Glass reflection behavior
- Ice material response
- Quartz-like polished response
- Copper and metal-like specular response
- Amethyst subtle crystalline response
- Warm torch lighting
- Subtle fog
- Subtle atmosphere
- Debug views
- Presets: Lite, Balanced, Quality, Experimental, Custom
- Cost tiers and tooltips
- GitHub releases
- English and Spanish documentation

---

## 6. Out of Scope for v1.0.0

The following are not part of the first stable release:

- Full Nether support
- Full End support
- Path tracing
- Real ray tracing
- Heavy cinematic post-processing
- Motion blur
- Heavy depth of field
- Chromatic aberration
- Lens dirt
- Strong vignette
- Global reflections on matte materials
- Built-in shader updater
- Exact GPU usage reporting
- Exact VRAM usage reporting
- Universal integrated graphics support

These may be considered future work only if they remain aligned with the project philosophy.

---

## 7. Non-Negotiable Constraints

The project must not introduce reflective behavior on matte materials such as:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain materials
- Most organic or matte construction blocks

The project must not rely on:

- Excessive bloom
- Extreme saturation
- Heavy cinematic grading
- White default torch lighting
- Mirror-like terrain
- Global effects without material logic

---

## 8. Success Criteria

The project is successful when:

- It still feels like Minecraft.
- Visual improvements are noticeable but restrained.
- Materials behave coherently.
- Matte materials do not reflect.
- Lighting feels natural and readable.
- Presets are useful and documented.
- Performance communication is honest.
- Documentation is clear enough for users and contributors.
- Releases are reproducible.
- The project can be shown on GitHub, YouTube, and a professional portfolio.

---

## 9. Level 0 Objectives

Level 0 exists to establish the professional foundation of the project before complex shader implementation begins.

### Level 0 must deliver

- Repository structure
- README
- ROADMAP
- CHANGELOG
- CONTRIBUTING guide
- AGENTS guide
- Licenses
- GitHub issue templates
- Pull request template
- Master Project Specification
- Documentation skeleton
- Level 0 foundation plan
- Initial Git workflow

### Level 0 must not prioritize

- SSR implementation
- God rays
- Advanced fog
- Complex atmosphere
- Material system implementation
- Performance claims without measurements
- Public user-facing shader builds

---

## 10. Project Stakeholders

### Project owner

The project owner is responsible for:

- Creative direction
- Technical direction
- Scope control
- Release decisions
- Documentation quality
- Public presentation

### Contributors

Contributors may support:

- Documentation
- Shader code
- Testing
- Validation scenes
- Translations
- Performance profiling
- Issue reporting

### AI-assisted tools

AI tools such as Codex may assist with:

- Code generation
- Refactoring
- Documentation
- Repetitive structure work
- Issue or task drafting

AI-generated work must follow `AGENTS.md` and the Master Project Specification.

---

## 11. Hardware and Performance Positioning

### Reference development hardware

- RTX 3070 Ti
- 1080p

### Lite target class

- GTX 1050 Ti / RX 570 class
- Reduced settings
- Realistic expectations

### Integrated graphics

- Best effort only for v1.0.0
- No formal promise without real validation

The project will use cost tiers and tooltips instead of pretending to provide exact GPU or VRAM usage.

---

## 12. Documentation Strategy

The project uses bilingual documentation.

- English is the canonical documentation language.
- Spanish is the official translation.
- English documents should be updated first.
- Spanish documents should remain synchronized in meaning.

Documentation must support:

- Users
- Contributors
- Portfolio review
- GitHub presentation
- AI-assisted development
- YouTube development logs

---

## 13. Release Strategy

The project uses two progress systems:

1. Roadmap levels for internal engineering progress.
2. Maturity labels for public stability.

Initial mapping:

| Version | Roadmap Level | Maturity |
| --- | --- | --- |
| v0.1.0-prealpha | Level 0 — Foundation | Pre-alpha |
| v0.2.0-prealpha | Level 1 — Baseline Visuals | Pre-alpha |
| v0.3.0-prealpha | Level 2 — Material Core | Pre-alpha |
| v0.4.0-alpha | Level 3 — Selective Reflections | Alpha |
| v0.5.0-alpha | Level 4 — Atmosphere | Alpha |
| v0.8.0-beta | Level 5 — Optimization and Release Prep | Beta |
| v1.0.0 | Stable Overworld Release | Stable |

---

## 14. Initial Risks

Known early risks include:

- Material classification limitations in the shader pipeline
- SSR artifacts when required data is off-screen
- Performance variation across GPUs, drivers, mods, and render distances
- Documentation drift between English and Spanish
- Scope creep before the Overworld experience is complete
- Over-customization that could break the visual identity

These risks must be documented, not hidden.

---

## 15. Level 0 Exit Criteria

Level 0 is complete when:

- The repository foundation exists.
- The root documentation files are filled.
- The Master Project Specification exists.
- The Level 0 foundation plan exists.
- The README explains the project clearly.
- The roadmap defines levels and maturity states.
- Licenses are defined.
- GitHub templates exist.
- AI collaboration rules are documented.
- The project is ready to begin Level 1 — Baseline Visuals.

---

## 16. Governance Rule

When uncertain, choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Performance over unnecessary complexity
5. Documentation over improvisation
6. Honest limitations over inflated promises
