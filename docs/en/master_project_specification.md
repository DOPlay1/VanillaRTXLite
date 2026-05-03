# Vanilla RTX Lite — Master Project Specification

> Canonical technical and creative specification for the Vanilla RTX Lite shader project.
>
> **Current roadmap stage:** Level 0 — Foundation  
> **Current maturity:** Pre-alpha  
> **Target line:** Minecraft Java 26.1.x  
> **Renderer:** OpenGL / GLSL through Iris  
> **Future track:** Vulkan-oriented line when ecosystem support is viable  
> **Canonical language:** English  
> **Official translation:** Spanish

---

## 1. Project Definition

### 1.1 Project Name
**Vanilla RTX Lite**

### 1.2 Short Description
Vanilla RTX Lite is a Minecraft Java shader project focused on subtle realism, selective material response, controlled lighting, and Vanilla+ visual consistency.

It aims to deliver an RTX-inspired experience without path tracing, without cinematic exaggeration, and without breaking Minecraft’s original visual identity.

### 1.3 Core Motto
> It should still look like Minecraft — just better.

### 1.4 Project Type
- Shader pack
- Graphics engineering portfolio project
- Public open-source style release
- Documentation-driven development project
- Future-ready architecture for optional tooling and possible Vulkan-oriented work

---

## 2. Product Vision

### 2.1 Vision Statement
Create a shader that improves Minecraft’s lighting, atmosphere, and material response while preserving the game’s original charm, readability, and visual language.

### 2.2 Design Thesis
Realism should support Minecraft, not replace it.

The shader must avoid the common problem of many showcase shaders: extreme bloom, oversaturation, mirror-like terrain, excessive cinematic grading, and visual noise that looks impressive in screenshots but inconsistent during real gameplay.

### 2.3 Visual Identity
The project should feel:
- Clean
- Natural
- Subtle
- Physically plausible
- Vanilla-respectful
- Lightweight when configured properly
- Visually coherent during normal gameplay

The project should not feel:
- Cinematic-heavy
- Overprocessed
- Oversaturated
- Unrealistic
- Showcase-only
- Inconsistent across materials

---

## 3. Scope

### 3.1 v1.0.0 Scope
The first stable release targets the **Overworld only**.

This is intentional. The Overworld is the main gameplay environment and should reach a complete, polished, and enjoyable state before expanding to the Nether and End.

### 3.2 In Scope for v1.0.0
- Overworld lighting
- Controlled exposure
- Neutral tonemapping
- Subtle color pipeline
- Material classification
- Fresnel-based selective reflections
- Roughness-aware material response
- Water reflection behavior
- Glass reflection behavior
- Ice response
- Quartz/polished material response
- Copper and metal-like specular response
- Amethyst subtle crystalline response
- Warm torch lighting
- Subtle fog
- Subtle atmospheric depth
- Debug views
- Presets and bounded customization
- Cost tiers and tooltips
- Public GitHub releases
- Documentation in English and Spanish

### 3.3 Out of Scope for v1.0.0
- Full Nether support
- Full End support
- Path tracing
- Real ray tracing
- Cinematic post-processing stack
- Motion blur
- Heavy depth of field
- Chromatic aberration
- Lens dirt
- Strong vignette
- Global reflections on matte materials
- Built-in updater inside the shader pack
- Exact GPU or VRAM telemetry
- Universal support for integrated graphics

### 3.4 Future Scope
- Nether support
- End support
- Companion update/helper tool
- Companion hardware recommendation tool
- Better compatibility reporting
- Vulkan-oriented successor line
- Expanded material support
- Public benchmark reports

---

## 4. Platform and Compatibility

### 4.1 Minecraft Target
- **Baseline development target:** Minecraft Java 26.1.x
- **Future compatibility policy:** best-effort validation for later 2026 release lines such as 26.2+ after testing

The project must not promise automatic compatibility with future Minecraft releases before validation.

### 4.2 Iris Target
- **Minimum supported baseline:** Iris 1.10.9+mc26.1
- **Recommended version:** latest stable Iris release validated against the currently supported Minecraft line

### 4.3 Rendering Backend
Current line:
- OpenGL
- GLSL
- Iris shader pipeline

Future line:
- Vulkan-oriented implementation when the ecosystem becomes viable

### 4.4 Vulkan Strategy
The future Vulkan-oriented line must not replace or invalidate the OpenGL line immediately.

Reason:
- Many players will continue using OpenGL-based mod stacks.
- Mod ecosystem migration may be gradual.
- OpenGL remains relevant for compatibility.

The Vulkan line should reuse concepts, documentation, material logic, validation scenes, and visual philosophy, but not necessarily the same code.

---

## 5. Audience

### 5.1 Primary Users
- Players who want a refined Vanilla+ visual experience
- Players who dislike exaggerated shaders
- Users with mid-range and high-end GPUs
- Users who want configurable but coherent graphics

### 5.2 Secondary Users
- Developers reviewing graphics engineering work
- Portfolio reviewers
- YouTube viewers following the creation process
- AI-assisted development workflows such as Codex
- Future contributors

---

## 6. Non-Negotiable Rules

These rules define the identity of the project.

### 6.1 Forbidden Material Behavior
The following materials must not receive reflective treatment:
- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Most matte terrain materials
- Most organic and rough surfaces

If these materials reflect the world like polished surfaces, the shader has failed its visual philosophy.

### 6.2 Forbidden Visual Behavior
The shader must not use:
- Excessive bloom
- Extreme saturation
- Artificial white torch lighting as default behavior
- Heavy cinematic color grading
- Global reflections without material logic
- Mirror-like terrain
- Effects added only because they look impressive in screenshots

### 6.3 Required Visual Behavior
The shader must preserve:
- Vanilla readability
- Natural lighting
- Controlled exposure
- Soft shadows
- Warm torch lighting
- Subtle atmosphere
- Material-specific logic
- Performance awareness

---

## 7. Rendering Philosophy

### 7.1 Material-First Rendering
The shader must think in materials, not isolated block gimmicks.

Implementation may require block or texture mapping internally, but the rendering decision should be expressed as physical material categories.

### 7.2 Selectivity Over Quantity
A few well-controlled effects are better than many global effects.

### 7.3 Realism Without Spectacle
Realistic behavior is welcome only when it reinforces the Minecraft experience.

### 7.4 Performance Is Design
Performance is not an afterthought. It is part of visual design.

An effect that cannot be made stable, coherent, and reasonably performant should be limited, downgraded, or postponed.

---

## 8. Material System

### 8.1 Required Separation
The project must separate these concepts:

#### Reflection
Environment response. Only allowed for approved materials.

#### Specular
Directional highlight from light interaction. Can exist without strong reflection.

#### Gloss
Perceived smoothness or polish. Not the same as reflection.

#### Emissive Response
Internal or apparent glow-like behavior for select materials only.

### 8.2 Primary Reflective Materials
- Water
- Glass
- Tinted glass
- Glass panes
- Ice
- Quartz-like polished surfaces
- Calcite with extremely subtle response

### 8.3 Secondary Specular Materials
- Iron-like surfaces
- Gold-like surfaces
- Copper
- Oxidized copper
- Amethyst

### 8.4 Future Optional Materials
- Glazed terracotta
- Slime block
- Honey block

### 8.5 Non-Reflective Materials
- Dirt
- Stone
- Sand
- Gravel
- Wood
- Leaves
- Most rough terrain blocks
- Most matte construction blocks

### 8.6 Material Entry Requirements
Each material entry in the material matrix must define:

```yaml
material_id:
category:
reflectivity:
roughness:
fresnel_strength:
specular_strength:
ssr_strength:
blur_amount:
emissive_hint:
day_response:
night_response:
restrictions:
gpu_cost:
memory_cost:
visual_impact:
```

### 8.7 Fresnel Rule
Fresnel is mandatory for reflective materials.

- Reflection should increase at grazing angles.
- Reflection should decrease at direct frontal view angles.
- Fresnel must be bounded to avoid exaggerated edge glow.

### 8.8 Roughness Rule
Roughness controls the sharpness and intensity of reflection/specular response.

- Low roughness: clearer response
- Medium roughness: softened response
- High roughness: mostly diffuse/matte response

### 8.9 Day/Night Rule
Material response must vary plausibly with light conditions.

- Day: reflections may be more visible
- Night: reflections should be more subdued unless supported by local light

---

## 9. Lighting System

### 9.1 Global Lighting
Lighting must be natural, restrained, and readable.

### 9.2 Exposure
Exposure must avoid clipped whites and crushed shadows as default behavior.

### 9.3 Torch Lighting
Torch lighting must be:
- Warm
- Fire-like
- Controlled
- Not red-heavy
- Not neutral white by default

Customization may adjust warmth only within a safe range. The user may adjust intensity, but not destroy the visual philosophy.

### 9.4 Sunlight
Sunlight should have clear directionality and subtle warmth shifts at sunrise and sunset.

### 9.5 Shadows
Shadows should be soft and readable.

### 9.6 God Rays
God rays must be subtle and situational.

They must not dominate the image.

### 9.7 Fog
Fog should improve depth perception without hiding gameplay-relevant information.

---

## 10. Color Pipeline

### 10.1 Purpose
The color pipeline exists to preserve consistency and prevent overprocessing.

### 10.2 Rules
- Neutral tonemapping
- Controlled saturation
- No cinematic teal/orange default look
- No harsh contrast curve
- No exaggerated bloom-driven color drift

### 10.3 Final Grading
Final color grading should be minimal and Vanilla-respectful.

The shader must not look like a movie filter applied globally.

---

## 11. Presets and Customization

### 11.1 Official Presets
The project supports five user-facing modes:

1. Lite
2. Balanced
3. Quality
4. Experimental
5. Custom

### 11.2 Lite
Goal:
- Reach lower-end dedicated GPUs with reduced cost.

Target class:
- GTX 1050 Ti / RX 570 class, with reduced settings and realistic expectations.

### 11.3 Balanced
Goal:
- Represent the intended default visual identity.

Balanced should be the reference look for the project.

### 11.4 Quality
Goal:
- Improve fidelity while preserving the same artistic direction.

Quality may increase samples or precision but must not change the visual philosophy.

### 11.5 Experimental
Goal:
- Test features that are not yet stable.

Experimental features must be clearly labeled and must not define the expected stable experience.

### 11.6 Custom
Goal:
- Allow users to tune the shader within safe limits.

Custom settings must be bounded to protect the project identity.

### 11.7 Customization Rule
Users may change intensity, quality, and performance tradeoffs.

Users should not be given settings that directly enable contradictory visuals, such as reflective dirt or white default torches.

---

## 12. Option Registry

### 12.1 Purpose
The option registry prevents uncontrolled growth of settings and gives every option a reason to exist.

### 12.2 Required Metadata
Each user-facing option must define:

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
```

### 12.3 Initial UI Categories
The shader settings UI should be organized into:

- Profiles
- Lighting
- Reflections
- Atmosphere
- Performance
- Advanced
- Debug

This may be simplified during early implementation, but the intended structure should remain documented.

---

## 13. Cost Model

### 13.1 Honesty Policy
The project must be honest about performance.

It must not claim exact VRAM usage or exact GPU utilization from inside the shader pack.

### 13.2 Cost Tiers
User-facing cost should be communicated through tiers:

- Very Low
- Low
- Medium
- High
- Very High

### 13.3 Cost Dimensions
Each major feature should define:

```yaml
gpu_cost_weight:
memory_cost_weight:
visual_impact:
resolution_scaling:
dependencies:
recommended_hardware:
```

### 13.4 Examples
SSR Quality:
- GPU cost: High
- Memory pressure: Medium
- Visual impact: High
- Resolution scaling: High

Torch Warmth:
- GPU cost: Very Low
- Memory pressure: Very Low
- Visual impact: Medium
- Resolution scaling: None/Low

Shadow Resolution:
- GPU cost: Medium/High
- Memory pressure: High
- Visual impact: Medium/High
- Resolution scaling: Medium

### 13.5 User-Facing Tooltips
Tooltips should explain:
- What the option does
- Visual impact
- Estimated GPU cost
- Estimated memory pressure
- Recommended preset or hardware class

---

## 14. Hardware Targets

### 14.1 Reference Development Hardware
- RTX 3070 Ti
- 1080p

This hardware is used as the main validation environment for development.

### 14.2 Lite Target Class
- GTX 1050 Ti / RX 570 class
- Reduced settings
- No guarantee for heavy modpacks or extreme render distances

### 14.3 Integrated Graphics
Integrated graphics are best-effort only for v1.0.0.

No formal support promise should be made without testing.

### 14.4 Performance Communication
More powerful GPUs should generally perform better, but performance depends on:
- Resolution
- Drivers
- Mods
- Render distance
- Shader settings
- Minecraft version
- Iris version
- World complexity

---

## 15. Architecture

### 15.1 Repository Structure

```plaintext
VanillaRTXLite/
├── shaders/
│   ├── final.fsh
│   ├── composite.vsh
│   ├── composite.fsh
│   ├── gbuffers_*.vsh
│   ├── gbuffers_*.fsh
│   ├── lib/
│   ├── include/
│   └── profiles/
├── docs/
│   ├── en/
│   └── es/
├── examples/
├── tools/
├── .github/
├── shader.properties
├── README.md
├── ROADMAP.md
├── CHANGELOG.md
├── AGENTS.md
├── LICENSE
├── LICENSE-DOCS
├── .gitignore
├── .gitattributes
└── CONTRIBUTING.md
```

### 15.2 Shader Architecture

Runtime shader entrypoints must live directly under `shaders/` so Iris can load them.

Examples:

```plaintext
shaders/final.fsh
shaders/composite.vsh
shaders/composite.fsh
shaders/gbuffers_terrain.vsh
shaders/gbuffers_terrain.fsh
shaders/gbuffers_water.vsh
shaders/gbuffers_water.fsh
```

These files should orchestrate rendering stages, not contain large amounts of reusable logic.

Do not place Iris runtime entrypoints inside `shaders/program/`.

#### `shaders/lib/`

Reusable rendering logic.

Required modules:

- materials
- material mapping
- lighting
- fresnel
- specular
- reflections
- SSR
- fog
- atmosphere
- tonemap
- color pipeline
- debug views

#### `shaders/include/`

Shared constants, uniforms, structs, and macros.

#### `shaders/profiles/`

Preset tuning for Lite, Balanced, Quality, and Experimental.

---

## 16. Render Pipeline

### 16.1 Gbuffer Stage
Captures:
- Base color
- Normals
- Depth
- Material mask/category data where possible

### 16.2 Composite Stage
Computes:
- Lighting
- Specular response
- Selective reflection logic
- SSR where allowed
- Fog
- Subtle atmospheric effects

### 16.3 Final Stage
Applies:
- Tonemapping
- Exposure
- Final restrained color grading
- Output consistency checks

---

## 17. Debug Views

Debug views are required from the first coding phase.

### 17.1 Minimum Debug Views
- Material ID/category
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

### 17.2 Purpose
Debug views exist to:
- Validate material classification
- Detect unwanted reflections
- Debug visual regressions
- Support YouTube development logs
- Support GitHub issue reports

---

## 18. Validation Strategy

### 18.1 Validation Scenes
The project must maintain fixed validation scenes:

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

### 18.2 Scene Documentation
Each scene must document:
- Objective
- Materials under review
- Expected behavior
- Forbidden behavior
- Preset tested
- Performance notes
- Screenshots if available

### 18.3 No-Regression Checklist
Every significant visual change must preserve:
- No reflections on matte materials
- No exaggerated bloom
- No oversaturation
- No cinematic drift
- No loss of Vanilla identity
- No unjustified global effect

---

## 19. Documentation Strategy

### 19.1 Language Policy
- English is canonical.
- Spanish is an official translation.
- Technical meaning must remain synchronized.

### 19.2 Required Documents
English:

```plaintext
docs/en/00_project_charter.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/06_performance_targets.md
docs/en/07_compatibility.md
docs/en/08_code_conventions.md
docs/en/09_git_workflow.md
docs/en/10_architecture_decisions.md
docs/en/11_known_risks.md
docs/en/12_release_strategy.md
docs/en/13_option_registry.md
docs/en/14_compatibility_matrix.md
docs/en/15_release_checklist.md
docs/en/16_codex_task_protocol.md
docs/en/17_visual_baseline_manifest.md
```

Spanish:

```plaintext
docs/es/00_carta_del_proyecto.md
docs/es/01_vision.md
docs/es/02_especificacion_tecnica.md
docs/es/03_matriz_de_materiales.md
docs/es/04_pipeline_de_render.md
docs/es/05_escenas_de_validacion.md
docs/es/06_objetivos_de_rendimiento.md
docs/es/07_compatibilidad.md
docs/es/08_convenciones_de_codigo.md
docs/es/09_flujo_git.md
docs/es/10_decisiones_de_arquitectura.md
docs/es/11_riesgos_conocidos.md
docs/es/12_estrategia_de_releases.md
docs/es/13_registro_de_opciones.md
docs/es/14_matriz_de_compatibilidad.md
docs/es/15_checklist_de_release.md
docs/es/16_protocolo_codex.md
docs/es/17_manifiesto_visual_base.md
```

---

## 20. Git Workflow

### 20.1 Branches
- `main`: stable/release-ready
- `dev`: active integration
- `feature/*`: feature work
- `docs/*`: documentation work
- `perf/*`: performance work
- `fix/*`: fixes

### 20.2 Commit Types
Use conventional-style commits:

- `docs`
- `feat`
- `fix`
- `refactor`
- `perf`
- `test`
- `chore`

Examples:

```plaintext
docs(readme): add bilingual project introduction
docs(roadmap): define Level 0 through v1.0.0
feat(shader): add material debug view
perf(ssr): reduce sample count for Lite preset
```

---

## 21. Codex Task Protocol

Every Codex task must include:

```markdown
# Codex Task

## Objective

## Files allowed to modify

## Files forbidden to modify

## Constraints

## Acceptance criteria

## Validation scenes

## Performance expectations

## What must not break

## Notes
```

### 21.1 Purpose
This prevents AI-generated drift and keeps generated code aligned with the shader philosophy.

---

## 22. Release Strategy

### 22.1 Roadmap Levels
Internal engineering progress:

- Level 0 — Foundation
- Level 1 — Baseline Visuals
- Level 2 — Material Core
- Level 3 — Selective Reflections
- Level 4 — Atmosphere
- Level 5 — Optimization and Release Prep

### 22.2 Maturity States
External product stability:

- Pre-alpha
- Alpha
- Beta
- Release Candidate
- Stable

### 22.3 Suggested Version Mapping

```plaintext
v0.1.0-prealpha — Foundation
v0.2.0-prealpha — Baseline Visuals
v0.3.0-prealpha — Material Core
v0.4.0-alpha    — Selective Reflections
v0.5.0-alpha    — Atmosphere
v0.8.0-beta     — Optimization and Release Prep
v1.0.0          — Stable Overworld Release
```

### 22.4 Public Release Policy
- Early releases may be GitHub-only.
- User-facing builds may be published once installable and documented.
- Modrinth publication should happen once the shader is usable enough for public users.

---

## 23. Update Policy

### 23.1 Built-in Updater
Not part of v1.0.0.

### 23.2 Reason
The shader pack should not promise update checks or downloads from inside shader settings.

### 23.3 Future Possibility
A companion updater or helper tool may be explored later.

---

## 24. Packaging Strategy

### 24.1 Goal
The shader pack should be distributable as a clean `.zip` package.

### 24.2 Future Packaging Scripts
Recommended:

```plaintext
tools/packaging/build_pack.ps1
tools/packaging/build_pack.sh
```

### 24.3 Packaging Rules
Release ZIPs should include:
- Required shader files
- Required metadata
- Required license notice
- Minimal user documentation if needed

Release ZIPs should exclude:
- Development notes
- Raw screenshots
- GitHub templates
- Local cache
- Editor settings
- Unreleased experimental files unless intentionally included

---

## 25. Licensing

### 25.1 Code and Scripts
Use MIT License.

### 25.2 Documentation and Curated Media
Use Creative Commons Attribution 4.0 International.

### 25.3 Reason
- MIT is simple and developer-friendly.
- CC BY 4.0 is more appropriate for documentation, diagrams, curated screenshots, and media.

---

## 26. Known Risks

### 26.1 Technical Risks
- Material classification may be limited by available pipeline data.
- SSR can fail or artifact when reflected information is off-screen.
- Visual appearance may vary by GPU driver and monitor calibration.
- Performance may vary significantly with mods and render distance.
- Bilingual documentation may drift if not maintained carefully.

### 26.2 Risk Policy
Do not hide limitations.

Document them, design around them, and avoid overpromising.

---

## 27. Success Criteria

The project succeeds when:

- It looks like Minecraft, but more refined.
- Materials behave coherently.
- Matte materials do not reflect.
- Lighting feels natural.
- Presets are useful and honest.
- Performance communication is not misleading.
- Documentation is strong enough for public review.
- Releases are understandable and reproducible.
- The project can be shown on GitHub, YouTube, and a professional portfolio.

---

## 28. Immediate Level 0 Deliverables

Level 0 must produce:

- Repository skeleton
- README.md
- ROADMAP.md
- CHANGELOG.md
- LICENSE
- LICENSE-DOCS
- .gitignore
- CONTRIBUTING.md
- GitHub issue templates
- Pull request template
- Documentation skeleton under `docs/en/` and `docs/es/`

Level 0 must not focus on complex shader effects yet.

---

## 29. First Coding Milestone After Level 0

After Level 0 is complete, Level 1 begins with:

- Minimal shader pipeline
- Basic output
- Color pipeline baseline
- Exposure and tonemap baseline
- Debug view switch
- No advanced SSR yet
- No god rays yet
- No complex atmosphere yet

---

## 30. Governance Rule

Whenever there is uncertainty, choose:

1. Vanilla identity over spectacle
2. Subtlety over intensity
3. Physical plausibility over visual gimmicks
4. Performance over unnecessary complexity
5. Documentation over improvisation
6. Honest limitations over inflated promises

---

# Spanish Working Summary

> This section is a Spanish summary for development discussions. The canonical technical version remains the English text above.

Vanilla RTX Lite será un shader Vanilla+ para Minecraft Java usando Iris/GLSL. El objetivo es lograr un estilo tipo RTX suave, con realismo sutil, materiales coherentes, reflejos selectivos y atmósfera limpia, sin convertir Minecraft en una experiencia cinematográfica exagerada.

La versión estable inicial `v1.0.0` se enfocará únicamente en el Overworld. Nether y End quedan para fases futuras.

El proyecto usará presets Lite, Balanced, Quality, Experimental y Custom. La personalización estará limitada para que el usuario pueda ajustar intensidad y rendimiento, pero no pueda romper la identidad visual del shader.

El modelo de rendimiento será honesto: se usarán cost tiers y tooltips, no promesas exactas de uso de VRAM o GPU.

El hardware de referencia será RTX 3070 Ti a 1080p. El objetivo de Lite será una clase aproximada GTX 1050 Ti / RX 570 con ajustes reducidos. Gráficos integrados serán best-effort para v1.0.0.

El proyecto será bilingüe, con documentación canónica en inglés y traducción oficial al español.

La etapa actual es Nivel 0 / Pre-alpha, enfocada en documentación, estructura del repositorio, licencias, roadmap, gitignore, templates y base profesional antes de implementar efectos complejos.

