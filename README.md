# Vanilla RTX Lite

> A Vanilla+ RTX-like shader for Minecraft Java Edition using Iris/GLSL.

**Current status:** Pre-alpha — Level 1 baseline visuals completed  
**Current roadmap stage:** Level 1 — Baseline Visuals  
**Next roadmap stage:** Level 2 — Material Core  
**Suggested milestone:** v0.2.0-prealpha  
**Target Minecraft line:** 26.1.x  
**Rendering backend:** OpenGL / GLSL via Iris  
**v1.0.0 scope:** Overworld only  

---

## English

### What is Vanilla RTX Lite?

Vanilla RTX Lite is a Minecraft Java shader project focused on subtle realism, selective material response, restrained lighting, and clean atmospheric rendering.

The goal is not to make Minecraft look cinematic, overprocessed, or visually exaggerated. The goal is to make it feel like a more refined version of itself.

> It should still look like Minecraft — just better.

---

### Core Principles

- Vanilla identity first
- Material-based rendering decisions
- Selective reflections only
- Subtle lighting and atmosphere
- Honest performance communication
- Professional documentation and release process

---

### What makes it different?

Many shaders apply strong effects globally. Vanilla RTX Lite is built around material logic.

Dirt, stone, wood, leaves, sand, gravel, and other matte materials must not behave like reflective surfaces.

Water, glass, ice, quartz-like polished materials, copper, metals, and amethyst may receive controlled reflective, specular, or glossy responses depending on their material category.

---

### Current Scope

The first stable release targets the Overworld only.

Nether and End support are future milestones and will not be rushed into v1.0.0.

---

### Planned Presets

- Lite
- Balanced
- Quality
- Experimental
- Custom

The project will use cost tiers and tooltips instead of pretending to provide exact GPU or VRAM usage.

---

### Hardware Targets

Primary development reference:

- RTX 3070 Ti
- 1080p

Lite target class:

- GTX 1050 Ti / RX 570 class, with reduced settings and realistic expectations

Integrated graphics:

- Best effort only for v1.0.0

---

### Documentation

English is the canonical documentation language. Spanish is maintained as an official translation.

Documentation lives under:

```plaintext
docs/en/
docs/es/
```

Important starting documents:

```plaintext
docs/en/master_project_specification.md
docs/en/03_material_matrix.md
docs/en/13_option_registry.md
docs/en/17_visual_baseline_manifest.md
```

---

### Project Maturity

This project uses two progress systems:

1. Roadmap levels for internal engineering progress.
2. Release maturity labels for public stability.

Current stage:

```plaintext
Level 1 — Baseline Visuals
Maturity: Pre-alpha
Status: Completed, pending main merge/tag
Suggested milestone: v0.2.0-prealpha
```

Current mapping:

- Level 0 — Foundation: Pre-alpha
- Level 1 — Baseline Visuals: Pre-alpha
- Level 2 — Material Core: Pre-alpha
- Level 3 — Selective Reflections: Alpha
- Level 4 — Atmosphere: Alpha
- Level 5 — Optimization and Release Prep: Beta
- v1.0.0: Stable

---

### License

Shader code and scripts: MIT License  
Documentation and curated media: Creative Commons Attribution 4.0 International

---

## Español

### ¿Qué es Vanilla RTX Lite?

Vanilla RTX Lite es un proyecto de shader para Minecraft Java enfocado en realismo sutil, respuesta selectiva por materiales, iluminación controlada y atmósfera limpia.

El objetivo no es hacer que Minecraft se vea cinematográfico, sobreprocesado o visualmente exagerado. El objetivo es que se sienta como una versión más refinada de sí mismo.

> Debe seguir viéndose como Minecraft — solo que mejor.

---

### Principios principales

- Identidad vanilla primero
- Decisiones visuales basadas en materiales
- Reflejos selectivos únicamente
- Iluminación y atmósfera sutiles
- Comunicación honesta del rendimiento
- Documentación y releases con enfoque profesional

---

### ¿Qué lo hace diferente?

Muchos shaders aplican efectos fuertes de forma global. Vanilla RTX Lite se construye alrededor de lógica material.

Tierra, piedra, madera, hojas, arena, grava y otros materiales mate no deben comportarse como superficies reflectivas.

Agua, vidrio, hielo, materiales pulidos tipo cuarzo, cobre, metales y amatista pueden recibir respuestas reflectivas, especulares o brillantes de forma controlada según su categoría material.

---

### Alcance actual

La primera versión estable estará enfocada únicamente en el Overworld.

El Nether y el End serán hitos futuros y no se forzarán dentro de la versión 1.0.0.

---

### Presets planeados

- Lite
- Balanced
- Quality
- Experimental
- Custom

El proyecto usará niveles estimados de costo y tooltips, sin fingir que puede entregar uso exacto de GPU o VRAM.

---

### Hardware objetivo

Referencia principal de desarrollo:

- RTX 3070 Ti
- 1080p

Clase objetivo para Lite:

- GTX 1050 Ti / RX 570, con ajustes reducidos y expectativas realistas

Gráficos integrados:

- Soporte best effort para v1.0.0

---

### Documentación

El inglés será el idioma canónico de la documentación. El español se mantendrá como traducción oficial.

La documentación estará en:

```plaintext
docs/en/
docs/es/
```

Documentos importantes de arranque:

```plaintext
docs/en/master_project_specification.md
docs/en/03_material_matrix.md
docs/en/13_option_registry.md
docs/en/17_visual_baseline_manifest.md
```

---

### Madurez del proyecto

Este proyecto usa dos sistemas de progreso:

1. Niveles de roadmap para progreso interno de ingeniería.
2. Estados de madurez para estabilidad pública.

Etapa actual:

```plaintext
Nivel 1 — Visual base
Madurez: Pre-alpha
Estado: Completado, pendiente de merge a main/tag
Hito sugerido: v0.2.0-prealpha
```

Siguiente etapa:

```plaintext
Nivel 1 — Visual base
Madurez: Pre-alpha
Hito sugerido: v0.2.0-prealpha
```

Mapeo actual:

- Nivel 0 — Fundación: Pre-alpha
- Nivel 1 — Visual base: Pre-alpha
- Nivel 2 — Núcleo material: Pre-alpha
- Nivel 3 — Reflejos selectivos: Alpha
- Nivel 4 — Atmósfera: Alpha
- Nivel 5 — Optimización y preparación de release: Beta
- v1.0.0: Stable

Este repositorio se encuentra actualmente en un hito de documentación y fundación del proyecto. Todavía no es una release del shader lista para gameplay.

---

### Licencia

Código del shader y scripts: Licencia MIT  
Documentación y medios curados: Creative Commons Attribution 4.0 International
