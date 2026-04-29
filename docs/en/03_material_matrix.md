# Material Matrix — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Material system specification
- Canonical language: English
- Target scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the initial material matrix for Vanilla RTX Lite.

The material matrix translates the project’s visual philosophy into practical rendering categories and material parameters.

The shader must think in materials, not isolated block gimmicks.

This document exists to prevent inconsistent visual behavior such as reflective dirt, glossy leaves, mirror-like stone, or exaggerated highlights on matte surfaces.

---

## 2. Core Rule

A material should only reflect if its physical identity supports reflection.

This rule is non-negotiable.

The project must not apply reflections globally.

---

## 3. Conceptual Separation

The material system separates four concepts:

### Reflection

Environment response.

Reflection is only allowed on approved materials such as water, glass, ice, and selected polished surfaces.

### Specular

Directional highlight caused by light interaction.

A material may have a specular highlight without becoming reflective.

### Gloss

Perceived smoothness or polish.

Gloss does not mean mirror reflection.

### Emissive-like Response

Subtle internal or luminous response.

This is only allowed for selected materials such as amethyst-like surfaces or future emissive materials.

---

## 4. Value Scale

Unless otherwise stated, values are expressed as normalized conceptual targets from `0.0` to `1.0`.

These values are not final shader constants yet.

They define intended behavior and should guide future implementation.

| Value Range | Meaning |
| --- | --- |
| 0.00 | None |
| 0.05 - 0.15 | Very subtle |
| 0.20 - 0.35 | Low |
| 0.40 - 0.60 | Medium |
| 0.65 - 0.80 | High |
| 0.85 - 1.00 | Very high |

---

## 5. Required Material Fields

Every material entry should define:

| Field | Purpose |
| --- | --- |
| `material_id` | Stable internal identifier |
| `display_name` | Human-readable material name |
| `category` | Rendering category |
| `reflectivity` | Base reflection strength |
| `roughness` | Surface roughness |
| `fresnel_strength` | Angle-dependent reflection influence |
| `specular_strength` | Directional highlight intensity |
| `ssr_strength` | Screen-space reflection contribution |
| `blur_amount` | Reflection or highlight softness |
| `emissive_hint` | Internal/emissive-like visual hint |
| `day_response` | Expected response in daylight |
| `night_response` | Expected response at night |
| `gpu_cost` | Estimated GPU cost tier |
| `memory_cost` | Estimated memory pressure tier |
| `visual_impact` | Expected visual impact |
| `restrictions` | Rules that must not be broken |

---

## 6. Material Categories

### Primary Reflective

Materials that may receive controlled environment reflections.

Examples:

- Water
- Glass
- Ice

### Secondary Specular

Materials that may receive highlights but should not become mirror-like.

Examples:

- Iron-like surfaces
- Gold-like surfaces
- Copper
- Oxidized copper

### Polished / Glossy

Materials that may show a very subtle polished response.

Examples:

- Quartz-like polished surfaces
- Calcite, extremely subtle

### Crystalline

Materials that may show subtle crystal-like response.

Examples:

- Amethyst

### Matte

Materials that must remain non-reflective.

Examples:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves

### Future Optional

Materials that may be explored later but are not required for v1.0.0.

Examples:

- Glazed terracotta
- Slime block
- Honey block

---

## 7. Initial Material Matrix

### 7.1 Water

| Field | Value |
| --- | --- |
| `material_id` | `water` |
| `display_name` | Water |
| `category` | Primary Reflective |
| `reflectivity` | 0.70 |
| `roughness` | 0.18 |
| `fresnel_strength` | 0.85 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.75 |
| `blur_amount` | 0.15 |
| `emissive_hint` | 0.00 |
| `day_response` | Reflections visible but not mirror-perfect |
| `night_response` | Subdued unless supported by moonlight or local light |
| `gpu_cost` | High |
| `memory_cost` | Medium |
| `visual_impact` | Very High |
| `restrictions` | Must not look like a perfect mirror under all conditions |

Notes:

Water is allowed to be the most reflective common material, but it must remain believable and playable.

Reflection should be strongest at grazing angles and softened by small wave distortion where implemented.

---

### 7.2 Glass

| Field | Value |
| --- | --- |
| `material_id` | `glass` |
| `display_name` | Glass |
| `category` | Primary Reflective |
| `reflectivity` | 0.45 |
| `roughness` | 0.08 |
| `fresnel_strength` | 0.65 |
| `specular_strength` | 0.35 |
| `ssr_strength` | 0.45 |
| `blur_amount` | 0.05 |
| `emissive_hint` | 0.00 |
| `day_response` | Subtle edge reflection and controlled glare |
| `night_response` | Low reflection unless lit |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | High |
| `restrictions` | Must preserve visibility through glass |

Notes:

Glass should not become a strong mirror.

Its response should be visible mostly through angle, light, and controlled specular behavior.

---

### 7.3 Tinted Glass

| Field | Value |
| --- | --- |
| `material_id` | `tinted_glass` |
| `display_name` | Tinted Glass |
| `category` | Primary Reflective |
| `reflectivity` | 0.35 |
| `roughness` | 0.10 |
| `fresnel_strength` | 0.60 |
| `specular_strength` | 0.30 |
| `ssr_strength` | 0.35 |
| `blur_amount` | 0.06 |
| `emissive_hint` | 0.00 |
| `day_response` | Controlled reflection with darker transmission feel |
| `night_response` | Very subdued reflection |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not overpower the tinted identity |

Notes:

Tinted glass should remain darker and more muted than regular glass.

---

### 7.4 Glass Panes

| Field | Value |
| --- | --- |
| `material_id` | `glass_pane` |
| `display_name` | Glass Pane |
| `category` | Primary Reflective |
| `reflectivity` | 0.40 |
| `roughness` | 0.08 |
| `fresnel_strength` | 0.65 |
| `specular_strength` | 0.32 |
| `ssr_strength` | 0.40 |
| `blur_amount` | 0.05 |
| `emissive_hint` | 0.00 |
| `day_response` | Subtle edge response |
| `night_response` | Low response unless lit |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not create noisy thin-surface artifacts |

Notes:

Glass panes may need special care because thin geometry can produce visual artifacts.

---

### 7.5 Ice

| Field | Value |
| --- | --- |
| `material_id` | `ice` |
| `display_name` | Ice |
| `category` | Primary Reflective |
| `reflectivity` | 0.55 |
| `roughness` | 0.20 |
| `fresnel_strength` | 0.70 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.50 |
| `blur_amount` | 0.20 |
| `emissive_hint` | 0.00 |
| `day_response` | Medium reflection with softened clarity |
| `night_response` | Subtle unless lit |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | High |
| `restrictions` | Must not behave like clean glass |

Notes:

Ice can reflect more than quartz but should remain softer and slightly blurred.

---

### 7.6 Packed Ice / Blue Ice

| Field | Value |
| --- | --- |
| `material_id` | `packed_ice_blue_ice` |
| `display_name` | Packed Ice / Blue Ice |
| `category` | Primary Reflective |
| `reflectivity` | 0.45 |
| `roughness` | 0.28 |
| `fresnel_strength` | 0.60 |
| `specular_strength` | 0.35 |
| `ssr_strength` | 0.35 |
| `blur_amount` | 0.25 |
| `emissive_hint` | 0.00 |
| `day_response` | Softer and less clear than regular ice |
| `night_response` | Very subtle |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must remain icy, not glass-like |

Notes:

Packed ice and blue ice should feel polished but not transparent-glass-like.

---

### 7.7 Quartz-Like Polished Surfaces

| Field | Value |
| --- | --- |
| `material_id` | `quartz_polished` |
| `display_name` | Quartz-Like Polished Surface |
| `category` | Polished / Glossy |
| `reflectivity` | 0.18 |
| `roughness` | 0.32 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.25 |
| `ssr_strength` | 0.10 |
| `blur_amount` | 0.35 |
| `emissive_hint` | 0.00 |
| `day_response` | Very subtle polished response |
| `night_response` | Minimal response |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not become mirror-like |

Notes:

Quartz should feel slightly polished, not reflective like glass.

---

### 7.8 Calcite

| Field | Value |
| --- | --- |
| `material_id` | `calcite` |
| `display_name` | Calcite |
| `category` | Polished / Glossy |
| `reflectivity` | 0.08 |
| `roughness` | 0.48 |
| `fresnel_strength` | 0.18 |
| `specular_strength` | 0.12 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.45 |
| `emissive_hint` | 0.00 |
| `day_response` | Almost matte with slight light response |
| `night_response` | Minimal |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Low |
| `restrictions` | Must remain close to matte |

Notes:

Calcite is almost matte. Its response should be extremely subtle.

---

### 7.9 Iron-Like Surfaces

| Field | Value |
| --- | --- |
| `material_id` | `iron_like` |
| `display_name` | Iron-Like Surface |
| `category` | Secondary Specular |
| `reflectivity` | 0.15 |
| `roughness` | 0.35 |
| `fresnel_strength` | 0.30 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.10 |
| `blur_amount` | 0.30 |
| `emissive_hint` | 0.00 |
| `day_response` | Visible highlight, controlled reflection |
| `night_response` | Local-light dependent |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not behave like a mirror |

Notes:

Iron-like materials should have stronger specular than reflection.

---

### 7.10 Gold-Like Surfaces

| Field | Value |
| --- | --- |
| `material_id` | `gold_like` |
| `display_name` | Gold-Like Surface |
| `category` | Secondary Specular |
| `reflectivity` | 0.22 |
| `roughness` | 0.28 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.55 |
| `ssr_strength` | 0.12 |
| `blur_amount` | 0.25 |
| `emissive_hint` | 0.00 |
| `day_response` | Warm highlight, subtle reflection |
| `night_response` | Local-light dependent |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not become overly saturated or mirror-like |

Notes:

Gold-like surfaces can have warm specular response, but the shader must avoid exaggerated golden glow.

---

### 7.11 Fresh Copper

| Field | Value |
| --- | --- |
| `material_id` | `copper_fresh` |
| `display_name` | Fresh Copper |
| `category` | Secondary Specular |
| `reflectivity` | 0.24 |
| `roughness` | 0.32 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.50 |
| `ssr_strength` | 0.12 |
| `blur_amount` | 0.28 |
| `emissive_hint` | 0.00 |
| `day_response` | Warm specular response |
| `night_response` | Local-light dependent |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not look like polished gold |

Notes:

Fresh copper should be more responsive than oxidized copper.

---

### 7.12 Oxidized Copper

| Field | Value |
| --- | --- |
| `material_id` | `copper_oxidized` |
| `display_name` | Oxidized Copper |
| `category` | Secondary Specular |
| `reflectivity` | 0.08 |
| `roughness` | 0.55 |
| `fresnel_strength` | 0.15 |
| `specular_strength` | 0.18 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.45 |
| `emissive_hint` | 0.00 |
| `day_response` | Mostly matte with slight response |
| `night_response` | Minimal |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Low |
| `restrictions` | Must be less reflective than fresh copper |

Notes:

Oxidation reduces visual reflectivity and specular strength.

---

### 7.13 Amethyst

| Field | Value |
| --- | --- |
| `material_id` | `amethyst` |
| `display_name` | Amethyst |
| `category` | Crystalline |
| `reflectivity` | 0.16 |
| `roughness` | 0.22 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.40 |
| `ssr_strength` | 0.05 |
| `blur_amount` | 0.18 |
| `emissive_hint` | 0.10 |
| `day_response` | Subtle crystal-like highlight |
| `night_response` | Very subtle internal hint if locally lit |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Must not glow strongly or look magical by default |

Notes:

Amethyst may have a subtle crystalline response, but not a fantasy glow.

---

### 7.14 Matte Terrain

| Field | Value |
| --- | --- |
| `material_id` | `matte_terrain` |
| `display_name` | Matte Terrain |
| `category` | Matte |
| `reflectivity` | 0.00 |
| `roughness` | 0.85 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.00 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Diffuse only |
| `night_response` | Diffuse only |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Must never reflect |

Applies to:

- Dirt
- Grass block sides
- Coarse dirt
- Podzol
- Mud when not treated as future optional wet material
- Most soil-like blocks

Notes:

This category exists to protect terrain from becoming glossy.

---

### 7.15 Stone-Like Matte Materials

| Field | Value |
| --- | --- |
| `material_id` | `stone_matte` |
| `display_name` | Stone-Like Matte Materials |
| `category` | Matte |
| `reflectivity` | 0.00 |
| `roughness` | 0.78 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.02 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Diffuse with very minimal light response |
| `night_response` | Diffuse only |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Must not look wet or polished by default |

Applies to:

- Stone
- Cobblestone
- Deepslate
- Andesite
- Diorite
- Granite
- Tuff
- Most rough stone blocks

Notes:

Stone may have diffuse lighting response, but not reflection.

---

### 7.16 Wood

| Field | Value |
| --- | --- |
| `material_id` | `wood_matte` |
| `display_name` | Wood |
| `category` | Matte |
| `reflectivity` | 0.00 |
| `roughness` | 0.70 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.03 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Diffuse with slight warmth from lighting |
| `night_response` | Diffuse only |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Must not become glossy by default |

Applies to:

- Logs
- Planks
- Stripped logs
- Wooden stairs
- Wooden slabs
- Fences
- Doors and trapdoors unless future special cases are defined

Notes:

Wood should remain natural and rough.

---

### 7.17 Leaves and Foliage

| Field | Value |
| --- | --- |
| `material_id` | `foliage_matte` |
| `display_name` | Leaves and Foliage |
| `category` | Matte |
| `reflectivity` | 0.00 |
| `roughness` | 0.80 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.02 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Diffuse and soft |
| `night_response` | Diffuse only |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Must not look wet or plastic by default |

Notes:

Leaves should not become shiny unless a future rain-specific system is explicitly designed and documented.

---

### 7.18 Sand and Gravel

| Field | Value |
| --- | --- |
| `material_id` | `sand_gravel_matte` |
| `display_name` | Sand and Gravel |
| `category` | Matte |
| `reflectivity` | 0.00 |
| `roughness` | 0.88 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.00 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Diffuse only |
| `night_response` | Diffuse only |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Must never reflect |

Notes:

Sand and gravel should remain dry and diffuse unless future biome/weather logic explicitly defines otherwise.

---

## 8. Future Optional Materials

These materials may be explored after the core Overworld material system is stable.

They are not required for v1.0.0.

### Glazed Terracotta

Potential behavior:

- Slight gloss
- No mirror reflection
- Low specular response

Risk:

- May look too artificial if overdone

### Slime Block

Potential behavior:

- Wet-looking surface
- Soft specular response
- Possibly translucent-feeling response

Risk:

- Can become visually noisy or too plastic

### Honey Block

Potential behavior:

- Soft translucent response
- Low reflection
- Warm color preservation

Risk:

- Can become too glossy or too saturated

### Wet Weather Response

Potential behavior:

- Rain may slightly modify roughness or surface darkness

Risk:

- Must not make all blocks reflective
- Must not violate matte material identity

---

## 9. Implementation Notes

The values in this document are not final shader constants.

They are guidance targets.

Final implementation may adjust values after:

- Visual testing
- Performance testing
- Validation scene review
- Preset tuning
- Material mapping constraints

Any major deviation must be documented in the architecture decisions file.

---

## 10. Validation Requirements

Material behavior must be validated in scenes that include:

- Water under daylight
- Water at sunset
- Glass in interior/exterior transition
- Ice/snow environment
- Quartz-like builds
- Copper fresh vs oxidized
- Amethyst in cave or low light
- Dirt/stone/wood/leaves under strong light
- Rain scene when weather systems are introduced

---

## 11. No-Regression Rules

The material system must always preserve:

- Dirt does not reflect
- Stone does not reflect
- Wood does not become glossy
- Leaves do not look wet by default
- Sand and gravel remain diffuse
- Water is reflective but not a perfect mirror
- Glass reflects subtly while preserving visibility
- Metals have highlights without becoming mirrors
- Copper oxidation visibly reduces material response
- Amethyst remains subtle

---

## 12. Material Governance Rule

When uncertain, choose:

1. Matte over accidental gloss
2. Subtle highlight over mirror reflection
3. Material identity over visual spectacle
4. Roughness over sharpness
5. Bounded Fresnel over glowing edges
6. Validation over assumption