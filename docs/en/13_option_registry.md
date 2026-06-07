# Option Registry — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Shader option registry
- Canonical language: English

---

## 1. Purpose

This document defines the option registry for Vanilla RTX Lite.

The goal is to make every user-facing option intentional, documented, bounded, and aligned with the project philosophy.

Shader options should not be added casually.

Every option increases:

- Testing cost
- Documentation cost
- Support cost
- Preset complexity
- Risk of visual inconsistency

---

## 2. Option Philosophy

Options should give users meaningful control without allowing them to break the shader’s identity.

Vanilla RTX Lite should avoid unlimited customization that enables:

- Reflective matte materials
- Excessive bloom
- Oversaturation
- White torch lighting by default
- Cinematic-heavy grading
- Expensive feature combinations without warning

The project should prefer fewer well-designed options over many uncontrolled settings.

---

## 3. Core Rule

Every user-facing option must have:

- A clear purpose
- A safe default
- A bounded range
- A cost tier
- A visual impact description
- A dependency list if applicable
- A restriction list if applicable
- Preset behavior

If an option cannot be explained clearly, it should not be added yet.

---

## 4. Required Option Metadata

Every important option should define:

```yaml
option_id:
display_name:
category:
description:
allowed_values:
default_value:
affected_presets:
gpu_cost:
memory_cost:
visual_impact:
resolution_scaling:
dependencies:
constraints:
notes:
```

---

## 5. Cost Tiers

Allowed cost tiers:

```plaintext
Very Low
Low
Medium
High
Very High
```

Cost tiers are relative estimates.

They are not exact performance measurements.

---

## 6. Visual Impact Levels

Allowed visual impact levels:

```plaintext
Low
Medium
High
Very High
```

Visual impact describes how noticeable the option is when changed.

It does not describe cost.

---

## 7. Resolution Scaling Levels

Allowed resolution scaling levels:

```plaintext
None
Low
Medium
High
Very High
```

Resolution scaling describes how strongly an option becomes more expensive at higher resolutions.

---

## 8. Option Categories

The initial shader option categories are:

```plaintext
Profiles
Lighting
Reflections
Atmosphere
Performance
Advanced
Debug
```

These categories should remain clear and user-friendly.

---

## 9. Profiles Category

The Profiles category controls the global preset.

### OPT-PROFILE-001 — Shader Profile

```yaml
option_id: OPT-PROFILE-001
display_name: Shader Profile
category: Profiles
description: Selects the global shader quality and feature profile.
allowed_values:
  - Lite
  - Balanced
  - Quality
  - Experimental
  - Custom
default_value: Balanced
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Experimental
  - Custom
gpu_cost: Varies
memory_cost: Varies
visual_impact: Very High
resolution_scaling: Varies
dependencies: []
constraints:
  - Custom must remain bounded by project rules.
  - Experimental must not define stable visual identity.
notes: Balanced is the reference look.
```

User-facing tooltip:

```plaintext
Selects the overall shader profile. Balanced is the recommended default. Lite reduces expensive effects, Quality improves fidelity, Experimental is for testing, and Custom allows bounded manual control.
```

---

## 10. Lighting Category

Lighting options control exposure, torch warmth, and general light response.

### OPT-LIGHT-001 — Exposure Strength

```yaml
option_id: OPT-LIGHT-001
display_name: Exposure Strength
category: Lighting
description: Controls how strongly the shader adapts brightness and preserves readability.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Low
memory_cost: Very Low
visual_impact: High
resolution_scaling: None
dependencies: []
constraints:
  - Must avoid burned highlights.
  - Must avoid crushed shadows.
notes: Exposure should support gameplay readability.
```

Tooltip:

```plaintext
Controls brightness adaptation. Higher values can improve visibility, but exposure remains bounded to avoid burned highlights or crushed shadows.
```

---

### OPT-LIGHT-002 — Torch Warmth

```yaml
option_id: OPT-LIGHT-002
display_name: Torch Warmth
category: Lighting
description: Controls the warm color identity of torch and fire-like local lighting.
allowed_values:
  - Reduced
  - Default
  - Warm
default_value: Default
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Very Low
memory_cost: Very Low
visual_impact: Medium
resolution_scaling: None
dependencies: []
constraints:
  - Torch lighting must not become white by default.
  - Torch lighting must not become overly red.
  - Values must remain within safe Vanilla+ bounds.
notes: Default represents the intended project identity.
```

Tooltip:

```plaintext
Adjusts torch warmth within safe limits. Default keeps torches warm and fire-like without becoming too red or white.
```

---

### OPT-LIGHT-003 — Torch Intensity

```yaml
option_id: OPT-LIGHT-003
display_name: Torch Intensity
category: Lighting
description: Controls the perceived strength of torch and local warm light.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Very Low
memory_cost: Very Low
visual_impact: Medium
resolution_scaling: None
dependencies: []
constraints:
  - Must not create excessive bloom.
  - Must not make caves unreadable through overcontrast.
notes: Torch intensity should preserve gameplay readability.
```

Tooltip:

```plaintext
Adjusts local torch brightness. Higher values increase visibility, but intensity remains limited to avoid excessive glow.
```

---

## 11. Reflections Category

Reflection options control material-approved reflections only.

Reflection options must never enable global reflection on matte materials.

### OPT-REFLECT-001 — Reflection Quality

```yaml
option_id: OPT-REFLECT-001
display_name: Reflection Quality
category: Reflections
description: Controls quality of material-approved reflections.
allowed_values:
  - Off
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: High
memory_cost: Medium
visual_impact: High
resolution_scaling: High
dependencies:
  - Material classification
  - Reflective material mask
constraints:
  - Must only affect approved reflective materials.
  - Must not enable reflections on matte materials.
notes: Lite may use Off or Low depending on performance.
```

Tooltip:

```plaintext
Controls reflections on approved materials such as water, glass, and ice. This does not enable reflections on dirt, stone, wood, leaves, sand, or gravel.
```

---

### OPT-REFLECT-002 — Water Reflection Strength

```yaml
option_id: OPT-REFLECT-002
display_name: Water Reflection Strength
category: Reflections
description: Controls reflection strength for water only.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Balanced
  - Quality
  - Custom
gpu_cost: High
memory_cost: Medium
visual_impact: Very High
resolution_scaling: High
dependencies:
  - Reflection Quality
  - Water material classification
constraints:
  - Water must not become a perfect mirror under all conditions.
  - Fresnel and roughness must remain active.
notes: This is one of the most visually important reflection options.
```

Tooltip:

```plaintext
Adjusts water reflections while keeping them controlled by Fresnel and roughness. Water should reflect, but not behave like a perfect mirror.
```

---

### OPT-REFLECT-003 — Glass Reflection Strength

```yaml
option_id: OPT-REFLECT-003
display_name: Glass Reflection Strength
category: Reflections
description: Controls reflection strength for glass-like materials.
allowed_values:
  - Low
  - Medium
  - High
default_value: Low
affected_presets:
  - Balanced
  - Quality
  - Custom
gpu_cost: Medium
memory_cost: Low
visual_impact: High
resolution_scaling: Medium
dependencies:
  - Reflection Quality
  - Glass material classification
constraints:
  - Glass must remain readable and transparent.
  - Glass must not become a strong mirror.
notes: Glass response should be more subtle than water.
```

Tooltip:

```plaintext
Adjusts subtle glass reflections. Higher values increase edge response, but glass remains readable and should not become a mirror.
```

---

### OPT-REFLECT-004 — SSR Quality

```yaml
option_id: OPT-REFLECT-004
display_name: SSR Quality
category: Reflections
description: Controls screen-space reflection quality where SSR is allowed.
allowed_values:
  - Off
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Experimental
  - Custom
gpu_cost: High
memory_cost: Medium
visual_impact: High
resolution_scaling: Very High
dependencies:
  - Reflection Quality
  - Depth buffer
  - Normal data
  - Reflective material mask
constraints:
  - Must be material-gated.
  - Must include fallback behavior.
  - Must not be described as real ray tracing.
notes: SSR is expensive and artifact-prone.
```

Tooltip:

```plaintext
Controls screen-space reflection quality. SSR can improve reflections but is expensive and may show artifacts when reflected information is off-screen.
```

---

## 12. Atmosphere Category

Atmosphere options control fog, subtle depth, and future god rays.

### OPT-ATM-001 — Fog Strength

```yaml
option_id: OPT-ATM-001
display_name: Fog Strength
category: Atmosphere
description: Controls subtle atmospheric fog and distance depth.
allowed_values:
  - Off
  - Low
  - Medium
  - High
default_value: Low
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Low
memory_cost: Low
visual_impact: Medium
resolution_scaling: Medium
dependencies: []
constraints:
  - Fog must not hide gameplay-relevant information.
  - Fog must not become cinematic-heavy by default.
notes: Fog should improve depth, not obscure the world.
```

Tooltip:

```plaintext
Controls subtle fog and distance depth. Higher values add more atmosphere, but visibility remains a priority.
```

---

### OPT-ATM-002 — God Rays

```yaml
option_id: OPT-ATM-002
display_name: God Rays
category: Atmosphere
description: Controls subtle light shafts when conditions allow.
allowed_values:
  - Off
  - Low
  - Medium
default_value: Off
affected_presets:
  - Quality
  - Experimental
  - Custom
gpu_cost: High
memory_cost: Medium
visual_impact: Medium
resolution_scaling: High
dependencies:
  - Atmosphere system
  - Sun direction
constraints:
  - Must be subtle.
  - Must not dominate the image.
  - Should not be enabled aggressively in Lite.
notes: God rays are optional and should remain restrained.
```

Tooltip:

```plaintext
Adds subtle light shafts when conditions allow. This effect is expensive and should remain restrained.
```

---

### OPT-ATM-003 — Rain Atmosphere

```yaml
option_id: OPT-ATM-003
display_name: Rain Atmosphere
category: Atmosphere
description: Controls subtle atmosphere adjustments during rain.
allowed_values:
  - Off
  - Low
  - Medium
default_value: Low
affected_presets:
  - Balanced
  - Quality
  - Custom
gpu_cost: Low
memory_cost: Low
visual_impact: Medium
resolution_scaling: Medium
dependencies:
  - Weather detection where available
constraints:
  - Must not make all materials reflective.
  - Must not hide the world.
notes: Rain atmosphere is separate from wet-surface material response.
```

Tooltip:

```plaintext
Adjusts atmosphere during rain. This does not make every surface reflective and should preserve visibility.
```

---

## 13. Performance Category

Performance options control cost-sensitive systems.

### OPT-PERF-001 — Reflection Resolution

```yaml
option_id: OPT-PERF-001
display_name: Reflection Resolution
category: Performance
description: Controls internal quality or resolution of expensive reflection work where applicable.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: High
memory_cost: Medium
visual_impact: Medium
resolution_scaling: High
dependencies:
  - Reflection Quality
constraints:
  - Should not affect non-reflective materials.
  - Must be documented as expensive.
notes: Lite should generally use Low.
```

Tooltip:

```plaintext
Controls reflection rendering cost. Higher values may improve reflection quality but increase GPU and memory pressure.
```

---

### OPT-PERF-002 — Atmosphere Quality

```yaml
option_id: OPT-PERF-002
display_name: Atmosphere Quality
category: Performance
description: Controls quality of fog, atmosphere, and related effects.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Medium
memory_cost: Low
visual_impact: Medium
resolution_scaling: Medium
dependencies:
  - Fog Strength
constraints:
  - Higher quality must not create cinematic-heavy visuals.
notes: Quality controls smoothness and cost, not artistic direction.
```

Tooltip:

```plaintext
Controls atmosphere quality and cost. Higher values may improve smoothness but should not change the Vanilla+ visual direction.
```

---

### OPT-PERF-003 — Shadow Quality

```yaml
option_id: OPT-PERF-003
display_name: Shadow Quality
category: Performance
description: Controls shadow quality if custom shadow tuning is implemented.
allowed_values:
  - Low
  - Medium
  - High
default_value: Medium
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Custom
gpu_cost: Medium
memory_cost: Medium
visual_impact: High
resolution_scaling: Medium
dependencies:
  - Shadow system support
constraints:
  - Shadows must remain readable.
  - Shadows must not make gameplay unnecessarily difficult.
notes: This option depends on final shader implementation.
```

Tooltip:

```plaintext
Controls shadow quality. Higher values may improve softness or detail, but gameplay readability remains the priority.
```

---

## 14. Advanced Category

Advanced options should be limited.

They are intended for users who understand tradeoffs.

### OPT-ADV-001 — Tonemap Style

```yaml
option_id: OPT-ADV-001
display_name: Tonemap Style
category: Advanced
description: Selects the final tonemap behavior.
allowed_values:
  - Neutral
  - Soft
default_value: Neutral
affected_presets:
  - Balanced
  - Quality
  - Custom
gpu_cost: Low
memory_cost: Very Low
visual_impact: High
resolution_scaling: None
dependencies:
  - Color pipeline
constraints:
  - Must not introduce heavy cinematic grading.
  - Must preserve Vanilla identity.
notes: Neutral is the default project look.
```

Tooltip:

```plaintext
Selects final tonemapping behavior. Neutral preserves the intended Vanilla+ look, while Soft may slightly reduce contrast.
```

---

### OPT-ADV-002 — Color Saturation

```yaml
option_id: OPT-ADV-002
display_name: Color Saturation
category: Advanced
description: Controls final color saturation within safe bounds.
allowed_values:
  - Reduced
  - Default
  - Slightly Enhanced
default_value: Default
affected_presets:
  - Balanced
  - Quality
  - Custom
gpu_cost: Very Low
memory_cost: Very Low
visual_impact: Medium
resolution_scaling: None
dependencies:
  - Color pipeline
constraints:
  - Must not allow oversaturation.
  - Must not create a cinematic color grade.
notes: Saturation should remain restrained.
```

Tooltip:

```plaintext
Adjusts final saturation within safe limits. The shader avoids oversaturated or cinematic-heavy color by design.
```

---

## 15. Debug Category

Debug options are part of the engineering workflow.

They may be hidden or advanced-facing in public builds.

### OPT-DEBUG-001 — Debug View

```yaml
option_id: OPT-DEBUG-001
display_name: Debug View
category: Debug
description: Selects internal debug visualization output.
allowed_values:
  - Off
  - Material ID
  - Reflective Mask
  - Roughness
  - Fresnel
  - Specular
  - SSR
  - Exposure
default_value: Off
affected_presets:
  - Lite
  - Balanced
  - Quality
  - Experimental
  - Custom
gpu_cost: Low
memory_cost: Very Low
visual_impact: Very High
resolution_scaling: Low
dependencies:
  - Internal debug view system
constraints:
  - Must not affect normal output when Off.
  - Must remain safe to enable during validation.
notes: Required for development and issue reporting.
```

Tooltip:

```plaintext
Shows internal shader debug views such as material category, reflective mask, roughness, Fresnel, SSR, or exposure. Used for validation and troubleshooting.
```

---

### VRTX_DEBUG_VIEW

| Field | Value |
| --- | --- |
| Option ID | `VRTX_DEBUG_VIEW` |
| Category | Debug |
| Type | Integer cycle |
| Default | `0` |
| Values | `0` Off, `1` Final Pass Marker, `2` UV Gradient, `3` Material Category, `4` Reflective Mask, `5` Roughness |
| Cost tier | Very Low |
| Visual impact | Debug-only |
| Dependencies | Final pass debug routing |
| Stability | Experimental |
| User-facing | Yes |
| Constraints | Must remain Off by default. Must not be used as a gameplay visual mode. |

Purpose:

`VRTX_DEBUG_VIEW` exposes the shared Level 1 and Level 2 debug routing through Iris shader settings.

It is intended to validate final-pass control, screen-space UV routing, material categories, reflective permission, and base roughness.

This option must remain disabled by default.

The Material Category, Reflective Mask, and Roughness modes are currently Level 2 placeholders. They display the category, reflection permission, and base roughness of the material ID provided by the current pipeline. Real block/material classification is not connected yet, so unknown materials use conservative non-reflective and fully rough fallbacks.

---

## 16. Options That Must Not Exist

The project should avoid options such as:

```plaintext
Make all blocks reflective
Enable cinematic mode
Extreme bloom
Force white torch light
Ultra saturated colors
Mirror terrain
Wet everything
Disable material rules
```

These options conflict with the project philosophy.

---

## 17. Preset Defaults Summary

Initial suggested defaults:

| Option | Lite | Balanced | Quality | Experimental |
| --- | --- | --- | --- | --- |
| Shader Profile | Lite | Balanced | Quality | Experimental |
| Exposure Strength | Medium | Medium | Medium | Medium |
| Torch Warmth | Default | Default | Default | Default |
| Torch Intensity | Medium | Medium | Medium | Medium |
| Reflection Quality | Low/Off | Medium | High | High |
| Water Reflection Strength | Low | Medium | High | High |
| Glass Reflection Strength | Low | Low | Medium | Medium |
| SSR Quality | Off/Low | Medium | High | High |
| Fog Strength | Low | Low | Medium | Medium |
| God Rays | Off | Off | Low | Medium |
| Rain Atmosphere | Low | Low | Medium | Medium |
| Reflection Resolution | Low | Medium | High | High |
| Atmosphere Quality | Low | Medium | High | High |
| Shadow Quality | Low | Medium | High | High |
| Tonemap Style | Neutral | Neutral | Neutral | Neutral |
| Color Saturation | Default | Default | Default | Default |
| Debug View | Off | Off | Off | Off |

These defaults may change after implementation and validation.

---

## 18. Option Review Checklist

Before adding an option, ask:

1. Does this option serve a real user need?
2. Does it preserve Vanilla+ identity?
3. Can it be documented clearly?
4. Does it have safe bounds?
5. Does it have a cost tier?
6. Does it interact with presets predictably?
7. Does it require validation scenes?
8. Can it break material rules?
9. Does it increase support burden?
10. Is it better as an internal preset value instead of a user option?

If the answer is unclear, do not expose the option yet.

---

## 19. Option Governance Rule

When uncertain, choose:

1. Fewer meaningful options over many weak options
2. Safe bounds over unlimited sliders
3. Material rules over user freedom
4. Honest cost labels over hidden expense
5. Preset clarity over configuration chaos
6. Visual identity over novelty settings
