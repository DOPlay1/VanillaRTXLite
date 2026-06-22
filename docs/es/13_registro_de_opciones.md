# Registro de Opciones — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Registro de opciones del shader
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento define el registro de opciones para Vanilla RTX Lite.

El objetivo es que cada opción visible para el usuario sea intencional, documentada, acotada y alineada con la filosofía del proyecto.

Las opciones del shader no deben añadirse casualmente.

Cada opción aumenta:

- Costo de pruebas
- Costo de documentación
- Costo de soporte
- Complejidad de presets
- Riesgo de inconsistencia visual

---

## 2. Filosofía de Opciones

Las opciones deben dar control significativo al usuario sin permitir que rompa la identidad del shader.

Vanilla RTX Lite debe evitar personalización ilimitada que permita:

- Materiales mate reflectivos
- Bloom excesivo
- Sobresaturación
- Iluminación blanca de antorchas por defecto
- Grading cinematográfico pesado
- Combinaciones costosas sin advertencia

El proyecto debe preferir pocas opciones bien diseñadas sobre muchas configuraciones sin control.

---

## 3. Regla Central

Toda opción visible al usuario debe tener:

- Propósito claro
- Default seguro
- Rango acotado
- Tier de costo
- Descripción de impacto visual
- Lista de dependencias si aplica
- Lista de restricciones si aplica
- Comportamiento por preset

Si una opción no puede explicarse claramente, todavía no debe añadirse.

---

## 4. Metadata Requerida por Opción

Cada opción importante debería definir:

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

Cost tiers permitidos:

```plaintext
Very Low
Low
Medium
High
Very High
```

Los cost tiers son estimaciones relativas.

No son mediciones exactas de rendimiento.

---

## 6. Niveles de Impacto Visual

Niveles permitidos de impacto visual:

```plaintext
Low
Medium
High
Very High
```

El impacto visual describe qué tan notable es una opción al cambiarla.

No describe costo.

---

## 7. Niveles de Escalado por Resolución

Niveles permitidos de escalado por resolución:

```plaintext
None
Low
Medium
High
Very High
```

El escalado por resolución describe qué tanto una opción se vuelve más costosa en resoluciones altas.

---

## 8. Categorías de Opciones

Las categorías iniciales de opciones del shader son:

```plaintext
Profiles
Lighting
Reflections
Atmosphere
Performance
Advanced
Debug
```

Estas categorías deben mantenerse claras y fáciles de entender para el usuario.

---

## 9. Categoría Profiles

La categoría Profiles controla el preset global.

### OPT-PROFILE-001 — Shader Profile

```yaml
option_id: OPT-PROFILE-001
display_name: Shader Profile
category: Profiles
description: Selecciona el perfil global de calidad y features del shader.
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
  - Custom debe mantenerse acotado por las reglas del proyecto.
  - Experimental no debe definir la identidad visual estable.
notes: Balanced es la apariencia de referencia.
```

Tooltip para usuario:

```plaintext
Selecciona el perfil general del shader. Balanced es el default recomendado. Lite reduce efectos costosos, Quality mejora fidelidad, Experimental es para pruebas y Custom permite control manual acotado.
```

---

## 10. Categoría Lighting

Las opciones de Lighting controlan exposición, calidez de antorchas y respuesta general de luz.

### OPT-LIGHT-001 — Exposure Strength

```yaml
option_id: OPT-LIGHT-001
display_name: Exposure Strength
category: Lighting
description: Controla qué tan fuerte el shader adapta el brillo y preserva legibilidad.
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
  - Debe evitar luces quemadas.
  - Debe evitar sombras aplastadas.
notes: La exposición debe apoyar legibilidad durante gameplay.
```

Tooltip:

```plaintext
Controla la adaptación de brillo. Valores más altos pueden mejorar visibilidad, pero la exposición permanece acotada para evitar luces quemadas o sombras aplastadas.
```

---

### OPT-LIGHT-002 — Torch Warmth

```yaml
option_id: OPT-LIGHT-002
display_name: Torch Warmth
category: Lighting
description: Controla la identidad cálida de antorchas y luces locales similares al fuego.
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
  - La iluminación de antorchas no debe volverse blanca por defecto.
  - La iluminación de antorchas no debe volverse excesivamente roja.
  - Los valores deben mantenerse dentro de límites seguros Vanilla+.
notes: Default representa la identidad prevista del proyecto.
```

Tooltip:

```plaintext
Ajusta la calidez de antorchas dentro de límites seguros. Default mantiene antorchas cálidas y similares al fuego sin volverse demasiado rojas o blancas.
```

---

### OPT-LIGHT-003 — Torch Intensity

```yaml
option_id: OPT-LIGHT-003
display_name: Torch Intensity
category: Lighting
description: Controla la fuerza percibida de antorchas y luz local cálida.
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
  - No debe crear bloom excesivo.
  - No debe volver las cuevas ilegibles por sobrecontraste.
notes: La intensidad de antorchas debe preservar legibilidad durante gameplay.
```

Tooltip:

```plaintext
Ajusta el brillo local de antorchas. Valores más altos aumentan visibilidad, pero la intensidad permanece limitada para evitar brillo excesivo.
```

---

## 11. Categoría Reflections

Las opciones de Reflections controlan únicamente reflejos aprobados por material.

Las opciones de reflejo nunca deben activar reflejos globales en materiales mate.

### OPT-REFLECT-001 — Reflection Quality

```yaml
option_id: OPT-REFLECT-001
display_name: Reflection Quality
category: Reflections
description: Controla la calidad de reflejos aprobados por material.
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
  - Solo debe afectar materiales reflectivos aprobados.
  - No debe activar reflejos en materiales mate.
notes: Lite puede usar Off o Low dependiendo del rendimiento.
```

Tooltip:

```plaintext
Controla reflejos en materiales aprobados como agua, vidrio e hielo. Esto no activa reflejos en tierra, piedra, madera, hojas, arena o grava.
```

---

### OPT-REFLECT-002 — Water Reflection Strength

```yaml
option_id: OPT-REFLECT-002
display_name: Water Reflection Strength
category: Reflections
description: Controla la fuerza de reflejo únicamente para agua.
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
  - El agua no debe convertirse en espejo perfecto bajo todas las condiciones.
  - Fresnel y roughness deben mantenerse activos.
notes: Esta es una de las opciones de reflejo con mayor impacto visual.
```

Tooltip:

```plaintext
Ajusta reflejos de agua manteniéndolos controlados por Fresnel y roughness. El agua debe reflejar, pero no comportarse como espejo perfecto.
```

---

### OPT-REFLECT-003 — Glass Reflection Strength

```yaml
option_id: OPT-REFLECT-003
display_name: Glass Reflection Strength
category: Reflections
description: Controla la fuerza de reflejo para materiales tipo vidrio.
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
  - El vidrio debe permanecer legible y transparente.
  - El vidrio no debe convertirse en espejo fuerte.
notes: La respuesta del vidrio debe ser más sutil que la del agua.
```

Tooltip:

```plaintext
Ajusta reflejos sutiles del vidrio. Valores más altos aumentan respuesta en bordes, pero el vidrio permanece legible y no debe convertirse en espejo.
```

---

### OPT-REFLECT-004 — SSR Quality

```yaml
option_id: OPT-REFLECT-004
display_name: SSR Quality
category: Reflections
description: Controla la calidad de screen-space reflections donde SSR esté permitido.
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
  - Debe estar controlado por material.
  - Debe incluir comportamiento fallback.
  - No debe describirse como ray tracing real.
notes: SSR es costoso y propenso a artefactos.
```

Tooltip:

```plaintext
Controla la calidad de screen-space reflections. SSR puede mejorar reflejos, pero es costoso y puede mostrar artefactos cuando la información reflejada está fuera de pantalla.
```

---

## 12. Categoría Atmosphere

Las opciones de Atmosphere controlan niebla, profundidad sutil y futuros god rays.

### OPT-ATM-001 — Fog Strength

```yaml
option_id: OPT-ATM-001
display_name: Fog Strength
category: Atmosphere
description: Controla niebla atmosférica sutil y profundidad por distancia.
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
  - La niebla no debe ocultar información relevante para gameplay.
  - La niebla no debe volverse cinematográfica pesada por defecto.
notes: La niebla debe mejorar profundidad, no ocultar el mundo.
```

Tooltip:

```plaintext
Controla niebla sutil y profundidad por distancia. Valores más altos añaden atmósfera, pero la visibilidad sigue siendo prioridad.
```

---

### OPT-ATM-002 — God Rays

```yaml
option_id: OPT-ATM-002
display_name: God Rays
category: Atmosphere
description: Controla rayos de luz sutiles cuando las condiciones lo permiten.
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
  - Deben ser sutiles.
  - No deben dominar la imagen.
  - No deben activarse agresivamente en Lite.
notes: Los god rays son opcionales y deben mantenerse contenidos.
```

Tooltip:

```plaintext
Añade rayos de luz sutiles cuando las condiciones lo permiten. Este efecto es costoso y debe mantenerse contenido.
```

---

### OPT-ATM-003 — Rain Atmosphere

```yaml
option_id: OPT-ATM-003
display_name: Rain Atmosphere
category: Atmosphere
description: Controla ajustes atmosféricos sutiles durante lluvia.
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
  - No debe hacer que todos los materiales reflejen.
  - No debe ocultar el mundo.
notes: La atmósfera de lluvia está separada de la respuesta material de superficies húmedas.
```

Tooltip:

```plaintext
Ajusta la atmósfera durante lluvia. Esto no vuelve reflectiva cada superficie y debe preservar visibilidad.
```

---

## 13. Categoría Performance

Las opciones de Performance controlan sistemas sensibles al costo.

### OPT-PERF-001 — Reflection Resolution

```yaml
option_id: OPT-PERF-001
display_name: Reflection Resolution
category: Performance
description: Controla calidad o resolución interna de trabajo costoso de reflejos cuando aplique.
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
  - No debe afectar materiales no reflectivos.
  - Debe documentarse como costosa.
notes: Lite normalmente debería usar Low.
```

Tooltip:

```plaintext
Controla el costo de render de reflejos. Valores más altos pueden mejorar la calidad de reflejos, pero aumentan presión de GPU y memoria.
```

---

### OPT-PERF-002 — Atmosphere Quality

```yaml
option_id: OPT-PERF-002
display_name: Atmosphere Quality
category: Performance
description: Controla calidad de niebla, atmósfera y efectos relacionados.
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
  - Mayor calidad no debe crear visuales cinematográficos pesados.
notes: Quality controla suavidad y costo, no dirección artística.
```

Tooltip:

```plaintext
Controla calidad y costo de la atmósfera. Valores más altos pueden mejorar suavidad, pero no deben cambiar la dirección visual Vanilla+.
```

---

### OPT-PERF-003 — Shadow Quality

```yaml
option_id: OPT-PERF-003
display_name: Shadow Quality
category: Performance
description: Controla calidad de sombras si se implementa ajuste personalizado.
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
  - Las sombras deben permanecer legibles.
  - Las sombras no deben hacer el gameplay innecesariamente difícil.
notes: Esta opción depende de la implementación final del shader.
```

Tooltip:

```plaintext
Controla calidad de sombras. Valores más altos pueden mejorar suavidad o detalle, pero la legibilidad del gameplay sigue siendo prioridad.
```

---

## 14. Categoría Advanced

Las opciones Advanced deben ser limitadas.

Están pensadas para usuarios que entienden los compromisos.

### OPT-ADV-001 — Tonemap Style

```yaml
option_id: OPT-ADV-001
display_name: Tonemap Style
category: Advanced
description: Selecciona el comportamiento final de tonemap.
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
  - No debe introducir grading cinematográfico pesado.
  - Debe preservar identidad Vanilla.
notes: Neutral es el look por defecto del proyecto.
```

Tooltip:

```plaintext
Selecciona el comportamiento final de tonemapping. Neutral preserva la apariencia Vanilla+ prevista, mientras Soft puede reducir ligeramente el contraste.
```

---

### OPT-ADV-002 — Color Saturation

```yaml
option_id: OPT-ADV-002
display_name: Color Saturation
category: Advanced
description: Controla saturación final de color dentro de límites seguros.
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
  - No debe permitir sobresaturación.
  - No debe crear grading cinematográfico.
notes: La saturación debe mantenerse contenida.
```

Tooltip:

```plaintext
Ajusta la saturación final dentro de límites seguros. El shader evita color sobresaturado o look cinematográfico pesado por diseño.
```

---

## 15. Categoría Debug

Las opciones Debug forman parte del flujo de ingeniería.

Pueden estar ocultas o expuestas como avanzadas en builds públicas.

### OPT-DEBUG-001 — Debug View

```yaml
option_id: OPT-DEBUG-001
display_name: Debug View
category: Debug
description: Selecciona visualización interna de debug.
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
  - No debe afectar salida normal cuando está en Off.
  - Debe ser seguro activarlo durante validación.
notes: Requerido para desarrollo y reporte de issues.
```

Tooltip:

```plaintext
Muestra debug views internas del shader como categoría material, reflective mask, roughness, Fresnel, SSR o exposición. Se usa para validación y diagnóstico.
```

---

### VRTX_DEBUG_VIEW

| Campo | Valor |
| --- | --- |
| ID de opción | `VRTX_DEBUG_VIEW` |
| Categoría | Debug |
| Tipo | Ciclo entero |
| Valor por defecto | `0` |
| Valores | `0` Apagado, `1` Marcador de final pass, `2` Gradiente UV, `3` Categoría material, `4` Máscara reflectiva, `5` Rugosidad, `6` Factor Fresnel, `7` Peso de reflexión |
| Tier de costo | Low |
| Impacto visual | Solo depuración |
| Dependencias | Datos materiales de terreno y enrutamiento de debug en final pass |
| Estabilidad | Experimental |
| Visible al usuario | Sí |
| Restricciones | Debe permanecer apagado por defecto. No debe usarse como modo visual de gameplay. |

Propósito:

`VRTX_DEBUG_VIEW` expone el enrutamiento debug compartido de Nivel 1 a Nivel 3 mediante las opciones de shader de Iris.

Está pensado para validar el control del final pass, el enrutamiento de coordenadas UV de pantalla, las categorías materiales, el permiso de reflexión, la rugosidad base, la respuesta Fresnel acotada y el peso material combinado de reflexión.

Esta opción debe permanecer desactivada por defecto.

Los modos Categoría material, Máscara reflectiva, Rugosidad, Factor Fresnel y Peso de reflexión consumen el buffer material inicial de terreno. Peso de reflexión muestra el producto acotado del permiso material, la reflectividad canónica, la respuesta Fresnel y la atenuación por rugosidad; no muestrea ni activa reflejos visibles. El mapeo cubre intencionalmente solo un conjunto conservador de bloques vanilla. El terreno no mapeado y la geometría no soportada permanecen como desconocidos y usan fallbacks no reflectivos, totalmente rugosos y con Fresnel cero.

---

## 16. Opciones que No Deben Existir

El proyecto debe evitar opciones como:

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

Estas opciones entran en conflicto con la filosofía del proyecto.

---

## 17. Resumen de Defaults por Preset

Defaults iniciales sugeridos:

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

Estos defaults pueden cambiar después de implementación y validación.

---

## 18. Checklist de Revisión de Opciones

Antes de añadir una opción, preguntar:

1. ¿Esta opción responde a una necesidad real del usuario?
2. ¿Preserva la identidad Vanilla+?
3. ¿Puede documentarse claramente?
4. ¿Tiene límites seguros?
5. ¿Tiene tier de costo?
6. ¿Interactúa con presets de forma predecible?
7. ¿Requiere escenas de validación?
8. ¿Puede romper reglas materiales?
9. ¿Aumenta carga de soporte?
10. ¿Sería mejor como valor interno de preset en lugar de opción de usuario?

Si la respuesta no es clara, no exponer la opción todavía.

---

## 19. Regla de Gobierno de Opciones

Cuando haya incertidumbre, elegir:

1. Menos opciones significativas sobre muchas opciones débiles
2. Límites seguros sobre sliders ilimitados
3. Reglas materiales sobre libertad de usuario
4. Etiquetas honestas de costo sobre gasto oculto
5. Claridad de presets sobre caos de configuración
6. Identidad visual sobre configuraciones novedosas
