# Roadmap — Vanilla RTX Lite

## Project Status

Current stage:

```plaintext
Level 0 — Foundation
Maturity: Pre-alpha
Status: Completed, pending main merge/tag
Suggested milestone: v0.1.0-prealpha
```

Next stage:

```plaintext
Level 1 — Baseline Visuals
Maturity: Pre-alpha
Suggested milestone: v0.2.0-prealpha
```

---

## 1. Purpose

This roadmap defines the planned development path for Vanilla RTX Lite.

The project follows a staged roadmap to avoid scope creep, uncontrolled visual experimentation, and unstable releases.

The goal is to build a serious Vanilla+ RTX-like shader with:

- Clear documentation
- Material-aware rendering
- Restrained visual direction
- Honest performance communication
- Repeatable validation
- Professional Git and release workflow

---

## 2. Roadmap Philosophy

Vanilla RTX Lite must evolve gradually.

The project should not jump directly into advanced reflections, SSR, atmosphere, or cinematic effects before the foundation is stable.

Each level should produce a coherent, reviewable milestone.

The roadmap prioritizes:

1. Foundation before visuals
2. Minimal pipeline before advanced effects
3. Materials before reflections
4. Debug views before complex rendering
5. Performance gates before expensive features
6. Validation before public claims

---

## 3. Versioning Overview

Suggested version mapping:

| Version | Level | Maturity | Purpose |
| --- | --- | --- | --- |
| `v0.1.0-prealpha` | Level 0 — Foundation | Pre-alpha | Repository and documentation foundation |
| `v0.2.0-prealpha` | Level 1 — Baseline Visuals | Pre-alpha | Minimal shader loading and baseline output |
| `v0.3.0-prealpha` | Level 2 — Material Core | Pre-alpha | Material classification and core helpers |
| `v0.4.0-alpha` | Level 3 — Selective Reflections | Alpha | Approved material reflections and controlled SSR |
| `v0.5.0-alpha` | Level 4 — Atmosphere | Alpha | Fog, torch lighting, subtle atmosphere |
| `v0.8.0-beta` | Level 5 — Optimization and Release Prep | Beta | Presets, validation, packaging, polish |
| `v1.0.0-rc.1` | Stable Candidate | Release Candidate | Final Overworld validation |
| `v1.0.0` | Stable Overworld Release | Stable | First public stable Overworld release |

This mapping may evolve, but major changes should be documented in:

```plaintext
docs/en/10_architecture_decisions.md
docs/es/10_decisiones_de_arquitectura.md
```

---

## 4. Level 0 — Foundation

```plaintext
Status: Completed
Maturity: Pre-alpha
Suggested version: v0.1.0-prealpha
```

### Goal

Create the professional foundation of the repository before shader implementation begins.

### Completed work

- Repository structure created
- Root documentation created
- Licenses added
- `.gitignore` added
- `.gitattributes` added
- GitHub issue templates added
- Pull request template added
- `AGENTS.md` added
- Master project specification added
- English documentation set completed
- Spanish documentation set completed
- Material matrix documented
- Render pipeline documented
- Validation scenes documented
- Performance model documented
- Compatibility policy documented
- Git workflow documented
- Architecture decisions documented
- Known risks documented
- Release strategy documented
- Option registry documented
- Compatibility matrix documented
- Release checklist documented
- Codex task protocol documented
- Visual baseline manifest documented
- Level 0 foundation plan updated as closure record

### Deliverables

```plaintext
README.md
ROADMAP.md
CHANGELOG.md
CONTRIBUTING.md
AGENTS.md
LICENSE
LICENSE-DOCS
.gitignore
.gitattributes
.github/
docs/en/
docs/es/
examples/
shaders/
tools/
shader.properties
```

### Notes

Level 0 does not represent a gameplay-ready shader release.

It represents the professional foundation needed to start shader implementation safely.

---

## 5. Level 1 — Baseline Visuals

```plaintext
Status: Next
Maturity: Pre-alpha
Suggested version: v0.2.0-prealpha
```

### Goal

Create the minimal shader foundation required to load, render, and validate basic output.

Level 1 should focus on getting a simple, understandable shader pipeline running.

### Planned work

- Validate `shader.properties`
- Add minimal shader program files
- Add basic vertex/fragment pass structure
- Add minimal final output
- Add shared constants/includes
- Add initial color pipeline placeholder
- Add debug view selector foundation
- Add initial profile constants
- Confirm shader loads in the target environment
- Document tested Minecraft/Iris setup
- Add first compatibility matrix entries when possible

### Expected files

Potential files to create or update:

```plaintext
shader.properties
shaders/final.fsh
shaders/composite.vsh
shaders/composite.fsh
shaders/include/constants.glsl
shaders/include/uniforms.glsl
shaders/lib/color_pipeline.glsl
shaders/lib/debug_views.glsl
shaders/profiles/lite.glsl
shaders/profiles/balanced.glsl
shaders/profiles/quality.glsl
shaders/profiles/experimental.glsl
```

### Must not include yet

Level 1 should not include:

- Advanced SSR
- Complex water reflections
- Full material classification
- Final atmosphere system
- Heavy bloom
- Cinematic grading
- Vulkan implementation
- Nether support
- End support

### Completion criteria

Level 1 is complete when:

- Shader pack loads successfully.
- Minimal output renders.
- Basic program structure exists.
- Shared constants/includes exist.
- Debug view selector foundation exists.
- Code follows conventions.
- No major visual claims are made.
- Compatibility notes are updated with real tested setup.

---

## 6. Level 2 — Material Core

```plaintext
Status: Planned
Maturity: Pre-alpha
Suggested version: v0.3.0-prealpha
```

### Goal

Implement the core material logic required before reflections and advanced effects.

### Planned work

- Define material IDs/constants
- Add material category helpers
- Add conservative material fallback logic
- Add roughness placeholder or helper
- Add bounded Fresnel helper
- Add material debug view
- Add reflective mask debug view
- Validate matte material protection
- Start mapping approved materials where pipeline data allows

### Focus

Level 2 is about material correctness, not spectacle.

The priority is making sure the shader can distinguish between:

- Reflective materials
- Semi-reflective/specular materials
- Polished/glossy materials
- Crystalline materials
- Matte materials

### Must not include yet

- Full SSR
- Reflection-heavy visuals
- Wet terrain systems
- Unbounded custom material overrides

---

## 7. Level 3 — Selective Reflections

```plaintext
Status: Planned
Maturity: Alpha
Suggested version: v0.4.0-alpha
```

### Goal

Implement controlled reflections for approved materials only.

### Planned work

- Water reflection logic
- Glass reflection logic
- Ice reflection logic
- Reflection gating by material
- Fresnel-based reflection modulation
- Roughness-aware reflection response
- SSR prototype where appropriate
- SSR fallback behavior
- Reflection debug views
- Lite/Balanced/Quality reflection differences

### Required rule

Reflections must remain selective.

Matte materials must not reflect.

Protected matte materials include:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain
- Most organic surfaces

### Validation focus

Use validation scenes for:

- River or lake
- Glass transition
- Ice or snow environment
- Matte material stress scene
- Sunset water behavior

---

## 8. Level 4 — Atmosphere

```plaintext
Status: Planned
Maturity: Alpha
Suggested version: v0.5.0-alpha
```

### Goal

Add restrained atmosphere and lighting improvements without breaking Vanilla identity.

### Planned work

- Subtle fog
- Torch warmth tuning
- Torch intensity tuning
- Night readability
- Cave readability
- Sunrise/sunset restraint
- Rain atmosphere foundation
- Optional subtle god rays
- Atmosphere quality presets

### Required rule

Atmosphere must add depth, not drama.

It must not:

- Hide gameplay
- Oversaturate the image
- Turn the shader cinematic-heavy
- Make every surface wet or reflective
- Mask rendering problems

---

## 9. Level 5 — Optimization and Release Prep

```plaintext
Status: Planned
Maturity: Beta
Suggested version: v0.8.0-beta
```

### Goal

Prepare the shader for broader testing and eventual stable Overworld release.

### Planned work

- Preset tuning
- Cost tier review
- Performance validation
- Compatibility matrix updates
- Validation screenshots
- Known issue review
- Packaging scripts
- Release ZIP testing
- Changelog preparation
- Release checklist execution
- Public documentation cleanup

### Required rule

Performance claims must remain honest.

Allowed:

```plaintext
Validated on RTX 3070 Ti at 1080p.
Estimated cost: High.
Performance depends on GPU, resolution, render distance, mods, drivers, and preset.
```

Forbidden:

```plaintext
Guaranteed 60 FPS.
Uses exactly 2 GB VRAM.
Works perfectly on all GPUs.
Automatically detects exact GPU usage.
```

---

## 10. Stable Candidate — v1.0.0-rc.1

```plaintext
Status: Planned
Maturity: Release Candidate
```

### Goal

Prepare the final Overworld-focused stable release candidate.

### Planned work

- Final Overworld validation
- Preset review
- Release package verification
- Known issue review
- Compatibility notes
- Changelog finalization
- GitHub release draft
- Final screenshots if available
- No major new features unless critical

### Required rule

Release candidates should focus on fixes and validation, not new feature expansion.

---

## 11. Stable Release — v1.0.0

```plaintext
Status: Planned
Maturity: Stable
```

### Goal

Publish the first stable Overworld-focused release.

### Required scope

`v1.0.0` should include:

- Overworld lighting
- Controlled exposure
- Neutral tonemap
- Material-aware behavior
- Matte material protection
- Water behavior
- Glass behavior
- Ice behavior
- Quartz-like subtle polished response
- Copper differentiation
- Amethyst subtle response
- Torch warmth
- Subtle fog/atmosphere
- Presets
- Cost tier communication
- Release package
- Documentation

### Out of scope

`v1.0.0` does not include:

- Full Nether support
- Full End support
- Real ray tracing
- Path tracing
- Vulkan production line
- Built-in updater
- Exact GPU usage reporting
- Exact VRAM usage reporting
- Universal modpack compatibility
- Universal resource pack compatibility

---

## 12. Future Tracks After v1.0.0

Potential future tracks:

### Nether Support

Future milestone focused on:

- Nether atmosphere
- Lava-heavy lighting
- Basalt/blackstone behavior
- Nether-specific readability

### End Support

Future milestone focused on:

- End sky
- End stone behavior
- Void atmosphere
- End-specific lighting

### Vulkan-Oriented Track

Future separate technical track.

It may reuse:

- Visual philosophy
- Material rules
- Validation scenes
- Cost model
- Documentation structure

It should not be assumed to reuse the same GLSL/OpenGL implementation directly.

### Packaging Improvements

Future work may include:

- Automated pack building
- Release ZIP validation
- Versioned package naming
- Cleaner GitHub release workflow

---

## 13. Current Immediate Next Steps

After Level 0 closure:

1. Review `README.md`.
2. Update `CHANGELOG.md`.
3. Confirm `ROADMAP.md` reflects Level 0 completion.
4. Merge `dev` into `main`.
5. Optionally create `v0.1.0-prealpha`.
6. Start Level 1 with a small shader-loading task.

---

## 14. Roadmap Governance Rule

When uncertain, choose:

1. Foundation before effects
2. Material correctness before reflections
3. Debug visibility before complex visuals
4. Performance gates before expensive features
5. Validation before public claims
6. Stable scope over feature excitement
