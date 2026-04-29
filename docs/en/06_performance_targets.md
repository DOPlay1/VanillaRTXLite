# Performance Targets — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Performance and cost model specification
- Canonical language: English
- Target scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the performance targets and cost communication model for Vanilla RTX Lite.

The goal is to make performance expectations useful, realistic, and honest.

Vanilla RTX Lite must not claim exact GPU usage, exact VRAM usage, or universal FPS expectations without real validation.

---

## 2. Performance Philosophy

Performance is part of the project’s visual identity.

A visual effect is not successful if it looks good but makes the shader impractical to use.

The project must prioritize:

- Efficient shader paths
- Bounded visual options
- Preset-based quality control
- Material-gated expensive effects
- Graceful degradation
- Honest documentation
- Clear user-facing cost tiers

---

## 3. Reference Hardware

### Primary development reference

```plaintext
GPU: RTX 3070 Ti
Resolution: 1080p
Target use: Development, Balanced validation, Quality validation
```

This is the main hardware reference for development and visual tuning.

### Lite target class

```plaintext
GPU class: GTX 1050 Ti / RX 570 class
Resolution: 1080p
Target use: Lite preset, reduced settings, realistic expectations
```

This is a target class, not a guaranteed universal baseline.

### Integrated graphics policy

```plaintext
Integrated graphics: Best effort only for v1.0.0
```

Integrated graphics are not a formal support target for v1.0.0 unless real validation hardware becomes available.

---

## 4. Resolution Target

The initial validation resolution is:

```plaintext
1080p
```

Reason:

- It matches the primary development environment.
- It is common among players.
- It avoids pretending to validate resolutions that are not actually tested.
- It gives a practical baseline for early development.

Higher resolutions may be tested later, but they must not be claimed as validated until measured.

---

## 5. Preset Performance Intent

### Lite

Primary goal:

- Lower GPU cost
- Reduced expensive effects
- Wider usability
- Serious support for lower-end dedicated GPUs

Expected behavior:

- Lower SSR quality or SSR disabled
- Lower sample counts
- Simpler atmosphere
- Reduced shadow or reflection cost
- Same Vanilla+ identity

Lite must not feel like a broken version of the shader.

### Balanced

Primary goal:

- Reference visual identity
- Practical default
- Controlled cost
- Intended everyday preset

Expected behavior:

- Core visual features enabled
- Controlled reflection quality
- Moderate atmosphere
- Good visual/performance balance

Balanced is the recommended default target for most users.

### Quality

Primary goal:

- Better fidelity
- Smoother effects
- Improved reflection and atmosphere quality
- Still aligned with Vanilla+ restraint

Expected behavior:

- Higher sample counts
- Improved SSR quality where allowed
- Better atmospheric smoothness
- Higher visual polish

Quality must not become a different artistic style.

### Experimental

Primary goal:

- Controlled testing
- Unstable features
- Visual/technical exploration

Expected behavior:

- Features may be incomplete
- Performance may be unstable
- Not recommended for normal gameplay
- Not used as the baseline for public claims

### Custom

Primary goal:

- User control within safe limits

Expected behavior:

- Users may tune quality and cost
- Settings remain bounded
- Material identity cannot be broken
- Options are documented in the option registry

---

## 6. Cost Tier System

The project communicates performance impact using cost tiers.

Allowed tiers:

| Tier | Meaning |
| --- | --- |
| Very Low | Minimal impact in most cases |
| Low | Small impact, generally safe |
| Medium | Noticeable but acceptable cost |
| High | Expensive, should be preset-gated |
| Very High | Very expensive, experimental or quality-only |

These are relative estimates, not exact measurements.

---

## 7. Cost Dimensions

Every major feature should eventually define:

| Dimension | Purpose |
| --- | --- |
| `gpu_cost` | Estimated shader execution cost |
| `memory_cost` | Estimated render target or buffer pressure |
| `visual_impact` | Visual importance of the feature |
| `resolution_scaling` | How strongly the feature cost scales with resolution |
| `preset_availability` | Which presets may enable the feature |
| `fallback_strategy` | What happens when the feature is reduced or disabled |

---

## 8. Initial Feature Cost Expectations

| Feature | GPU Cost | Memory Cost | Visual Impact | Notes |
| --- | --- | --- | --- | --- |
| Torch warmth adjustment | Very Low | Very Low | Medium | Color/intensity tuning only |
| Exposure control | Low | Very Low | High | Essential for readability |
| Neutral tonemap | Low | Very Low | High | Final image consistency |
| Material mask | Low | Low | Very High | Required for material correctness |
| Fresnel helper | Low | Very Low | High | Cheap but important |
| Roughness response | Low | Very Low | High | Essential for material behavior |
| Specular response | Medium | Very Low | Medium | Should be material-gated |
| Water reflection | High | Medium | Very High | Must be preset-gated |
| Glass reflection | Medium | Low | High | Must remain subtle |
| SSR | High | Medium | High | Expensive and artifact-prone |
| Fog | Low | Low | Medium | Must remain readable |
| God rays | High | Medium | Medium | Optional and subtle |
| Debug views | Low | Very Low | High | Engineering requirement |

---

## 9. Resolution Scaling

Some features scale strongly with resolution.

High resolution increases cost for:

- SSR
- Full-screen fog
- Full-screen post-processing
- High-sample blur
- High-resolution intermediate buffers
- Expensive per-fragment lighting logic

Features with high resolution sensitivity should be clearly marked in the option registry.

---

## 10. Memory Pressure

The shader should avoid unnecessary render target growth.

Memory pressure can come from:

- Additional color buffers
- High-resolution intermediate buffers
- Reflection buffers
- History buffers if ever introduced
- Debug buffers if implemented inefficiently

The project must not claim exact VRAM usage unless measured with appropriate tooling.

Instead, it should communicate relative memory pressure.

---

## 11. Performance Metrics

When performance is measured, recommended fields are:

```plaintext
GPU:
CPU:
RAM:
Resolution:
Minecraft version:
Iris version:
Loader:
Preset:
Render distance:
World/scene:
Average FPS:
1% low FPS if available:
Driver version:
Operating system:
Notes:
```

Performance measurements must be presented as environment-specific observations.

They must not be treated as universal guarantees.

---

## 12. Benchmark Method

Early benchmarking should be simple and repeatable.

Recommended approach:

1. Use a documented validation scene.
2. Set a fixed resolution.
3. Use a fixed render distance.
4. Test one preset at a time.
5. Record average FPS.
6. Record visible stutter if present.
7. Capture notes about artifacts or visual regressions.
8. Avoid broad claims from a single result.

---

## 13. Release Performance Policy

Before a public release, the project should document:

- Tested Minecraft version
- Tested Iris version
- Tested GPU
- Tested resolution
- Tested presets
- Known performance limitations
- Known expensive options
- Recommended settings for Lite/Balanced/Quality

If a preset has not been properly tested, it should be labeled accordingly.

---

## 14. Performance Claims Policy

The project may say:

- “Estimated cost: High”
- “Recommended for mid-range dedicated GPUs”
- “Validated on RTX 3070 Ti at 1080p”
- “Lite is intended for lower-end dedicated GPUs”

The project must not say:

- “Uses exactly 2 GB VRAM”
- “Runs at 60 FPS on all GTX 1050 Ti systems”
- “Automatically detects your GPU usage”
- “Guaranteed performance on integrated graphics”
- “Exact GPU utilization is shown by the shader”

---

## 15. Lite Preset Minimum Philosophy

Lite is a real preset, not a degraded afterthought.

Lite should preserve:

- Vanilla+ identity
- Basic color pipeline
- Material correctness
- Torch warmth
- Readable atmosphere
- Debug compatibility where possible

Lite may reduce:

- SSR quality
- Reflection resolution
- Sample counts
- Atmospheric complexity
- Shadow quality
- Expensive full-screen effects

Lite must not allow matte materials to reflect.

---

## 16. Balanced Preset Philosophy

Balanced is the reference preset.

It should represent:

- Intended default look
- Controlled cost
- Full core visual philosophy
- Good gameplay readability
- Practical everyday use

Balanced should be the preset used for most screenshots and documentation unless otherwise stated.

---

## 17. Quality Preset Philosophy

Quality increases fidelity but does not change the artistic direction.

Quality may improve:

- Reflection smoothness
- SSR stability
- Atmosphere smoothness
- Shadow quality
- Color precision

Quality must still remain subtle and Vanilla+.

---

## 18. Experimental Preset Philosophy

Experimental is for testing.

It may include:

- Unstable effects
- Incomplete features
- Higher cost systems
- Features being evaluated for future inclusion

Experimental must not be used to define stable visual identity.

---

## 19. Integrated Graphics Policy

Integrated graphics are best-effort only for v1.0.0.

The project should avoid promising support for iGPU systems because performance depends heavily on:

- GPU generation
- Shared memory
- Driver quality
- Resolution
- Render distance
- Mods
- Operating system

If iGPU support improves later, it should be documented through real validation.

---

## 20. Performance Risk Areas

Known early risk areas:

- SSR cost and artifacts
- Reflection logic running too broadly
- Too many full-screen passes
- High shadow quality on low-end GPUs
- Atmosphere sample count
- Debug views implemented inefficiently
- Presets not reducing enough cost
- Over-customization causing expensive combinations

These risks should be tracked as implementation progresses.

---

## 21. Optimization Priorities

When optimization is needed, prioritize:

1. Avoid running expensive effects on non-eligible materials.
2. Reduce sample counts before removing visual identity.
3. Provide lower-cost fallback paths.
4. Keep Lite meaningful.
5. Avoid expensive work in full-screen passes when not needed.
6. Document visual tradeoffs.

---

## 22. Performance Governance Rule

When uncertain, choose:

1. Honest estimates over fake precision
2. Preset-gated cost over global cost
3. Material-gated effects over full-screen effects
4. Graceful fallback over visual breakage
5. Measured claims over assumptions
6. Usability over showcase visuals
