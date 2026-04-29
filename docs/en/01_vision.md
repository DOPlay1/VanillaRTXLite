# Vision — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Visual and creative direction
- Canonical language: English

---

## 1. Vision Statement

Vanilla RTX Lite aims to make Minecraft Java feel more visually refined while preserving the original Vanilla identity of the game.

The shader should improve lighting, atmosphere, material response, and depth without making Minecraft look overprocessed, cinematic, or disconnected from its original style.

Core motto:

> It should still look like Minecraft — just better.

---

## 2. Design Philosophy

The project is built around restraint.

Vanilla RTX Lite should not compete with showcase shaders that prioritize dramatic screenshots over consistent gameplay.

Instead, it should focus on:

- Subtle realism
- Material coherence
- Natural lighting
- Controlled atmosphere
- Gameplay readability
- Performance-aware visual design

The shader should feel like an enhancement, not a replacement.

---

## 3. What Vanilla+ Means Here

Vanilla+ does not mean “almost unchanged.”

It means improving the existing visual language of Minecraft while respecting its blocky, readable, and stylized identity.

For this project, Vanilla+ means:

- Minecraft remains recognizable at first glance.
- Blocks keep their material identity.
- Lighting improves depth without overwhelming the scene.
- Colors stay natural and restrained.
- Effects support gameplay instead of distracting from it.
- Visual changes feel intentional, not decorative.

---

## 4. RTX-Like, Not RTX

Vanilla RTX Lite is inspired by RTX-style material response, but it is not a ray tracing or path tracing project.

The goal is to simulate some RTX-like qualities through intelligent OpenGL shader techniques:

- Selective reflections
- Fresnel-based response
- Roughness-aware highlights
- Controlled specular behavior
- Improved lighting perception
- Subtle atmospheric depth

The project should never claim to be real RTX, path tracing, or hardware ray tracing.

A better description is:

> Fake RTX with material intelligence and Vanilla+ restraint.

---

## 5. Visual Personality

The shader should feel:

- Clean
- Calm
- Natural
- Clear
- Playable
- Subtle
- Consistent
- Slightly more realistic than Vanilla

The shader should not feel:

- Loud
- Cinematic-heavy
- Oversaturated
- Overly glossy
- Visually noisy
- Washed out
- Too dark
- Too bright
- Designed only for screenshots

---

## 6. Lighting Direction

Lighting should improve spatial depth while preserving readability.

The intended lighting style is:

- Natural
- Balanced
- Soft
- Controlled
- Warm when appropriate
- Never aggressively dramatic by default

The shader should avoid:

- Harsh contrast
- Burned highlights
- Crushed shadows
- Overly orange sunsets
- Artificial white torch lighting
- Excessively dark caves that harm gameplay

---

## 7. Torch and Local Light Identity

Torch lighting is a key part of Minecraft’s visual identity.

In Vanilla RTX Lite, torches should feel warmer and more believable, but not exaggerated.

Torch light should be:

- Warm
- Fire-like
- Soft
- Readable
- Slightly golden
- Not red-heavy
- Not white by default

User settings may adjust warmth and intensity, but only inside safe limits.

The user should not be able to turn the default torch identity into a cold or artificial light source through normal presets.

---

## 8. Material Identity

Materials are the heart of the shader.

The shader must not treat every surface as glossy or reflective.

Material behavior should be based on physical categories:

- Reflective
- Semi-reflective
- Specular
- Glossy
- Matte
- Emissive-like

The following principle is mandatory:

> A material should only reflect if its physical identity supports reflection.

This means:

- Water can reflect.
- Glass can reflect.
- Ice can reflect.
- Polished quartz-like surfaces can have subtle response.
- Metals can have specular response.
- Amethyst can have a subtle crystalline response.
- Dirt, stone, wood, leaves, sand, and gravel must remain matte.

---

## 9. Reflection Direction

Reflections should be selective and restrained.

They should depend on:

- Material category
- Fresnel
- Roughness
- View angle
- Lighting condition
- Preset quality

Reflections should never be applied globally.

The project must avoid:

- Mirror-like terrain
- Reflective dirt
- Reflective wood
- Reflective leaves
- Excessive glass glare
- Water that looks like a perfect mirror under all conditions

Water may be the most reflective material, but even water must remain believable and playable.

---

## 10. Atmosphere Direction

Atmosphere should add depth, not drama.

Fog, god rays, sunrise color, sunset color, and sky treatment should remain subtle.

Atmospheric effects should:

- Improve distance perception
- Preserve gameplay visibility
- Support mood without dominating the image
- Stay consistent with Vanilla color language

Atmosphere should not:

- Hide the world
- Oversaturate the sky
- Turn every scene into a cinematic shot
- Make caves unreadable
- Make normal gameplay visually tiring

---

## 11. Color Direction

Color should remain restrained and natural.

The shader should not apply a heavy cinematic look.

Color grading should:

- Preserve Vanilla palette identity
- Control exposure
- Avoid clipped whites
- Avoid crushed blacks
- Avoid oversaturation
- Avoid aggressive contrast
- Avoid strong teal/orange bias

The final image should feel polished, not filtered.

---

## 12. Performance as Part of the Vision

Performance is part of the visual identity of the project.

A beautiful effect that destroys usability is not aligned with Vanilla RTX Lite.

The project should prioritize:

- Efficient shader paths
- Bounded options
- Preset-based cost control
- Debuggable features
- Honest performance documentation
- Graceful degradation for lower presets

The Lite preset must be more than an afterthought. It should be a serious target for lower-end dedicated GPUs.

---

## 13. Preset Personality

### Lite

Lite should preserve the project identity while reducing expensive effects.

It should feel like Vanilla RTX Lite, not like a broken or incomplete version.

### Balanced

Balanced is the reference look.

It should represent the intended default visual identity of the shader.

### Quality

Quality may improve fidelity and smoothness, but it must not become a different artistic style.

### Experimental

Experimental exists for testing.

It should not define the stable identity of the project.

### Custom

Custom allows flexibility, but not visual contradiction.

Users can tune intensity and cost, but should not be able to break the material rules or core visual philosophy.

---

## 14. What the Shader Must Never Become

Vanilla RTX Lite must not become:

- A cinematic shader showcase
- A bloom-heavy shader
- A mirror-surface shader
- A shader where every block looks wet
- A shader that hides gameplay readability
- A shader that ignores material identity
- A shader that overpromises performance or hardware detection
- A shader that chases visual trends without purpose

---

## 15. Visual Baseline Rule

Before adding a visual effect, ask:

1. Does this still look like Minecraft?
2. Does this respect the material?
3. Does this improve gameplay perception?
4. Is it subtle enough?
5. Can it be validated?
6. Can it be disabled or reduced if expensive?
7. Does it fit the Overworld v1.0.0 scope?

If the answer is unclear, the feature should be documented, constrained, or postponed.

---

## 16. Creative Success Criteria

The shader succeeds visually when:

- Minecraft remains immediately recognizable.
- The world feels deeper and more natural.
- Materials feel more believable without becoming exaggerated.
- Lighting improves the scene without dominating it.
- Reflections appear only where they make sense.
- The image feels clean during actual gameplay.
- The shader looks good in motion, not only in screenshots.
- The player forgets the shader is there and simply feels Minecraft looks better.

---

## 17. Final Vision Rule

When uncertain, choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Gameplay readability over screenshot drama
5. Performance over unnecessary complexity
6. Honest limitations over inflated promises
