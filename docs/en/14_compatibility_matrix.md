# Compatibility Matrix — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Compatibility validation matrix
- Canonical language: English

---

## 1. Purpose

This document tracks compatibility validation results for Vanilla RTX Lite.

The compatibility matrix records what has actually been tested.

It must not be filled with assumptions, guesses, or expected future support.

---

## 2. Relationship to Compatibility Policy

The compatibility policy is defined in:

```plaintext
docs/en/07_compatibility.md
```

That document explains the rules.

This document records validation results.

---

## 3. Core Rule

Only tested combinations should be marked as supported.

If a combination has not been tested, mark it as:

```plaintext
Unknown
```

Do not mark future Minecraft versions, Iris versions, GPUs, drivers, or operating systems as supported before validation.

---

## 4. Support Levels

Allowed support levels:

| Level | Meaning |
| --- | --- |
| Supported | Tested and expected to work |
| Best effort | May work, but not fully validated |
| Experimental | Works partially or is under evaluation |
| Unsupported | Not supported or intentionally out of scope |
| Unknown | Not tested yet |

---

## 5. Validation Fields

Every compatibility entry should include:

```plaintext
ID:
Date:
Project version:
Minecraft version:
Iris version:
Loader:
Operating system:
GPU:
Driver:
Resolution:
Preset:
Scene or test:
Result:
Support level:
Known issues:
Notes:
```

---

## 6. Current Compatibility Summary

Current stage:

```plaintext
Level 0 — Foundation
Pre-alpha
Documentation phase
```

At this stage, no shader implementation compatibility has been fully validated yet.

| Area | Current Status | Notes |
| --- | --- | --- |
| Minecraft Java 26.1.x | Target baseline | Planned baseline for implementation |
| Minecraft Java 26.2+ | Unknown | Future validation required |
| Minecraft Java 26.3+ | Unknown | Future validation required |
| Iris 1.10.9+mc26.1 | Target baseline | Planned minimum baseline |
| OpenGL / GLSL | Target backend | Initial production line |
| Vulkan | Unsupported for v1.0.0 | Future separate track |
| Windows | Expected primary dev OS | Requires validation during implementation |
| Linux | Unknown | Future reports needed |
| NVIDIA RTX 3070 Ti | Reference target | Development hardware |
| GTX 1050 Ti / RX 570 class | Lite target class | Requires real validation |
| Integrated graphics | Best effort | No formal support claim |
| Nether | Unsupported for v1.0.0 | Future scope |
| End | Unsupported for v1.0.0 | Future scope |

---

## 7. Minecraft Compatibility

| Minecraft Version | Status | Support Level | Notes |
| --- | --- | --- | --- |
| 26.1.x | Target baseline | Unknown | Planned implementation target |
| 26.2+ | Future validation | Unknown | Do not claim support before testing |
| 26.3+ | Future validation | Unknown | Do not claim support before testing |

---

## 8. Iris Compatibility

| Iris Version | Minecraft Version | Status | Support Level | Notes |
| --- | --- | --- | --- | --- |
| 1.10.9+mc26.1 | 26.1.x | Target baseline | Unknown | Planned minimum baseline |
| Latest stable validated release | Current supported line | Future validation | Unknown | Must be updated per release |

---

## 9. Loader Compatibility

| Loader | Version | Minecraft Version | Status | Support Level | Notes |
| --- | --- | --- | --- | --- | --- |
| TBD | TBD | 26.1.x | Not validated | Unknown | Depends on validated Iris setup |

---

## 10. Operating System Compatibility

| Operating System | Status | Support Level | Notes |
| --- | --- | --- | --- |
| Windows | Primary development target | Unknown | Expected first validation environment |
| Linux | Not validated | Unknown | Future testing or community reports needed |
| macOS | Not validated | Unknown | No support claim |

---

## 11. GPU Compatibility

| GPU / Class | Vendor | Status | Support Level | Notes |
| --- | --- | --- | --- | --- |
| RTX 3070 Ti | NVIDIA | Reference target | Unknown | Primary development hardware |
| GTX 1050 Ti class | NVIDIA | Lite target class | Unknown | Requires real validation |
| RX 570 class | AMD | Lite target class | Unknown | Requires real validation |
| Modern integrated graphics | Intel/AMD | Best effort | Unknown | No formal v1.0.0 support claim |

---

## 12. Resolution Compatibility

| Resolution | Status | Support Level | Notes |
| --- | --- | --- | --- |
| 1080p | Target baseline | Unknown | Initial validation resolution |
| 1440p | Not validated | Unknown | Future testing required |
| 4K | Not validated | Unknown | Likely higher cost; no claims yet |

---

## 13. Preset Compatibility

| Preset | Status | Support Level | Notes |
| --- | --- | --- | --- |
| Lite | Planned | Unknown | Lower-cost target |
| Balanced | Planned | Unknown | Reference visual target |
| Quality | Planned | Unknown | Higher fidelity target |
| Experimental | Planned | Experimental | Not stable identity |
| Custom | Planned | Unknown | Must remain bounded |

---

## 14. Dimension Compatibility

| Dimension | Status | Support Level | Notes |
| --- | --- | --- | --- |
| Overworld | Target scope | Unknown | Required for v1.0.0 |
| Nether | Out of v1.0.0 scope | Unsupported | Future milestone |
| End | Out of v1.0.0 scope | Unsupported | Future milestone |

---

## 15. Resource Pack Compatibility

| Resource Pack Type | Status | Support Level | Notes |
| --- | --- | --- | --- |
| Default Minecraft resources | Target baseline | Unknown | Primary validation target |
| Vanilla-like packs | Not validated | Best effort | May work if material identity remains close |
| High-resolution packs | Not validated | Unknown | May affect visual balance and performance |
| PBR packs | Not validated | Unknown | Not a formal v1.0.0 target |

---

## 16. Mod Compatibility

| Mod / Mod Type | Status | Support Level | Notes |
| --- | --- | --- | --- |
| Iris-required stack | Planned | Unknown | Must be validated |
| Rendering-altering mods | Not validated | Unknown | Potential compatibility risk |
| Lighting-altering mods | Not validated | Unknown | Potential compatibility risk |
| Heavy modpacks | Not validated | Unknown | No universal compatibility claim |
| Custom block mods | Not validated | Unknown | Material mapping may not apply |

---

## 17. Validation Log

Use this section to record real test results.

### Entry Template

```plaintext
ID:
Date:
Project version:
Minecraft version:
Iris version:
Loader:
Operating system:
GPU:
Driver:
Resolution:
Preset:
Scene or test:
Result:
Support level:
Known issues:
Notes:
```

---

## 18. Initial Validation Entries

### COMP-001 — Level 1 baseline shader load test on Minecraft 1.21.1

```plaintext
ID: COMP-001
Date: 2026-05-06
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 1.21.1
Loader: NeoForge 21.1.212
Iris version: 1.8.12-snapshot+mc1.21.1-local
Sodium version: 0.6.13+mc1.21.1
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 4.6
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Initial shader pack detection and load test
Result: Pass
Support level: Experimental
Known issues: Slight brightness increase compared to Vanilla.
Notes: Shader appeared in the Iris shader list, loaded without black screen, created an Overworld pipeline, and rendered a Vanilla-like image. No shader compilation errors were observed in the provided log.
```

This entry confirms an initial Level 1 smoke test only.

It does not imply stable support for Minecraft 1.21.1, older versions, future versions, heavy modpacks, or all hardware.

---

### COMP-002 — Level 1 baseline shader load test on Minecraft 26.1.2

```plaintext
ID: COMP-002
Date: 2026-05-06
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.19.2
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Initial shader pack detection, load test, and handheld item check
Result: Pass with known visual issue
Support level: Experimental
Known issues: Held wheat seeds render almost black when the shader is enabled.
Notes: Shader appeared in the Iris shader list, loaded on the target 26.1.x line, created an Overworld pipeline, and toggled on successfully. The NBT/datapack error observed earlier appears related to loading/upgrading the old world `RTX Vanilla`, not to shader compilation.
```

This entry confirms that the Level 1 baseline loads on the target 26.1.x line.

It does not imply stable support yet.

The handheld item rendering issue must be addressed before Level 1 can be considered visually clean.

---

### COMP-003 — Minimal hand rendering pass validation on Minecraft 26.1.2

```plaintext
ID: COMP-003
Date: 2026-05-06
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.19.2
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Handheld wheat seeds rendering after adding minimal hand pass
Result: Pass with visual limitation
Support level: Experimental
Known issues: Handheld wheat seeds no longer render almost black, but handheld item lighting appears overly bright and lacks proper shadowing.
Notes: The minimal hand rendering pass corrected the critical black-item issue observed in COMP-002. Further lighting/lightmap/shadow handling is still required before handheld rendering can be considered visually correct.
```

This entry confirms that the minimal hand pass resolves the black handheld wheat seeds issue.

It does not imply final handheld item lighting quality.

---

### COMP-004 — Baseline debug view validation on Minecraft 26.1.2

```plaintext
ID: COMP-004
Date: 2026-05-07
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.19.2
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Manual validation of baseline debug view modes
Result: Pass
Support level: Experimental
Debug modes tested: VRTX_DEBUG_FINAL_PASS_MARKER and VRTX_DEBUG_UV_GRADIENT
Known issues: Debug modes are internal-only and not exposed through Iris shader options yet.
Notes: The final pass marker produced a visible magenta overlay, confirming that `final.fsh` controls the final output. The UV gradient mode produced a full-screen coordinate gradient, confirming that debug view routing receives screen-space UV coordinates correctly.
```

This entry confirms that the internal Level 1 debug view routing works.

Debug modes must remain disabled by default.

---

### COMP-005 — Minimal hand lightmap validation on Minecraft 26.1.2

```plaintext
ID: COMP-005
Date: 2026-05-20
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.19.2
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Handheld wheat seeds rendering after adding minimal hand lightmap support
Result: Pass with remaining visual limitation
Support level: Experimental
Known issues: Handheld item lighting is improved, but still not final. Full material-aware lighting, shadow interaction, and proper handheld item refinement are not implemented yet.
Notes: The minimal hand lightmap support preserves handheld wheat seeds visibility and improves the previous overly flat/full-bright appearance. This confirms progress over COMP-003, but handheld rendering remains a Level 1 baseline implementation.
```

This entry confirms that minimal lightmap support improves handheld item rendering.

It does not imply final handheld lighting quality.

---

### COMP-006 — Iris debug option validation on Minecraft 26.1.2

```plaintext
ID: COMP-006
Date: 2026-05-20
Project version: Level 1 baseline branch / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.19.2
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolution: Not recorded
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Iris shader settings validation for baseline debug view option
Result: Pass
Support level: Experimental
Debug modes tested: Off, Final Pass Marker, UV Gradient
Known issues: Debug views are intended for validation only and are not gameplay visual modes.
Notes: The baseline debug view option appeared in Iris shader settings and successfully toggled between normal output, final pass marker overlay, and UV gradient output. This confirms that the shader settings path, language labels, option registry, and final pass debug routing are working together.
```

This entry confirms that the Level 1 debug view option is exposed and functional through Iris shader settings.

Debug modes must remain Off for normal gameplay.

---

## 19. Known Compatibility Risks

Known compatibility risk areas:

- Minecraft version changes
- Iris pipeline changes
- GLSL driver differences
- Vendor-specific OpenGL behavior
- Integrated graphics performance
- Heavy modpacks
- Resource packs that alter visual identity
- Custom blocks without material mapping
- Future Vulkan transition

See:

```plaintext
docs/en/11_known_risks.md
```

---

## 20. Updating This Matrix

Update this matrix when:

- A new Minecraft version is tested
- A new Iris version is tested
- A new GPU is tested
- A new operating system is tested
- A preset is validated
- A compatibility issue is found
- A known issue is fixed
- A public release is prepared

Do not update this matrix based only on assumptions.

---

## 21. Compatibility Matrix Governance Rule

When uncertain, choose:

1. Unknown over assumed support
2. Tested results over expectations
3. Specific notes over vague claims
4. Best-effort labels over false guarantees
5. Known issues over hidden issues
6. User honesty over marketing confidence
