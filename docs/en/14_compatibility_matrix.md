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

### COMP-007 — Material core compile validation on Minecraft 26.1.2

```plaintext
ID: COMP-007
Date: 2026-05-20
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
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
Scene or test: Material category constants and material helper compile validation
Result: Pass
Support level: Experimental
Known issues: Material classification is not connected to real block/material data yet.
Notes: Shader pack loaded successfully after adding material category constants, material IDs, base material helper functions, and the `materials.glsl` include path. No visual change was expected or observed.
```

This entry confirms that the initial Level 2 material core helper compiles successfully.

It does not imply final material classification or material-aware rendering yet.

---

### COMP-008 — Material category debug view validation on Minecraft 26.1.2

```plaintext
ID: COMP-008
Date: 2026-08-02
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 1 option changed
Dimension: Overworld
Scene or test: Material Category debug view routing and safe unknown-material fallback
Result: Pass
Support level: Experimental
Debug modes tested: Off, Material Category
Known issues: Real block/material classification is not connected yet, so the current material ID remains Unknown and produces a uniform near-black debug output.
Notes: The shader pack loaded without shader compilation errors. Material Category produced the expected uniform Unknown-category output, and switching Debug View back to Off restored normal output. Minecraft latest.log confirmed repeated successful pipeline creation with the test pack active.
```

This entry confirms that the Level 2 material category debug route is exposed, compiles, and preserves the conservative unknown-material fallback.

It does not imply per-block material classification yet.

---

### COMP-009 — Reflective mask debug view validation on Minecraft 26.1.2

```plaintext
ID: COMP-009
Date: 2026-08-02
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 1 option changed
Dimension: Overworld
Scene or test: Reflective Mask debug view routing and conservative unknown-material fallback
Result: Pass
Support level: Experimental
Debug modes tested: Off, Reflective Mask
Known issues: Real block/material classification is not connected yet, so the current Unknown material produces a uniform black non-reflective mask.
Notes: The shader pack loaded normally before enabling Reflective Mask. Enabling the mode rebuilt the Overworld pipeline without shader compilation errors and produced the expected uniform black mask while preserving the HUD. Minecraft latest.log confirmed the test pack and successful pipeline creation.
```

This entry confirms that the Level 2 reflective mask debug route compiles and defaults unknown materials to non-reflective behavior.

It does not imply real per-block reflective classification yet.

---

### COMP-010 — Roughness debug view validation on Minecraft 26.1.2

```plaintext
ID: COMP-010
Date: 2026-08-02
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 1 option changed
Dimension: Overworld
Scene or test: Roughness debug view routing and fully rough unknown-material fallback
Result: Pass
Support level: Experimental
Debug modes tested: Roughness
Known issues: Real block/material classification is not connected yet, so the current Unknown material uses roughness 1.0 and produces a uniform white debug output.
Notes: Enabling Roughness rebuilt the Overworld pipeline without shader compilation errors and produced the expected uniform white output while preserving the HUD. Minecraft latest.log confirmed repeated successful pipeline creation with the test pack active.
```

This entry confirms that the Level 2 roughness debug route compiles and defaults unknown materials to fully rough behavior.

It does not imply real per-block roughness classification yet.

---

### COMP-011 — Bounded Fresnel helper compile validation on Minecraft 26.1.2

```plaintext
ID: COMP-011
Date: 2026-08-02
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Bounded Fresnel helper include and baseline visual regression check
Result: Pass
Support level: Experimental
Known issues: The Fresnel helper is not connected to material or reflection output yet.
Notes: The shader pack loaded with `fresnel.glsl` included in the final pass. Iris created the Overworld pipeline without shader compilation errors, and the baseline image remained unchanged with Debug View Off.
```

This entry confirms that the bounded Schlick-style Fresnel helper compiles in the current Iris GLSL pipeline without changing visual output.

It does not validate material-specific Fresnel response yet.

---

### COMP-012 — Material Fresnel strength compile validation on Minecraft 26.1.2

```plaintext
ID: COMP-012
Date: 2026-08-03
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Material Fresnel strength defaults and nighttime baseline regression check
Result: Pass
Support level: Experimental
Known issues: Material Fresnel strengths are not connected to visible Fresnel or reflection output yet.
Notes: Iris loaded the test shader pack and created the Overworld pipeline without shader compilation errors. The subsequent nighttime baseline image remained visually stable with Debug View Off.
```

This entry confirms that the material Fresnel strength defaults compile in the current Iris GLSL pipeline without changing the nighttime baseline output.

It does not validate visible per-material Fresnel response yet.

---

### COMP-013 — Initial terrain material data and debug suite validation on Minecraft 26.1.2

```plaintext
ID: COMP-013
Date: 2026-08-03
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed for baseline and 1 option changed for each debug view
Dimension: Overworld
Scene or test: Daylight exterior and shoreline validation of Debug Off, Material Category, Reflective Mask, Roughness, and Fresnel Factor
Result: Pass
Support level: Experimental
Known issues: Initial material transport covers terrain only. Entities, the player hand, and other unsupported geometry do not provide material data yet.
Notes: Iris loaded the corrected test archive and recreated the Overworld pipeline for every debug mode without shader compilation errors. The Material Category view showed mapped water in blue, mapped matte terrain in gray, and unknown regions in black. The Reflective Mask kept matte and unknown regions black while marking mapped water white. The Roughness view showed high roughness on matte terrain and lower roughness on water. The Fresnel Factor view kept matte terrain black and concentrated the bounded response on water at grazing angles. Debug Off restored the normal baseline output. A transient mob-eye observation from an earlier invalid-pack fallback session was not reproduced with the valid shader pack.
```

This entry confirms that the initial terrain material buffer reaches the final pass and drives the four Level 2 material debug views with conservative fallbacks.

It does not validate reflections, specular output, or complete block and geometry coverage.

---

### COMP-014 — Targeted material lineup debug validation on Minecraft 26.1.2

```plaintext
ID: COMP-014
Date: 2026-08-03
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed for baseline and 1 option changed for each debug view
Dimension: Overworld
Scene or test: Daylight shoreline lineup with glass, tinted glass, amethyst, gold, copper oxidation stages, regular ice, and packed or blue ice; Debug Off, Material Category, Reflective Mask, and Fresnel Factor
Result: Partial
Support level: Experimental
Known issues: Gold-like blocks, intermediate copper oxidation stages, packed or blue ice, and amethyst clusters are not included in the initial conservative block mapping and use the safe Unknown fallback. Initial material transport remains terrain-only.
Notes: Iris recreated the Overworld pipeline for each selected debug mode without shader compilation or link errors. The normal baseline remained stable. Mapped glass variants, regular ice, fresh and fully oxidized copper, amethyst blocks, water, and surrounding matte terrain produced their expected category and permission outputs. The lineup also exposed intentionally unmapped approved material variants: they remained dark in Material Category, non-reflective in Reflective Mask, fully rough, and zero-Fresnel through the conservative Unknown fallback.
```

This entry confirms that the initial approved mappings remain conservative and that unsupported variants fail safely instead of inheriting reflection permission.

It identifies the next bounded material-core task: expand approved vanilla coverage without weakening matte protection.

---

### COMP-015 — Expanded approved-material coverage validation on Minecraft 26.1.2

```plaintext
ID: COMP-015
Date: 2026-08-03
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed for baseline and 1 option changed for each debug view
Dimension: Overworld
Scene or test: Daylight shoreline lineup after expanded gold, copper, amethyst, and ice mappings; Material Category, Reflective Mask, Roughness, Fresnel Factor, and Debug Off
Result: Pass
Support level: Experimental
Known issues: Material transport remains terrain-only. Exposed copper currently shares the fresh-copper profile, while weathered copper shares the oxidized-copper profile. The Xray_Ultimate resource pack was active, so Debug Off confirms output restoration but does not establish a default-resource visual baseline.
Notes: Iris loaded the updated test archive and recreated the Overworld pipeline for all four material debug views and Debug Off without shader compilation or link errors. Material Category showed glass and ice families in blue, amethyst blocks and clusters in purple, gold and every sampled copper oxidation stage in orange, and matte terrain in gray. Reflective Mask granted permission to water, glass, and ice families while keeping gold, copper, amethyst, and matte terrain black. Roughness produced the expected grayscale separation across glass, crystalline, metallic, ice, and matte profiles. Fresnel remained bounded and angle-dependent, with low front-facing response and zero response on protected matte materials. Debug Off restored normal gameplay output.
```

This entry confirms that the expanded approved vanilla mappings reach every Level 2 material debug view while preserving conservative reflection permission and matte protection.

It does not validate visible specular highlights, reflections, SSR, unsupported geometry, or the default-resource visual baseline.

---

### COMP-016 — Default-resource material lineup baseline on Minecraft 26.1.2

```plaintext
ID: COMP-016
Date: 2026-08-03
Project version: Level 2 material core branch / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed
Dimension: Overworld
Scene or test: Debug Off daylight shoreline lineup with the default Minecraft resources
Result: Pass
Support level: Experimental
Known issues: Material transport remains terrain-only. Visible material-aware specular response and reflections are outside the Level 2 scope and remain unimplemented.
Notes: Minecraft reloaded the resource manager with vanilla resources and the required Fabric, Iris, and Sodium resources only; no external resource pack remained active. The existing Vanilla RTX Lite shader session stayed active with Debug Off. The captured lineup preserved vanilla block textures, transparent glass readability, distinct copper oxidation stages, amethyst identity, ice identity, matte sand, water, vegetation, and normal HUD rendering. The resource reload and capture produced no shader compilation or link errors.
```

This entry establishes the clean default-resource visual baseline for the expanded Level 2 material lineup.

It validates normal Debug Off output, not future visible specular or reflection behavior.

---

### COMP-017 — v0.3.0-prealpha RC1 package and cold-start validation on Minecraft 26.1.2

```plaintext
ID: COMP-017
Date: 2026-08-03
Project version: v0.3.0-prealpha release candidate 1
Shader pack: VanillaRTXLite-v0.3.0-prealpha-rc1.zip
Shader pack SHA-256: F72DF77F0838AEEAA4B500AC4E8A11F94A861BD7B7B6317F81D77FDE2541D98C
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, 0 options changed for cold-start baseline and 1 option changed for Material Category
Dimension: Overworld
Scene or test: Clean candidate archive inspection, installation, shader-options access, Material Category check, and subsequent full application restart with Debug Off
Result: Pass
Support level: Experimental
Known issues: Validation covers one Windows, NVIDIA, and Iris environment. Material transport remains terrain-only, and visible reflections are outside the Level 2 milestone.
Notes: The candidate archive contained 27 forward-slash ZIP entries with the required shaders root, runtime entrypoints, shaders.properties, block mappings, README, MIT code license, and documentation license. It contained no Git metadata, development documentation tree, build directory, examples, or screenshots. The repository and installed copies had matching SHA-256 hashes. Iris opened the candidate settings and recreated the Overworld pipeline for Material Category without shader errors. On the subsequent full Minecraft restart, Iris selected the RC1 archive directly with Debug Off and zero changed options, the resource manager loaded only vanilla plus required Fabric, Iris, and Sodium resources, and the Overworld pipeline compiled successfully. The captured material lineup preserved the accepted default-resource baseline.
```

This entry accepts the clean RC1 archive as the validated package candidate for the Level 2 Material Core milestone.

Promotion to integration or release branches and creation of the `v0.3.0-prealpha` tag remain separate Git operations.

---

### COMP-018 — Material reflection weight debug validation on Minecraft 26.1.2

```plaintext
ID: COMP-018
Date: 2026-08-05
Project version: v0.4.0-alpha development
Shader pack: VanillaRTXLite-Level3-ReflectionWeight-Test-corrected.zip
Shader pack SHA-256: 94552FD7B0C75A1E73D8B6EA0A7CB23010E1A2FF5B858FF4C40509D520715D37
Minecraft version: 26.1.2
Loader: Fabric Loader 0.18.6
Iris version: 1.10.9+mc26.1.1
Sodium version: 0.8.9+mc26.1.1
Java version: Java 25
Operating system: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolution: 1920x1080
Preset/Profile: Custom, alternating between 0 options changed for Debug Off and 1 option changed for Reflection Weight
Dimension: Overworld
Scene or test: Approved-material lineup viewed at a grazing angle with Reflection Weight enabled, followed by Debug Off restoration
Result: Pass
Support level: Experimental
Known issues: The initial test archive used Windows backslash ZIP entries and Iris rejected it before shader compilation. The corrected archive contains forward-slash entries. Material transport remains terrain-only, the raw coefficient is intentionally dark at frontal angles, and visible reflection sampling, composition, and SSR are not implemented.
Notes: Iris selected the corrected archive and recreated the Overworld pipeline six times while the user alternated the debug option. The log recorded three sessions with one changed option and two subsequent Debug Off sessions, with no shader compilation, link, invalid-program, or corrected-pack load errors. The captured Reflection Weight view showed bounded grayscale response on approved reflective surfaces while non-approved materials and protected matte terrain remained black. Debug Off pipeline recreation was also confirmed in the log.
```

This entry validates the bounded Level 3 material reflection coefficient and its debug route.

It does not validate visible reflections, a reflection source, reflection composition, or SSR.

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
