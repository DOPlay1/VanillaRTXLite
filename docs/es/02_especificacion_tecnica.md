# Especificación Técnica — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Especificación técnica
- Idioma canónico: Inglés
- Renderizador objetivo: OpenGL / GLSL mediante Iris
- Alcance estable objetivo: Solo Overworld

---

## 1. Propósito

Este documento define la dirección técnica de Vanilla RTX Lite.

Describe la arquitectura de render prevista, la organización del shader, el sistema de materiales, los presets, el modelo de rendimiento, la infraestructura de debug y las restricciones técnicas que deben guiar la implementación.

El objetivo es que el desarrollo futuro del shader sea controlado, modular, trazable y alineado con la visión del proyecto.

---

## 2. Objetivos Técnicos

Vanilla RTX Lite debe implementarse como un shader pack modular para Iris/GLSL.

La implementación técnica debe soportar:

- Render basado en materiales
- Reflejos selectivos
- Respuesta basada en Fresnel
- Highlights basados en roughness
- Iluminación controlada
- Pipeline de color neutral
- Atmósfera sutil
- Debug views
- Control de calidad por presets
- Comunicación honesta del costo de rendimiento

El proyecto debe evitar archivos shader grandes y desestructurados donde se mezcle lógica no relacionada.

---

## 3. Backend de Render

### Backend actual

La línea actual de producción apunta a:

- Minecraft Java
- Pipeline de shaders de Iris
- OpenGL
- GLSL

### Backend futuro

Una línea futura orientada a Vulkan puede existir más adelante.

La línea Vulkan debe reutilizar:

- Filosofía visual
- Conceptos materiales
- Escenas de validación
- Principios del modelo de costo
- Estrategia documental

No debe asumirse que la línea Vulkan reutilizará directamente el código GLSL/OpenGL.

---

## 4. Compatibilidad Objetivo

### Minecraft

Línea base:

```plaintext
Minecraft Java 26.1.x
```

Compatibilidad futura:

```plaintext
Validación best-effort para líneas posteriores de 2026 como 26.2+
```

El proyecto no debe prometer soporte automático para versiones futuras de Minecraft antes de validarlas.

### Iris

Mínimo soportado:

```plaintext
Iris 1.10.9+mc26.1
```

Versión recomendada:

```plaintext
Última versión estable de Iris validada contra la línea de Minecraft soportada actualmente
```

---

## 5. Arquitectura del Shader en el Repositorio

El código del shader se organiza en entrypoints de runtime y carpetas compartidas de soporte:

```plaintext
shaders/
├── final.fsh
├── composite.vsh
├── composite.fsh
├── gbuffers_*.vsh
├── gbuffers_*.fsh
├── lib/
├── include/
└── profiles/
```

Los entrypoints reales del shader deben vivir directamente bajo `shaders/` para que Iris pueda cargarlos.

La lógica reutilizable de render pertenece a:

```plaintext
shaders/lib/
```

Las definiciones compartidas pertenecen a:

```plaintext
shaders/include/
```

La configuración de presets pertenece a:

```plaintext
shaders/profiles/
```

No colocar entrypoints reales de Iris dentro de `shaders/program/`.

### Entrypoints de runtime

Contiene archivos de entrada del shader usados por las etapas de render de Iris.

Archivos esperados:

```plaintext
shaders/gbuffers_terrain.vsh
shaders/gbuffers_terrain.fsh
shaders/gbuffers_water.vsh
shaders/gbuffers_water.fsh
shaders/composite.vsh
shaders/composite.fsh
shaders/final.fsh
```

Los archivos entrypoint de runtime deben mantenerse enfocados en orquestar etapas de render.

La lógica reutilizable grande no debe colocarse directamente en archivos entrypoint de runtime.

### `shaders/lib/`

Contiene lógica reutilizable de render.

Módulos planeados:

```plaintext
materials.glsl
material_mapping.glsl
lighting.glsl
fresnel.glsl
specular.glsl
reflections.glsl
ssr.glsl
fog.glsl
atmosphere.glsl
tonemap.glsl
color_pipeline.glsl
debug_views.glsl
```

### `shaders/include/`

Contiene definiciones compartidas.

Archivos planeados:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### `shaders/profiles/`

Contiene configuración específica por preset.

Archivos planeados:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

---

## 6. Vista General del Pipeline de Render

El pipeline previsto es:

```plaintext
Gbuffers → Composite → Final
```

### 6.1 Etapa Gbuffer

La etapa gbuffer debe capturar o preparar:

- Color base
- Normales
- Profundidad
- Categoría de material o datos de máscara cuando sea posible
- Información requerida por etapas posteriores de iluminación/reflejo

La etapa gbuffer no debe convertirse en un lugar donde se acumule toda la lógica visual.

### 6.2 Etapa Composite

La etapa composite debe manejar:

- Composición principal de iluminación
- Respuesta especular
- Lógica de reflejos selectivos
- SSR donde esté permitido
- Niebla
- Atmósfera sutil
- Salidas de debug para sistemas intermedios

Composite puede alojar gran parte de la integración visual, pero las funciones reutilizables deben mantenerse en `shaders/lib/`.

### 6.3 Etapa Final

La etapa final debe manejar:

- Tonemapping
- Ajuste de exposición
- Pipeline final de color
- Color grading mínimo y contenido
- Preparación de salida final

La etapa final no debe introducir un look cinematográfico pesado.

---

## 7. Requisitos del Sistema de Materiales

El sistema de materiales es una característica central del proyecto.

El shader debe separar:

- Reflection
- Specular response
- Gloss
- Emissive-like response

### 7.1 Categorías de Materiales

Categorías iniciales:

- Reflectivos primarios
- Especulares secundarios
- Pulidos / glossy
- Mate
- Similar a emisivo
- Opcionales futuros

### 7.2 Materiales Reflectivos

Candidatos reflectivos aprobados:

- Agua
- Vidrio
- Vidrio tintado
- Paneles de vidrio
- Hielo
- Superficies pulidas tipo cuarzo
- Calcita con respuesta extremadamente sutil

### 7.3 Materiales Especulares Secundarios

Materiales secundarios aprobados:

- Superficies tipo hierro
- Superficies tipo oro
- Cobre
- Cobre oxidado
- Amatista

### 7.4 Materiales Mate

Los siguientes materiales deben permanecer no reflectivos:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- Materiales rugosos de terreno
- La mayoría de bloques orgánicos o mate de construcción

### 7.5 Dependencia de la Matriz de Materiales

Toda implementación de comportamiento material debe alinearse con:

```plaintext
docs/en/03_material_matrix.md
docs/en/17_visual_baseline_manifest.md
```

---

## 8. Requisitos del Sistema de Reflejos

Los reflejos deben ser selectivos.

Deben depender de:

- Categoría de material
- Factor Fresnel
- Roughness
- Ángulo de vista
- Condición de iluminación
- Calidad del preset
- Ajuste de rendimiento

### 8.1 Reglas de Reflejo

El sistema de reflejos no debe:

- Reflejar terreno mate
- Aplicar reflejos globalmente
- Hacer brillante la madera o las hojas
- Hacer que tierra o piedra parezcan mojadas por defecto
- Convertir el agua en un espejo perfecto en todas las condiciones

### 8.2 Requisito Fresnel

Los materiales reflectivos deben usar comportamiento tipo Fresnel.

Comportamiento esperado:

- Más reflejo en ángulos rasantes
- Menos reflejo en ángulos frontales
- Intensidad limitada para evitar brillo exagerado en bordes

### 8.3 Requisito Roughness

Roughness debe influir en la claridad del reflejo y la nitidez del highlight.

Comportamiento esperado:

- Roughness baja: respuesta más clara
- Roughness media: respuesta suavizada
- Roughness alta: respuesta principalmente difusa

---

## 9. Requisitos del Sistema de Iluminación

La iluminación debe apoyar la dirección Vanilla+.

### 9.1 Iluminación Global

La iluminación global debe ser:

- Natural
- Balanceada
- Suave
- Legible
- No agresivamente dramática por defecto

### 9.2 Iluminación de Antorchas

La iluminación de antorchas debe ser:

- Cálida
- Similar al fuego
- Controlada
- No blanca por defecto
- No demasiado roja
- Ajustable solo dentro de límites seguros

### 9.3 Sombras

Las sombras deben ser suaves y legibles.

El proyecto debe evitar ajustes de sombra que hagan el gameplay innecesariamente difícil.

### 9.4 Comportamiento Día/Noche

Día y noche deben afectar la respuesta visual de manera natural.

El día puede mostrar más detalle en reflejos.

La noche debe mantenerse contenida salvo que la luz local justifique respuesta visible.

---

## 10. Requisitos del Pipeline de Color

El pipeline de color debe preservar la identidad Vanilla.

Debe incluir:

- Control de exposición
- Tonemapping neutral
- Corrección de color sutil
- Manejo de saturación contenido

El pipeline de color debe evitar:

- Grading cinematográfico pesado
- Sesgo fuerte teal/orange
- Sobresaturación
- Negros aplastados
- Blancos quemados
- Apariencia de filtro de película global

---

## 11. Requisitos de Atmósfera

La atmósfera debe mejorar la profundidad sin dominar la imagen.

Sistemas atmosféricos planeados:

- Niebla sutil
- Calidez de amanecer/atardecer
- God rays opcionales y sutiles
- Soporte de profundidad por distancia
- Ajustes conscientes de lluvia en etapas futuras

La atmósfera no debe:

- Ocultar el mundo
- Sobresaturar el cielo
- Hacer cuevas ilegibles
- Convertir cada escena en una captura cinematográfica

---

## 12. Requisitos de Debug Views

Los debug views son obligatorios desde la primera fase de código.

Debug views mínimos previstos:

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Los debug views deben apoyar validación y reporte de issues.

No son un detalle opcional; forman parte del flujo de ingeniería.

---

## 13. Requisitos del Sistema de Presets

Presets oficiales:

- Lite
- Balanced
- Quality
- Experimental
- Custom

### Lite

Prioriza menor costo y mayor accesibilidad.

### Balanced

Representa la apariencia por defecto prevista.

### Quality

Aumenta fidelidad sin cambiar la filosofía visual.

### Experimental

Permite pruebas controladas de features inestables o incompletas.

### Custom

Permite configuración acotada por el usuario.

Las opciones Custom no deben permitir romper reglas materiales no negociables.

---

## 14. Requisitos del Registro de Opciones

Toda opción visible al usuario debe documentarse en:

```plaintext
docs/en/13_option_registry.md
```

Cada opción importante debe definir:

- ID de opción
- Nombre visible
- Categoría
- Descripción
- Valores permitidos
- Valor por defecto
- Presets afectados
- Tier de costo GPU
- Tier de costo de memoria
- Impacto visual
- Dependencias
- Restricciones

Las opciones no deben añadirse casualmente.

Cada opción aumenta costo de pruebas, documentación y soporte.

---

## 15. Requisitos del Modelo de Costo

El proyecto usa cost tiers, no precisión falsa.

Cost tiers permitidos:

- Very Low
- Low
- Medium
- High
- Very High

El proyecto no debe afirmar:

- Uso exacto de GPU
- Uso exacto de VRAM
- Impacto exacto de rendimiento en todo hardware

El modelo de costo debe comunicar impacto relativo de forma honesta.

---

## 16. Hardware Objetivo

Hardware de referencia:

```plaintext
RTX 3070 Ti
1080p
```

Clase objetivo Lite:

```plaintext
GTX 1050 Ti / RX 570
Ajustes reducidos
Expectativas realistas
```

Gráficos integrados:

```plaintext
Best effort para v1.0.0
Sin promesa formal sin validación
```

---

## 17. Principios de Rendimiento

La implementación debe priorizar:

- Evitar cálculos innecesarios pesados por fragmento
- Usar máscaras antes de efectos costosos
- Mantener sample counts acotados
- Proveer fallbacks de menor costo
- Separar sistemas costosos por preset
- Documentar el costo claramente
- Evitar efectos globales que no necesitan ser globales

El rendimiento debe considerarse durante el diseño, no solo después de implementar.

---

## 18. Requisitos de Validación

Los cambios técnicos y visuales deben validarse contra escenas documentadas.

Escenas iniciales de validación:

- Exterior al mediodía
- Amanecer
- Atardecer
- Noche con antorchas
- Río o lago
- Transición interior/exterior con vidrio
- Cueva
- Entorno de hielo o nieve
- Cobre nuevo vs cobre oxidado
- Lluvia

Los cambios visuales deben respetar el checklist de no regresión.

---

## 19. Checklist de No Regresión

Todo cambio visual significativo debe preservar:

- Sin reflejos en materiales mate
- Sin bloom exagerado
- Sin sobresaturación
- Sin deriva cinematográfica
- Sin pérdida de identidad Vanilla
- Sin efectos globales injustificados
- La iluminación de antorchas sigue siendo creíble
- Los reflejos siguen siendo selectivos y basados en materiales

---

## 20. Requisitos de Empaquetado

El shader pack eventualmente debe poder distribuirse como un `.zip` limpio.

Scripts futuros de empaquetado pueden vivir en:

```plaintext
tools/packaging/
```

Un paquete de release debe incluir solo los archivos requeridos para usar el shader y los avisos requeridos.

Los archivos exclusivos de desarrollo no deben incluirse en paquetes de release salvo que esté documentado intencionalmente.

---

## 21. Política de Updater Interno

Un updater interno está fuera del alcance de v1.0.0.

Herramientas futuras de actualización pueden existir como companion tools, pero el shader pack no debe prometer checks de actualización o descargas desde la configuración del shader.

---

## 22. Requisitos para Desarrollo Asistido por IA

El trabajo asistido por IA debe seguir:

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
docs/en/master_project_specification.md
```

El código generado por IA debe respetar:

- Filosofía visual
- Reglas materiales
- Límites de presets
- Organización del código
- Principios de rendimiento
- Requisitos documentales

---

## 23. Criterios de Éxito Técnico

La dirección técnica tiene éxito cuando:

- El código shader permanece modular.
- La lógica material está centralizada y documentada.
- Los reflejos son selectivos y acotados.
- Los debug views apoyan la validación.
- Los presets son significativos y no simples etiquetas cosméticas.
- Los cost tiers se documentan honestamente.
- El pipeline puede evolucionar sin volverse caótico.
- Futuros colaboradores y herramientas de IA pueden entender las reglas del proyecto.

---

## 24. Regla de Gobierno Técnico

Cuando haya duda, elegir:

1. Código modular sobre archivos grandes desestructurados
2. Lógica material sobre efectos globales
3. Depurabilidad sobre comportamiento oculto
4. Opciones acotadas sobre personalización sin control
5. Diseño consciente del rendimiento sobre exceso visual
6. Restricciones documentadas sobre suposiciones
