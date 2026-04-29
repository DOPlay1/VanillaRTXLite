# Validation Scenes — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Visual validation specification
- Canonical language: English
- Target scope: Overworld v1.0.0

---

## 1. Purpose

This document defines the validation scenes used to test Vanilla RTX Lite.

Validation scenes are controlled gameplay scenarios used to evaluate lighting, material behavior, reflections, atmosphere, debug views, and performance.

The goal is to avoid judging visual quality only through random screenshots or subjective impressions.

A shader change should be evaluated against repeatable scenes whenever possible.

---

## 2. Why Validation Scenes Matter

Vanilla RTX Lite depends on subtle visual decisions.

Small changes to reflection, exposure, fog, torch lighting, or roughness can accidentally break the Vanilla+ identity.

Validation scenes help detect:

- Reflective matte materials
- Excessive bloom
- Oversaturation
- Torch color drift
- Fog that hides gameplay
- Glass that becomes too mirror-like
- Water that reflects too strongly
- Caves that become unreadable
- Material behavior regressions
- Preset inconsistencies

---

## 3. Validation Philosophy

Validation must be practical, repeatable, and honest.

The goal is not to make every scene look dramatic.

The goal is to confirm that the shader behaves correctly across common gameplay conditions.

A scene passes validation when:

- Materials behave according to the material matrix.
- Lighting remains readable.
- The Vanilla identity remains intact.
- Expensive effects are controlled by presets.
- Debug views explain the behavior.
- The result looks good in motion, not only in screenshots.

---

## 4. Required Validation Scenes

The initial required validation set includes:

1. Midday exterior
2. Sunrise
3. Sunset
4. Night with torches
5. River or lake
6. Glass interior/exterior transition
7. Cave
8. Ice or snow environment
9. Fresh copper vs oxidized copper
10. Rain scene
11. Amethyst scene
12. Matte material stress scene

These scenes target the Overworld v1.0.0 scope.

---

## 5. Scene Documentation Template

Every validation scene should eventually document:

```plaintext
Scene name:
Purpose:
Location / seed / coordinates:
Time of day:
Weather:
Materials under review:
Preset tested:
Expected behavior:
Forbidden behavior:
Debug views to check:
Performance notes:
Screenshots:
Known issues:
```

If a scene cannot be reproduced exactly yet, document the closest available setup.

---

## 6. Scene 01 — Midday Exterior

### Purpose

Validate general daylight readability, exposure, color balance, matte materials, and terrain behavior.

### Conditions

- Time: Midday
- Weather: Clear
- Biome: Plains, forest edge, or similar common Overworld biome
- Presets: Lite, Balanced, Quality

### Materials under review

- Grass
- Dirt
- Stone
- Wood
- Leaves
- Sand or gravel if available
- Water if visible in distance

### Expected behavior

- Scene remains bright but not overexposed.
- Grass and foliage remain natural.
- Dirt and stone remain matte.
- Wood does not become glossy.
- Shadows remain readable.
- Colors remain close to Vanilla identity.

### Forbidden behavior

- Reflective terrain
- Oversaturated grass
- Burned highlights
- Heavy cinematic contrast
- Leaves looking wet or plastic
- Excessive bloom

### Debug views to check

- Material ID/category
- Reflective mask
- Exposure/luminance

---

## 7. Scene 02 — Sunrise

### Purpose

Validate early-day warmth, exposure adaptation, sky transition, and subtle atmosphere.

### Conditions

- Time: Sunrise
- Weather: Clear
- Biome: Open area with visible horizon
- Presets: Balanced, Quality

### Materials under review

- Terrain
- Water if available
- Glass if nearby
- Wood and foliage

### Expected behavior

- Sunrise warmth is visible but restrained.
- The sky does not become oversaturated.
- Terrain remains readable.
- Water may show subtle angle-dependent reflection.
- Matte materials remain matte.

### Forbidden behavior

- Extreme orange tint
- Washed-out horizon
- Overly cinematic grading
- Reflective dirt or grass
- Bloom dominating the image

### Debug views to check

- Exposure/luminance
- Reflective mask
- Fresnel factor where water or glass is visible

---

## 8. Scene 03 — Sunset

### Purpose

Validate warm low-angle lighting, reflection behavior, atmosphere, and color restraint.

### Conditions

- Time: Sunset
- Weather: Clear
- Biome: Open horizon, river, lake, or coastal area preferred
- Presets: Balanced, Quality

### Materials under review

- Water
- Glass if available
- Terrain
- Foliage
- Stone or cliffs

### Expected behavior

- Sunset feels warm but not exaggerated.
- Water reflection is more visible at grazing angles.
- Matte materials do not become shiny.
- Atmosphere adds depth without becoming cinematic-heavy.

### Forbidden behavior

- Strong orange/red color cast over everything
- Mirror-like water under all angles
- Reflective terrain
- Excessive god rays
- Loss of gameplay readability

### Debug views to check

- Reflective mask
- Fresnel factor
- SSR contribution
- Exposure/luminance

---

## 9. Scene 04 — Night with Torches

### Purpose

Validate torch warmth, local light behavior, cave/exterior readability, and night exposure.

### Conditions

- Time: Night
- Weather: Clear
- Setup: Torches placed around wood, stone, dirt, and glass
- Presets: Lite, Balanced, Quality

### Materials under review

- Torch-lit wood
- Stone
- Dirt
- Glass
- Water if nearby
- Foliage if nearby

### Expected behavior

- Torch light feels warm and fire-like.
- Torch light is not white by default.
- Torch light is not overly red.
- Nearby materials remain readable.
- Matte materials do not become glossy.
- Reflections appear only where material rules allow.

### Forbidden behavior

- White torch lighting
- Red-heavy torch lighting
- Excessive bloom around torches
- Stone or dirt becoming wet-looking
- Night becoming unreadably dark
- Glass becoming a strong mirror

### Debug views to check

- Exposure/luminance
- Material ID/category
- Reflective mask
- Specular contribution

---

## 10. Scene 05 — River or Lake

### Purpose

Validate water reflection, Fresnel, roughness, SSR behavior, and performance cost.

### Conditions

- Time: Midday, sunset, and night variants recommended
- Weather: Clear
- Setup: Still or slow-moving water with visible shore
- Presets: Lite, Balanced, Quality

### Materials under review

- Water
- Shore dirt
- Stone
- Sand
- Foliage
- Sky reflection if supported

### Expected behavior

- Water is reflective but not a perfect mirror.
- Reflection increases at grazing angles.
- Shore materials remain matte.
- SSR fades gracefully when information is unavailable.
- Lite reduces expensive reflection behavior.

### Forbidden behavior

- Perfect mirror water under all conditions
- SSR artifacts without fallback
- Reflective dirt or stone near water
- Excessive shimmer
- Water reflection overpowering gameplay

### Debug views to check

- Reflective mask
- Fresnel factor
- SSR contribution
- Roughness

---

## 11. Scene 06 — Glass Interior/Exterior Transition

### Purpose

Validate glass visibility, edge response, reflection restraint, and indoor/outdoor exposure.

### Conditions

- Time: Day and night variants recommended
- Setup: House or structure with glass walls/windows
- Presets: Balanced, Quality

### Materials under review

- Glass
- Glass panes
- Tinted glass
- Wood
- Stone
- Interior torch lighting if available

### Expected behavior

- Glass has subtle reflection.
- Glass remains transparent and readable.
- Edge response is visible but not excessive.
- Tinted glass remains darker and muted.
- Interior/exterior transition remains controlled.

### Forbidden behavior

- Glass becoming a strong mirror
- Excessive glare
- Tinted glass losing its identity
- Thin glass pane artifacts
- Exposure shifting too aggressively

### Debug views to check

- Material ID/category
- Reflective mask
- Fresnel factor
- SSR contribution

---

## 12. Scene 07 — Cave

### Purpose

Validate darkness handling, torch lighting, stone behavior, exposure, and readability.

### Conditions

- Time: Any
- Setup: Natural cave or created cave scene
- Lighting: Torches, lava optional but not required for v1.0.0
- Presets: Lite, Balanced, Quality

### Materials under review

- Stone
- Deepslate
- Dirt patches
- Ores if visible
- Torch-lit surfaces
- Amethyst if available

### Expected behavior

- Cave remains readable.
- Torch light feels warm and believable.
- Stone remains matte.
- Shadows are soft enough for gameplay.
- Exposure does not overcompensate aggressively.

### Forbidden behavior

- Caves becoming too dark to play
- Stone becoming reflective
- Torch bloom overpowering the scene
- Excessive contrast
- Color grading hiding material detail

### Debug views to check

- Exposure/luminance
- Material ID/category
- Specular contribution
- Reflective mask

---

## 13. Scene 08 — Ice or Snow Environment

### Purpose

Validate ice response, snow brightness, exposure, and cold biome readability.

### Conditions

- Time: Midday and sunset variants recommended
- Weather: Clear or snow if available
- Biome: Snowy plains, frozen river, icy biome
- Presets: Balanced, Quality

### Materials under review

- Ice
- Packed ice
- Blue ice
- Snow
- Stone
- Water if visible

### Expected behavior

- Ice has controlled reflection.
- Packed ice and blue ice feel smoother but not glass-like.
- Snow does not overexpose.
- Cold scene remains readable.
- Reflections are softened by roughness.

### Forbidden behavior

- Snow clipping to pure white
- Ice behaving like clean glass
- Blue ice becoming too saturated
- Terrain reflecting incorrectly
- Excessive glare

### Debug views to check

- Reflective mask
- Roughness
- Fresnel factor
- Exposure/luminance

---

## 14. Scene 09 — Fresh Copper vs Oxidized Copper

### Purpose

Validate material differentiation between fresh and oxidized copper.

### Conditions

- Time: Day and torch-lit night variants recommended
- Setup: Fresh copper blocks beside oxidized copper blocks
- Presets: Balanced, Quality

### Materials under review

- Fresh copper
- Exposed copper
- Weathered copper
- Oxidized copper
- Nearby stone or wood for contrast

### Expected behavior

- Fresh copper has stronger specular response.
- Oxidized copper is more matte.
- Oxidation visibly reduces material response.
- Copper does not become gold-like.
- Highlights remain controlled.

### Forbidden behavior

- Oxidized copper reflecting like fresh copper
- Fresh copper looking like polished gold
- Oversaturated copper color
- Mirror-like metal response
- Highlights overpowering block texture

### Debug views to check

- Material ID/category
- Specular contribution
- Roughness
- Reflective mask

---

## 15. Scene 10 — Rain Scene

### Purpose

Validate weather response, fog, exposure, and future wet-surface logic boundaries.

### Conditions

- Weather: Rain
- Time: Day and night variants recommended
- Setup: Mixed terrain with wood, stone, leaves, water, and glass
- Presets: Lite, Balanced, Quality

### Materials under review

- Dirt
- Stone
- Wood
- Leaves
- Water
- Glass
- Roads or paths if available

### Expected behavior

- Rain adds mood without making every surface reflective.
- Matte materials remain mostly matte.
- Fog or atmosphere remains readable.
- Water response may become more noticeable.
- Performance cost remains controlled by preset.

### Forbidden behavior

- Everything becoming wet and reflective
- Leaves becoming plastic
- Stone becoming mirror-like
- Rain hiding the world
- Excessive brightness from wet surfaces
- Large performance drop without documentation

### Debug views to check

- Reflective mask
- Roughness
- Exposure/luminance
- SSR contribution where applicable

---

## 16. Scene 11 — Amethyst Scene

### Purpose

Validate crystalline material response and prevent fantasy-like overglow.

### Conditions

- Setup: Amethyst geode or controlled amethyst build
- Lighting: Low light and torch-lit variants
- Presets: Balanced, Quality

### Materials under review

- Amethyst
- Calcite
- Smooth basalt or stone surroundings
- Torch lighting if present

### Expected behavior

- Amethyst has subtle crystalline highlight.
- Emissive-like hint remains very low.
- Calcite remains almost matte.
- Surrounding stone remains non-reflective.

### Forbidden behavior

- Amethyst glowing strongly by default
- Magical/fantasy glow
- Calcite becoming glossy
- Stone reflecting
- Overly saturated purple response

### Debug views to check

- Material ID/category
- Specular contribution
- Emissive hint if implemented
- Reflective mask

---

## 17. Scene 12 — Matte Material Stress Scene

### Purpose

Validate that matte materials remain protected under strong lighting and extreme viewing angles.

### Conditions

- Time: Midday and sunset variants recommended
- Setup: Area containing dirt, stone, wood, leaves, sand, gravel
- Optional: place glass and water nearby for contrast
- Presets: Lite, Balanced, Quality

### Materials under review

- Dirt
- Stone
- Wood
- Leaves
- Sand
- Gravel
- Grass block sides
- Cobblestone
- Logs and planks

### Expected behavior

- Matte materials remain non-reflective.
- Strong light does not create accidental gloss.
- Fresnel does not affect matte materials.
- Specular response remains minimal or absent.
- Material identity stays clear.

### Forbidden behavior

- Reflective dirt
- Glossy wood
- Wet-looking leaves by default
- Shiny stone
- Sand or gravel reflection
- Material masks leaking reflection into matte categories

### Debug views to check

- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor

---

## 18. Screenshot Requirements

When capturing validation screenshots, use consistent conditions whenever possible.

Recommended screenshots per scene:

- Vanilla baseline
- Lite preset
- Balanced preset
- Quality preset
- Debug view where relevant

Screenshots should be stored under:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

Only curated screenshots should be committed.

Random captures should remain local and ignored.

---

## 19. Performance Notes

Validation scenes should eventually include performance notes.

Recommended fields:

```plaintext
GPU:
Resolution:
Minecraft version:
Iris version:
Preset:
Render distance:
Average FPS:
1% low FPS if available:
Known bottlenecks:
Notes:
```

Performance numbers should not be published as universal claims.

They are environment-specific observations.

---

## 20. Validation Before Release

Before any public release, review at least:

- Midday exterior
- Night with torches
- River or lake
- Glass transition
- Cave
- Ice/snow
- Copper comparison
- Matte material stress scene

For alpha and later releases, screenshots or notes should be included when possible.

---

## 21. Validation Governance Rule

When uncertain, choose:

1. Repeatable scenes over random screenshots
2. Gameplay readability over dramatic visuals
3. Material correctness over visual spectacle
4. Debug views over guesswork
5. Documented limitations over hidden issues
6. Honest performance notes over broad claims
