# Compatibility — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Compatibility policy
- Canonical language: English
- Target scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the compatibility policy for Vanilla RTX Lite.

The goal is to make compatibility expectations clear, honest, and maintainable.

The project must avoid promising support for versions, hardware, drivers, loaders, or rendering backends that have not been tested.

---

## 2. Compatibility Philosophy

Compatibility must be based on validation, not assumptions.

Vanilla RTX Lite should communicate:

- What is supported
- What is planned
- What is experimental
- What is best-effort
- What is not supported yet
- What has not been tested

The project should prefer honest limitations over broad unsupported claims.

---

## 3. Minecraft Version Target

### Baseline target

The baseline development target is:

```plaintext
Minecraft Java 26.1.x
```

This is the first version line used for project development and validation.

### Future version policy

Later version lines such as:

```plaintext
Minecraft Java 26.2+
Minecraft Java 26.3+
```

may be supported after validation.

The project must not claim automatic compatibility with future Minecraft versions before testing.

---

## 4. Iris Target

### Minimum supported baseline

```plaintext
Iris 1.10.9+mc26.1
```

### Recommended version

The recommended Iris version is:

```plaintext
Latest stable Iris version validated against the currently supported Minecraft line.
```

### Policy

The project should document which Iris version was used for each release.

A release should not claim support for an Iris version that has not been tested.

---

## 5. Loader Policy

The primary loader target is whichever loader combination is required by the validated Iris version.

The project should document:

```plaintext
Minecraft version:
Iris version:
Loader:
Loader version:
```

in compatibility notes and release notes.

The shader should not promise universal loader compatibility without validation.

---

## 6. Rendering Backend

### Current backend

Vanilla RTX Lite currently targets:

```plaintext
OpenGL / GLSL through Iris
```

This is the production line for the initial project.

### Future backend

A future Vulkan-oriented line may be explored when the ecosystem becomes viable.

The Vulkan-oriented line should be treated as a separate technical track.

It should reuse:

- Visual philosophy
- Material rules
- Validation scenes
- Documentation strategy
- Cost model principles

It should not be assumed to reuse the same GLSL/OpenGL code directly.

---

## 7. OpenGL Line Policy

The OpenGL line remains important because many players and mod stacks may continue using OpenGL-based rendering for a long time.

The OpenGL line should not be abandoned immediately if a Vulkan-oriented line becomes possible.

The project should treat OpenGL support as valuable for:

- Compatibility
- Existing mod ecosystems
- Wider user access
- Stable public releases

---

## 8. GPU Compatibility Policy

### Reference GPU

```plaintext
RTX 3070 Ti
```

This is the primary development and validation GPU.

### Lite target class

```plaintext
GTX 1050 Ti / RX 570 class
```

This is the intended lower-end dedicated GPU class for the Lite preset.

### Integrated graphics

Integrated graphics are:

```plaintext
Best effort only for v1.0.0
```

The project must not promise formal iGPU support without validation.

---

## 9. GPU Vendor Policy

The project should aim to avoid vendor-specific assumptions.

Target vendors:

- NVIDIA
- AMD
- Intel, best-effort

However, behavior may vary by:

- Driver
- GPU architecture
- OpenGL implementation
- Operating system
- Iris version
- Mod stack

Compatibility notes should document vendor-specific issues when found.

---

## 10. Driver Policy

Driver versions can affect shader behavior and performance.

Release notes should eventually document:

```plaintext
GPU:
Driver version:
Operating system:
Minecraft version:
Iris version:
Preset tested:
Known issues:
```

The project should avoid claiming that a driver is supported unless it has been tested.

---

## 11. Operating System Policy

The project may be tested primarily on Windows during early development.

Other operating systems such as Linux may be supported as best-effort unless validated.

Compatibility reports should document:

```plaintext
Operating system:
GPU:
Driver:
Minecraft version:
Iris version:
```

The project should not claim equal behavior across all operating systems without testing.

---

## 12. Resolution Policy

Initial validation resolution:

```plaintext
1080p
```

Higher resolutions may work, but they should not be claimed as validated unless tested.

Resolution affects:

- SSR cost
- Full-screen effects
- Memory pressure
- Post-processing cost
- Intermediate buffer cost

---

## 13. Mod Compatibility Policy

Vanilla RTX Lite is designed for Minecraft Java with Iris.

Mod compatibility may vary.

The project should avoid promising compatibility with every modpack.

Potential compatibility risk areas:

- Mods that alter rendering
- Mods that alter block rendering
- Mods that modify lighting
- Mods that add custom materials
- Mods that change weather, sky, or atmosphere
- Performance-heavy modpacks

Compatibility with specific modpacks should be documented only after testing.

---

## 14. Resource Pack Compatibility

Resource packs may affect the shader’s appearance.

The shader’s default visual identity should be validated against the default Minecraft resource style first.

Resource packs may change:

- Albedo/color balance
- Texture roughness perception
- Material readability
- Block identity
- Visual consistency

The project should not guarantee perfect behavior with arbitrary resource packs.

---

## 15. Shader Option Compatibility

Some options may depend on other systems.

The option registry should document dependencies such as:

```plaintext
SSR requires reflective material mask.
Reflection quality depends on material classification.
God rays depend on atmosphere settings.
Debug views depend on internal buffers.
```

Options should degrade gracefully when dependencies are disabled.

---

## 16. Release Compatibility Notes

Every public release should eventually include compatibility notes.

Recommended fields:

```plaintext
Release version:
Minecraft version:
Iris version:
Loader:
Operating system:
GPU:
Driver:
Tested presets:
Known issues:
Unsupported scenarios:
```

---

## 17. Compatibility Matrix

The project should maintain a compatibility matrix under:

```plaintext
docs/en/14_compatibility_matrix.md
docs/es/14_matriz_de_compatibilidad.md
```

The compatibility matrix should record real validation results.

It should not be filled with guesses.

---

## 18. Support Levels

The project uses these compatibility support levels:

| Level | Meaning |
| --- | --- |
| Supported | Tested and expected to work |
| Best effort | May work, but not fully validated |
| Experimental | Unstable or under evaluation |
| Unsupported | Not supported or intentionally out of scope |
| Unknown | Not tested yet |

---

## 19. Initial Compatibility Position

For the current project stage:

| Area | Status |
| --- | --- |
| Minecraft Java 26.1.x | Target baseline |
| Minecraft Java 26.2+ | Future validation |
| Iris 1.10.9+mc26.1 | Minimum baseline |
| OpenGL / GLSL | Production line |
| Vulkan | Future separate track |
| RTX 3070 Ti | Reference development GPU |
| GTX 1050 Ti / RX 570 class | Lite target class |
| Integrated graphics | Best effort |
| Nether | Out of v1.0.0 scope |
| End | Out of v1.0.0 scope |

---

## 20. Unsupported for v1.0.0

The following are not supported targets for v1.0.0:

- Full Nether visual support
- Full End visual support
- Real RTX/path tracing
- Vulkan production line
- Built-in update system
- Exact GPU usage detection
- Exact VRAM usage detection
- Guaranteed integrated graphics performance
- Universal modpack compatibility
- Universal resource pack compatibility

---

## 21. Compatibility Risk Areas

Known risk areas include:

- Minecraft version changes
- Iris pipeline changes
- Driver-specific GLSL behavior
- SSR artifacts
- Custom resource packs
- Heavy modpacks
- Integrated graphics
- Future Vulkan transition
- Material classification limits

These risks should be tracked and documented.

---

## 22. Compatibility Governance Rule

When uncertain, choose:

1. Tested support over assumed support
2. Best-effort labels over false guarantees
3. Clear known issues over hidden problems
4. Compatibility notes over vague claims
5. OpenGL stability over premature Vulkan promises
6. User honesty over marketing language
