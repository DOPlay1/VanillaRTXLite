# Vanilla RTX Lite — Especificación Maestra del Proyecto

> Especificación técnica y creativa principal del proyecto Vanilla RTX Lite.
>
> **Etapa actual del roadmap:** Nivel 0 — Fundación  
> **Madurez actual:** Pre-alpha  
> **Línea objetivo:** Minecraft Java 26.1.x  
> **Renderizador:** OpenGL / GLSL mediante Iris  
> **Línea futura:** versión orientada a Vulkan cuando el ecosistema sea viable  
> **Idioma canónico:** Inglés  
> **Traducción oficial:** Español

---

## 1. Definición del Proyecto

### 1.1 Nombre del proyecto

**Vanilla RTX Lite**

### 1.2 Descripción corta

Vanilla RTX Lite es un proyecto de shader para Minecraft Java enfocado en realismo sutil, respuesta selectiva por materiales, iluminación controlada y consistencia visual Vanilla+.

Busca ofrecer una experiencia inspirada en RTX sin path tracing, sin exageración cinematográfica y sin romper la identidad visual original de Minecraft.

### 1.3 Lema central

> Debe seguir viéndose como Minecraft — solo que mejor.

### 1.4 Tipo de proyecto

- Shader pack
- Proyecto de portafolio de ingeniería gráfica
- Proyecto con enfoque público/open-source
- Proyecto guiado por documentación
- Arquitectura preparada para herramientas futuras y posible línea orientada a Vulkan

---

## 2. Visión del Producto

### 2.1 Declaración de visión

Crear un shader que mejore la iluminación, atmósfera y respuesta material de Minecraft mientras preserva su encanto, legibilidad y lenguaje visual original.

### 2.2 Tesis de diseño

El realismo debe apoyar a Minecraft, no reemplazarlo.

El shader debe evitar el problema común de muchos shaders showcase: bloom extremo, sobresaturación, terreno tipo espejo, grading cinematográfico excesivo y ruido visual que se ve impactante en capturas pero inconsistente durante el juego real.

### 2.3 Identidad visual

El proyecto debe sentirse:

- Limpio
- Natural
- Sutil
- Físicamente plausible
- Respetuoso del estilo vanilla
- Ligero cuando se configura correctamente
- Coherente durante gameplay normal

El proyecto no debe sentirse:

- Cinematográfico pesado
- Sobreprocesado
- Sobresaturado
- Irreal
- Pensado solo para capturas
- Inconsistente entre materiales

---

## 3. Alcance

### 3.1 Alcance de v1.0.0

La primera versión estable estará enfocada únicamente en el **Overworld**.

Esto es intencional. El Overworld es el entorno principal de juego y debe alcanzar un estado completo, pulido y disfrutable antes de expandirse al Nether y al End.

### 3.2 Dentro del alcance para v1.0.0

- Iluminación del Overworld
- Exposición controlada
- Tonemapping neutral
- Pipeline de color sutil
- Clasificación de materiales
- Reflejos selectivos basados en Fresnel
- Respuesta material basada en roughness
- Comportamiento reflectivo del agua
- Comportamiento reflectivo del vidrio
- Respuesta del hielo
- Respuesta de cuarzo/materiales pulidos
- Respuesta especular de cobre y metales simulados
- Respuesta cristalina sutil para amatista
- Iluminación cálida de antorchas
- Niebla sutil
- Profundidad atmosférica sutil
- Debug views
- Presets y personalización acotada
- Cost tiers y tooltips
- Releases públicas en GitHub
- Documentación en inglés y español

### 3.3 Fuera del alcance para v1.0.0

- Soporte completo para Nether
- Soporte completo para End
- Path tracing
- Ray tracing real
- Stack de postprocesado cinematográfico
- Motion blur
- Depth of field pesado
- Chromatic aberration
- Lens dirt
- Viñeta fuerte
- Reflejos globales en materiales mate
- Updater interno dentro del shader pack
- Telemetría exacta de GPU o VRAM
- Soporte universal para gráficos integrados

---

## 4. Plataforma y Compatibilidad

### 4.1 Minecraft objetivo

- **Línea base de desarrollo:** Minecraft Java 26.1.x
- **Política de compatibilidad futura:** validación best-effort para líneas posteriores de 2026 como 26.2+ después de pruebas

El proyecto no debe prometer compatibilidad automática con versiones futuras antes de validarlas.

### 4.2 Iris objetivo

- **Mínimo soportado:** Iris 1.10.9+mc26.1
- **Versión recomendada:** última versión estable de Iris validada contra la línea de Minecraft soportada

### 4.3 Backend de render

Línea actual:

- OpenGL
- GLSL
- Pipeline de shaders mediante Iris

Línea futura:

- Implementación orientada a Vulkan cuando el ecosistema sea viable

### 4.4 Estrategia Vulkan

La futura línea orientada a Vulkan no debe reemplazar ni invalidar inmediatamente la línea OpenGL.

Razones:

- Muchos jugadores seguirán usando stacks de mods basados en OpenGL.
- La migración del ecosistema de mods puede ser gradual.
- OpenGL seguirá siendo relevante por compatibilidad.

La línea Vulkan debe reutilizar conceptos, documentación, lógica material, escenas de validación y filosofía visual, pero no necesariamente el mismo código.

---

## 5. Reglas Visuales No Negociables

### 5.1 Comportamiento material prohibido

Los siguientes materiales no deben recibir tratamiento reflectivo:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- La mayoría de materiales de terreno mate
- La mayoría de superficies orgánicas o rugosas

Si estos materiales reflejan el mundo como superficies pulidas, el shader falla su filosofía visual.

### 5.2 Comportamientos visuales prohibidos

El shader no debe usar:

- Bloom excesivo
- Saturación extrema
- Antorchas blancas como comportamiento por defecto
- Grading cinematográfico pesado
- Reflejos globales sin lógica material
- Terreno tipo espejo
- Efectos añadidos solo porque se ven llamativos en capturas

### 5.3 Comportamientos visuales requeridos

El shader debe preservar:

- Legibilidad vanilla
- Iluminación natural
- Exposición controlada
- Sombras suaves
- Iluminación cálida de antorchas
- Atmósfera sutil
- Lógica específica por material
- Conciencia de rendimiento

---

## 6. Filosofía de Render

### 6.1 Render basado en materiales

El shader debe pensar en materiales, no en trucos aislados por bloque.

La implementación puede requerir mapeo por bloque o textura, pero la decisión visual debe expresarse como categorías físicas de material.

### 6.2 Selectividad sobre cantidad

Pocos efectos bien controlados son mejores que muchos efectos globales.

### 6.3 Realismo sin espectáculo

El comportamiento realista es bienvenido solo cuando refuerza la experiencia de Minecraft.

### 6.4 Rendimiento como diseño

El rendimiento no es un detalle posterior. Es parte del diseño visual.

Un efecto que no pueda hacerse estable, coherente y razonablemente eficiente debe limitarse, degradarse o aplazarse.

---

## 7. Sistema de Materiales

### 7.1 Separación requerida

El proyecto debe separar estos conceptos:

- Reflection
- Specular
- Gloss
- Emissive response

### 7.2 Materiales reflectivos primarios

- Agua
- Vidrio
- Vidrio tintado
- Paneles de vidrio
- Hielo
- Superficies pulidas tipo cuarzo
- Calcita con respuesta extremadamente sutil

### 7.3 Materiales especulares secundarios

- Superficies tipo hierro
- Superficies tipo oro
- Cobre
- Cobre oxidado
- Amatista

### 7.4 Materiales opcionales futuros

- Terracota esmaltada
- Slime block
- Honey block

### 7.5 Materiales no reflectivos

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- La mayoría de bloques rugosos de terreno
- La mayoría de bloques mate de construcción

### 7.6 Campos requeridos por material

Cada entrada en la matriz de materiales debe definir:

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

### 7.7 Regla Fresnel

Fresnel es obligatorio para materiales reflectivos.

- La reflexión debe aumentar en ángulos rasantes.
- La reflexión debe disminuir en ángulos frontales.
- Fresnel debe estar limitado para evitar brillos exagerados en bordes.

### 7.8 Regla de roughness

Roughness controla la nitidez e intensidad de la respuesta reflectiva/especular.

- Roughness baja: respuesta más clara
- Roughness media: respuesta suavizada
- Roughness alta: respuesta principalmente difusa/mate

---

## 8. Sistema de Iluminación

### 8.1 Iluminación global

La iluminación debe ser natural, contenida y legible.

### 8.2 Exposición

La exposición debe evitar blancos quemados y sombras aplastadas como comportamiento por defecto.

### 8.3 Antorchas

La iluminación de antorchas debe ser:

- Cálida
- Similar al fuego
- Controlada
- No excesivamente roja
- No blanca neutra por defecto

La personalización puede ajustar la calidez dentro de un rango seguro. El usuario puede ajustar intensidad, pero no destruir la filosofía visual.

### 8.4 Luz solar

La luz solar debe tener direccionalidad clara y cambios sutiles de calidez durante amanecer y atardecer.

### 8.5 Sombras

Las sombras deben ser suaves y legibles.

### 8.6 God rays

Los god rays deben ser sutiles y situacionales.

No deben dominar la imagen.

### 8.7 Niebla

La niebla debe mejorar la profundidad sin ocultar información relevante para el gameplay.

---

## 9. Pipeline de Color

### 9.1 Propósito

El pipeline de color existe para preservar consistencia y evitar sobreprocesamiento.

### 9.2 Reglas

- Tonemapping neutral
- Saturación controlada
- Sin look teal/orange cinematográfico por defecto
- Sin curva de contraste agresiva
- Sin cambios de color exagerados causados por bloom

### 9.3 Grading final

El color grading final debe ser mínimo y respetuoso del estilo vanilla.

El shader no debe verse como si se hubiera aplicado un filtro de película de forma global.

---

## 10. Presets y Personalización

### 10.1 Presets oficiales

El proyecto soporta cinco modos de usuario:

1. Lite
2. Balanced
3. Quality
4. Experimental
5. Custom

### 10.2 Lite

Objetivo:

- Alcanzar GPUs dedicadas de menor potencia con menor costo.

Clase objetivo:

- GTX 1050 Ti / RX 570, con ajustes reducidos y expectativas realistas.

### 10.3 Balanced

Objetivo:

- Representar la identidad visual por defecto del proyecto.

Balanced debe ser la referencia visual principal.

### 10.4 Quality

Objetivo:

- Mejorar fidelidad sin cambiar la dirección artística.

Quality puede aumentar muestras o precisión, pero no cambiar la filosofía visual.

### 10.5 Experimental

Objetivo:

- Probar funciones que todavía no son estables.

Las funciones experimentales deben estar claramente marcadas y no definen la experiencia estable esperada.

### 10.6 Custom

Objetivo:

- Permitir que el usuario ajuste el shader dentro de límites seguros.

Las opciones Custom deben estar acotadas para proteger la identidad del proyecto.

### 10.7 Regla de personalización

El usuario puede cambiar intensidad, calidad y compromisos de rendimiento.

El usuario no debería recibir opciones que habiliten visuales contradictorias, como tierra reflectiva o antorchas blancas por defecto.

---

## 11. Registro de Opciones

### 11.1 Propósito

El registro de opciones evita el crecimiento descontrolado de configuraciones y le da una razón de existir a cada opción.

### 11.2 Metadata requerida

Cada opción visible al usuario debe definir:

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

### 11.3 Categorías iniciales de UI

La UI de configuración del shader debe organizarse en:

- Profiles
- Lighting
- Reflections
- Atmosphere
- Performance
- Advanced
- Debug

---

## 12. Modelo de Costo

### 12.1 Política de honestidad

El proyecto debe ser honesto sobre rendimiento.

No debe afirmar uso exacto de VRAM ni uso exacto de GPU desde dentro del shader pack.

### 12.2 Cost tiers

El costo de cara al usuario se comunica con niveles:

- Very Low
- Low
- Medium
- High
- Very High

### 12.3 Dimensiones de costo

Cada feature importante debe definir:

```yaml
gpu_cost_weight:
memory_cost_weight:
visual_impact:
resolution_scaling:
dependencies:
recommended_hardware:
```

### 12.4 Tooltips de usuario

Los tooltips deben explicar:

- Qué hace la opción
- Impacto visual
- Costo estimado de GPU
- Presión estimada de memoria
- Preset o clase de hardware recomendada

---

## 13. Hardware Objetivo

### 13.1 Hardware de referencia

- RTX 3070 Ti
- 1080p

Este hardware será el entorno principal de validación de desarrollo.

### 13.2 Clase objetivo Lite

- GTX 1050 Ti / RX 570
- Ajustes reducidos
- Sin garantía para modpacks pesados o distancias de render extremas

### 13.3 Gráficos integrados

Los gráficos integrados son best-effort para v1.0.0.

No se debe prometer soporte formal sin pruebas.

### 13.4 Comunicación de rendimiento

GPUs más potentes deberían rendir mejor en general, pero el rendimiento depende de:

- Resolución
- Drivers
- Mods
- Distancia de render
- Configuración del shader
- Versión de Minecraft
- Versión de Iris
- Complejidad del mundo

---

## 14. Arquitectura

### 14.1 Estructura del repositorio

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

### 14.2 Arquitectura shader

Los entrypoints reales del shader deben vivir directamente bajo `shaders/` para que Iris pueda cargarlos.

Ejemplos:

```plaintext
shaders/final.fsh
shaders/composite.vsh
shaders/composite.fsh
shaders/gbuffers_terrain.vsh
shaders/gbuffers_terrain.fsh
shaders/gbuffers_water.vsh
shaders/gbuffers_water.fsh
```

Estos archivos deben orquestar etapas de render, no contener grandes cantidades de lógica reutilizable.

No colocar entrypoints reales de Iris dentro de `shaders/program/`.

#### `shaders/lib/`

Lógica reutilizable de render.

Módulos requeridos:

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

Constantes, uniforms, structs y macros compartidos.

#### `shaders/profiles/`

Configuración de presets Lite, Balanced, Quality y Experimental.

---

## 15. Pipeline de Render

### 15.1 Etapa Gbuffer

Captura:

- Color base
- Normales
- Profundidad
- Información de máscara/categoría de material cuando sea posible

### 15.2 Etapa Composite

Calcula:

- Iluminación
- Respuesta especular
- Lógica de reflejos selectivos
- SSR donde esté permitido
- Niebla
- Efectos atmosféricos sutiles

### 15.3 Etapa Final

Aplica:

- Tonemapping
- Exposición
- Color grading final contenido
- Revisiones de consistencia de salida

---

## 16. Debug Views

Los debug views son obligatorios desde la primera fase de código.

### 16.1 Debug views mínimos

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

### 16.2 Propósito

Los debug views existen para:

- Validar clasificación de materiales
- Detectar reflejos no deseados
- Depurar regresiones visuales
- Apoyar videos de desarrollo
- Apoyar reportes de issues en GitHub

---

## 17. Estrategia de Validación

### 17.1 Escenas de validación

El proyecto debe mantener escenas fijas:

1. Exterior al mediodía
2. Amanecer
3. Atardecer
4. Noche con antorchas
5. Río o lago
6. Transición interior/exterior con vidrio
7. Cueva
8. Entorno de hielo o nieve
9. Cobre nuevo vs cobre oxidado
10. Lluvia

### 17.2 Documentación de escena

Cada escena debe documentar:

- Objetivo
- Materiales bajo revisión
- Comportamiento esperado
- Comportamiento prohibido
- Preset probado
- Notas de rendimiento
- Capturas si existen

### 17.3 Checklist de no regresión

Todo cambio visual significativo debe preservar:

- Sin reflejos en materiales mate
- Sin bloom exagerado
- Sin sobresaturación
- Sin deriva cinematográfica
- Sin pérdida de identidad vanilla
- Sin efectos globales injustificados

---

## 18. Estrategia de Documentación

### 18.1 Política de idioma

- Inglés es canónico.
- Español es traducción oficial.
- El significado técnico debe mantenerse sincronizado.

### 18.2 Documentos requeridos

La documentación se divide en:

```plaintext
docs/en/
docs/es/
```

El inglés se actualiza primero; el español debe mantenerse como traducción oficial.

---

## 19. Flujo Git

### 19.1 Ramas

- `main`: estable/release-ready
- `dev`: integración activa
- `feature/*`: trabajo de features
- `docs/*`: documentación
- `perf/*`: rendimiento
- `fix/*`: correcciones

### 19.2 Tipos de commit

Usar commits estilo convencional:

- `docs`
- `feat`
- `fix`
- `refactor`
- `perf`
- `test`
- `chore`

Ejemplos:

```plaintext
docs(readme): add bilingual project introduction
docs(roadmap): define Level 0 through v1.0.0
feat(shader): add material debug view
perf(ssr): reduce sample count for Lite preset
```

---

## 20. Protocolo para Codex

Toda tarea para Codex debe incluir:

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

El objetivo es evitar desviaciones generadas por IA y mantener el código alineado con la filosofía del shader.

---

## 21. Estrategia de Releases

### 21.1 Niveles del roadmap

Progreso interno de ingeniería:

- Nivel 0 — Fundación
- Nivel 1 — Visual Base
- Nivel 2 — Núcleo Material
- Nivel 3 — Reflejos Selectivos
- Nivel 4 — Atmósfera
- Nivel 5 — Optimización y Preparación de Release

### 21.2 Estados de madurez

Estabilidad pública del producto:

- Pre-alpha
- Alpha
- Beta
- Release Candidate
- Stable

### 21.3 Mapeo sugerido

```plaintext
v0.1.0-prealpha — Fundación
v0.2.0-prealpha — Visual Base
v0.3.0-prealpha — Núcleo Material
v0.4.0-alpha    — Reflejos Selectivos
v0.5.0-alpha    — Atmósfera
v0.8.0-beta     — Optimización y Preparación de Release
v1.0.0          — Release Estable del Overworld
```

---

## 22. Política de Actualizaciones

### 22.1 Updater interno

No forma parte de v1.0.0.

### 22.2 Razón

El shader pack no debe prometer checks de actualización o descargas desde la configuración del shader.

### 22.3 Posibilidad futura

Un companion updater o herramienta auxiliar puede explorarse más adelante.

---

## 23. Estrategia de Empaquetado

### 23.1 Objetivo

El shader pack debe poder distribuirse como un `.zip` limpio.

### 23.2 Scripts futuros

Recomendados:

```plaintext
tools/packaging/build_pack.ps1
tools/packaging/build_pack.sh
```

### 23.3 Reglas de empaquetado

El `.zip` de release debe incluir:

- Archivos necesarios del shader
- Metadata necesaria
- Aviso de licencia requerido
- Documentación mínima de usuario si aplica

Debe excluir:

- Notas internas de desarrollo
- Capturas en bruto
- Templates de GitHub
- Caché local
- Configuración personal de editor
- Archivos experimentales no liberados, salvo decisión explícita

---

## 24. Licenciamiento

### 24.1 Código y scripts

Licencia MIT.

### 24.2 Documentación y medios curados

Creative Commons Attribution 4.0 International.

### 24.3 Razón

- MIT es simple y amigable para desarrolladores.
- CC BY 4.0 es más apropiada para documentación, diagramas, capturas curadas y medios.

---

## 25. Riesgos Conocidos

### 25.1 Riesgos técnicos

- La clasificación de materiales puede estar limitada por los datos disponibles del pipeline.
- SSR puede fallar o mostrar artefactos cuando la información reflejada está fuera de pantalla.
- La apariencia visual puede variar según driver de GPU y calibración de monitor.
- El rendimiento puede variar significativamente con mods y distancia de render.
- La documentación bilingüe puede desincronizarse si no se mantiene con cuidado.

### 25.2 Política de riesgos

No ocultar limitaciones.

Documentarlas, diseñar alrededor de ellas y evitar prometer de más.

---

## 26. Criterios de Éxito

El proyecto tiene éxito cuando:

- Se ve como Minecraft, pero más refinado.
- Los materiales se comportan de forma coherente.
- Los materiales mate no reflejan.
- La iluminación se siente natural.
- Los presets son útiles y honestos.
- La comunicación de rendimiento no es engañosa.
- La documentación es suficientemente sólida para revisión pública.
- Los releases son entendibles y reproducibles.
- El proyecto puede mostrarse en GitHub, YouTube y portafolio profesional.

---

## 27. Entregables Inmediatos del Nivel 0

El Nivel 0 debe producir:

- Esqueleto del repositorio
- README.md
- ROADMAP.md
- CHANGELOG.md
- LICENSE
- LICENSE-DOCS
- .gitignore
- CONTRIBUTING.md
- Templates de issues en GitHub
- Template de pull request
- Esqueleto documental en `docs/en/` y `docs/es/`

El Nivel 0 no debe enfocarse todavía en efectos complejos de shader.

---

## 28. Primer Hito de Código Después del Nivel 0

Después de completar el Nivel 0, el Nivel 1 empieza con:

- Pipeline mínimo de shader
- Salida visual básica
- Pipeline de color base
- Exposición y tonemap base
- Selector de debug views
- Sin SSR avanzado todavía
- Sin god rays todavía
- Sin atmósfera compleja todavía

---

## 29. Regla de Gobierno

Cuando haya incertidumbre, elegir:

1. Identidad vanilla sobre espectáculo
2. Sutileza sobre intensidad
3. Plausibilidad física sobre trucos visuales
4. Rendimiento sobre complejidad innecesaria
5. Documentación sobre improvisación
6. Limitaciones honestas sobre promesas infladas
