# Visual Baseline Manifest — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Visual baseline and no-regression manifest
- Canonical language: English
- Target scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the visual baseline for Vanilla RTX Lite.

The visual baseline is the standard used to judge whether a shader change still belongs to the project.

It protects the project from visual drift, excessive effects, material mistakes, and unsupported artistic changes.

---

## 2. Visual Baseline Philosophy

Vanilla RTX Lite should make Minecraft look more refined while preserving its original identity.

The project should feel:

- Vanilla+
- Natural
- Restrained
- Playable
- Material-aware
- Performance-conscious
- Slightly more realistic without becoming cinematic-heavy

The shader must improve the image without replacing Minecraft’s visual language.

---

## 3. Core Visual Statement

The shader should still look like Minecraft.

A good visual change should make the player feel:

```plaintext
This looks like Minecraft, but cleaner, deeper, and more believable.
```

A bad visual change makes the player feel:

```plaintext
This looks like a different game.
```

---

## 4. Visual Baseline Rules

Every visual feature must respect these rules:

1. Preserve Vanilla identity.
2. Improve readability.
3. Respect material categories.
4. Avoid exaggerated effects.
5. Stay subtle by default.
6. Avoid global visual hacks.
7. Remain performance-aware.
8. Be explainable through documentation or debug views.

---

## 5. Vanilla Identity Requirements

Minecraft must remain recognizable at first glance.

The shader must preserve:

- Block readability
- Original material identity
- Stylized simplicity
- Clear silhouettes
- Gameplay visibility
- Natural color relationships
- Familiar Overworld atmosphere

The shader must not make the game look like:

- A cinematic demo
- A photorealistic asset pack
- A wet-surface showcase
- A high-bloom fantasy shader
- A different game engine

---

## 6. Color Baseline

Color should remain restrained and close to Vanilla identity.

### Required behavior

- Grass remains natural.
- Foliage remains readable.
- Sky color remains believable.
- Torch light is warm but not red-heavy.
- Sunset warmth is present but controlled.
- Shadows preserve detail.
- Whites are not burned.
- Blacks are not crushed.

### Forbidden behavior

- Oversaturated grass
- Teal/orange cinematic grading
- Heavy contrast
- Washed-out daytime
- Extreme orange sunsets
- Purple or unnatural night tint
- Color filters that dominate gameplay

---

## 7. Lighting Baseline

Lighting should improve depth and readability.

### Required behavior

- Daylight remains clear.
- Shadows are soft enough for gameplay.
- Night remains playable.
- Torches provide warm readable light.
- Caves are dark but not unreadable.
- Local light supports material response without exaggeration.

### Forbidden behavior

- Extremely dark caves by default
- White torch lighting
- Excessively red torch lighting
- Burned highlights around torches
- Harsh shadow contrast
- Lighting that hides important gameplay information

---

## 8. Reflection Baseline

Reflections must be selective and material-based.

### Required behavior

Reflections may appear on:

- Water
- Glass
- Tinted glass
- Glass panes
- Ice
- Selected polished surfaces
- Selected specular metals
- Amethyst-like crystalline materials, subtly

Reflections must depend on:

- Material category
- Roughness
- Fresnel
- View angle
- Lighting condition
- Preset quality

### Forbidden behavior

Reflections must not appear on:

- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Rough terrain
- Most organic materials

The shader must not create:

- Mirror terrain
- Reflective dirt
- Glossy wood by default
- Wet leaves by default
- Stone that looks polished unless explicitly classified
- Global screen-wide reflection

---

## 9. Water Baseline

Water is allowed to be the strongest common reflective material.

### Required behavior

- Water reflects more at grazing angles.
- Reflection is controlled by Fresnel.
- Roughness or distortion softens reflection.
- Water remains playable and readable.
- Lite may reduce reflection quality.

### Forbidden behavior

- Perfect mirror water under all angles
- Excessive shimmer
- Reflection artifacts without fallback
- Water overpowering the scene
- Water looking like polished metal

---

## 10. Glass Baseline

Glass should have subtle angle-dependent response.

### Required behavior

- Glass remains transparent.
- Edge reflections are visible but controlled.
- Tinted glass remains darker and muted.
- Glass panes avoid noisy artifacts.

### Forbidden behavior

- Glass becoming a strong mirror
- Excessive glare
- Tinted glass losing identity
- Thin glass panes producing distracting reflection noise

---

## 11. Ice Baseline

Ice may be reflective, but it should not behave like clean glass.

### Required behavior

- Ice has controlled reflection.
- Packed ice and blue ice are softer than clean glass.
- Reflection is softened by roughness.
- Snow and ice scenes remain readable.

### Forbidden behavior

- Ice behaving like perfect glass
- Blue ice becoming oversaturated
- Snow clipping to pure white
- Excessive glare in cold biomes

---

## 12. Metal and Copper Baseline

Metals may have specular response, but they must not become mirrors by default.

### Required behavior

- Fresh copper has stronger response than oxidized copper.
- Oxidized copper is more matte.
- Iron-like surfaces have controlled highlights.
- Gold-like surfaces have warm but restrained response.
- Metals preserve block texture readability.

### Forbidden behavior

- Mirror-like metal blocks by default
- Fresh copper looking like polished gold
- Oxidized copper reflecting like fresh copper
- Oversaturated metallic highlights
- Specular response hiding block texture

---

## 13. Amethyst Baseline

Amethyst may have a subtle crystalline response.

### Required behavior

- Amethyst can show subtle highlights.
- Emissive-like hint remains very low.
- Purple response stays restrained.
- Surrounding calcite and stone remain mostly matte.

### Forbidden behavior

- Strong magical glow by default
- Overly saturated purple
- Calcite becoming glossy
- Stone around amethyst reflecting

---

## 14. Matte Material Baseline

Matte materials are protected.

The following materials must remain non-reflective by default:

- Dirt
- Grass block sides
- Stone
- Cobblestone
- Deepslate
- Sand
- Gravel
- Wood
- Logs
- Planks
- Leaves
- Most rough terrain
- Most organic materials

### Required behavior

- Diffuse lighting only or near-diffuse response.
- Very subtle specular response only if explicitly justified.
- No reflection contribution.
- No Fresnel shine.
- No wet look by default.

### Forbidden behavior

- Reflective matte terrain
- Glossy wood
- Plastic leaves
- Wet-looking stone by default
- Sand or gravel reflection
- Material mask leaks into matte categories

---

## 15. Atmosphere Baseline

Atmosphere should add depth, not drama.

### Required behavior

- Fog improves distance perception.
- Sunrise and sunset remain controlled.
- Rain atmosphere is readable.
- God rays, if present, are subtle.
- The world remains visible.

### Forbidden behavior

- Fog hiding gameplay
- Strong cinematic haze
- God rays dominating the image
- Rain making every surface reflective
- Atmosphere used to hide rendering problems

---

## 16. Bloom Baseline

Bloom must be restrained.

### Required behavior

- Bloom, if implemented, is subtle.
- Torch glow remains controlled.
- Highlights are not burned.
- Bloom supports readability, not spectacle.

### Forbidden behavior

- Heavy bloom
- Large glowing halos around torches
- Bloom hiding texture detail
- Bloom used as a cinematic effect by default

---

## 17. Tonemap and Exposure Baseline

Tonemap and exposure should preserve clarity.

### Required behavior

- Neutral tonemap by default.
- Exposure protects readability.
- Highlights remain controlled.
- Shadows preserve useful detail.
- Color pipeline feels polished, not filtered.

### Forbidden behavior

- Heavy filmic grading
- Crushed blacks
- Burned whites
- Strong color bias
- Exposure pumping that distracts during gameplay

---

## 18. Preset Visual Baseline

All presets must preserve the same core identity.

### Lite

Lite should reduce cost, not break identity.

Lite may reduce:

- SSR quality
- Reflection resolution
- Sample counts
- Atmosphere complexity
- Shadow quality

Lite must preserve:

- Material rules
- Vanilla+ identity
- Torch warmth
- Basic color pipeline
- Gameplay readability

### Balanced

Balanced is the reference visual baseline.

Screenshots and documentation should usually use Balanced unless otherwise stated.

### Quality

Quality improves fidelity, not art direction.

It may improve smoothness and stability but must not become cinematic-heavy.

### Experimental

Experimental can test unstable features.

Experimental must not define the stable visual identity.

### Custom

Custom allows bounded control.

Custom must not allow users to break non-negotiable material rules.

---

## 19. Debug Baseline

Debug views are part of the visual validation process.

Required planned debug views:

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Debug views should help explain why a surface behaves the way it does.

If a visual issue cannot be explained, the system needs better debug visibility.

---

## 20. Validation Baseline

Major visual changes should be checked against validation scenes.

Important scenes include:

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

A feature that only looks good in one screenshot is not enough.

---

## 21. No-Regression Checklist

Before accepting a significant visual change, verify:

| Rule | Must Remain True |
| --- | --- |
| Dirt does not reflect | Yes |
| Stone does not reflect | Yes |
| Wood does not become glossy by default | Yes |
| Leaves do not look wet by default | Yes |
| Sand and gravel remain diffuse | Yes |
| Water is reflective but not mirror-perfect | Yes |
| Glass remains readable | Yes |
| Ice is reflective but not clean glass | Yes |
| Copper oxidation reduces response | Yes |
| Amethyst remains subtle | Yes |
| Torch light remains warm but not red-heavy | Yes |
| Bloom remains restrained | Yes |
| Color remains close to Vanilla identity | Yes |
| Gameplay readability is preserved | Yes |

---

## 22. Visual Change Review Questions

Before accepting a visual change, ask:

1. Does this still look like Minecraft?
2. Does it respect the material matrix?
3. Does it improve gameplay readability?
4. Is it subtle enough by default?
5. Is it controlled by preset or option if expensive?
6. Can it be validated in a scene?
7. Can debug views explain it?
8. Does it introduce scope creep?
9. Does it preserve the Overworld v1.0.0 focus?
10. Does it avoid false RTX/path tracing expectations?

---

## 23. Common Visual Failure Modes

The project must avoid:

- Cinematic drift
- Excessive bloom
- Oversaturation
- Reflective matte materials
- Wet-looking terrain by default
- Water mirror effect under all angles
- Glass mirror effect
- Overdark caves
- Overbright torches
- Global reflections
- Preset style drift
- Custom settings breaking identity
- Performance-heavy defaults
- Debug visibility added too late

---

## 24. Visual Baseline Update Policy

This document may evolve, but changes must be intentional.

Update this manifest when:

- A new material category is accepted
- A major visual rule changes
- A new dimension becomes in scope
- A release milestone changes visual expectations
- Validation reveals that a baseline rule needs refinement

Do not weaken this document casually to justify a visual shortcut.

---

## 25. Visual Baseline Governance Rule

When uncertain, choose:

1. Vanilla identity over spectacle
2. Material correctness over visual shortcuts
3. Subtlety over intensity
4. Gameplay readability over screenshot drama
5. Debuggability over hidden behavior
6. Honest limitations over impressive claims
