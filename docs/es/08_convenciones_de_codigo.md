# Convenciones de Código — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Estilo de código y convenciones de implementación
- Idioma canónico: Inglés
- Renderizador objetivo: OpenGL / GLSL mediante Iris

---

## 1. Propósito

Este documento define las convenciones de código para Vanilla RTX Lite.

El objetivo es mantener el código shader legible, modular, mantenible y alineado con la filosofía Vanilla+ del proyecto.

Estas convenciones aplican al código GLSL del shader, archivos de configuración del shader, scripts auxiliares, ejemplos de código relacionados con documentación y contribuciones generadas con IA.

---

## 2. Filosofía Central de Código

El código shader debe ser entendible antes que ingenioso.

El proyecto prioriza:

- Legibilidad
- Modularidad
- Comportamiento predecible
- Conciencia de rendimiento
- Depurabilidad
- Corrección material
- Límites claros entre presets

Evitar trucos compactos de una sola línea cuando una función auxiliar clara sería más fácil de mantener.

---

## 3. Organización de Archivos

El código shader debe seguir la estructura del repositorio:

```plaintext
shaders/
├── program/
├── lib/
├── include/
└── profiles/
```

### `shaders/program/`

Contiene archivos de entrada por etapa.

Los archivos de programa deben orquestar etapas de render.

No deben convertirse en contenedores grandes de lógica reutilizable no relacionada.

### `shaders/lib/`

Contiene funciones reutilizables de render.

Ejemplos:

```plaintext
materials.glsl
lighting.glsl
fresnel.glsl
specular.glsl
reflections.glsl
fog.glsl
tonemap.glsl
debug_views.glsl
```

### `shaders/include/`

Contiene definiciones compartidas.

Ejemplos:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### `shaders/profiles/`

Contiene configuración específica por preset.

Ejemplos:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

---

## 4. Reglas para Archivos de Programa

Los archivos de programa deben ser cortos y enfocados.

Pueden contener:

- Manejo de entradas/salidas de etapa
- Llamadas a funciones reutilizables
- Composición específica de la etapa
- Enrutamiento de salida debug
- Lógica local mínima

Deben evitar:

- Funciones reutilizables grandes
- Hacks materiales hardcodeados
- Lógica de features sin control
- Bloques largos de código duplicado
- Valores de preset incrustados directamente en código de etapa

Si una lógica se reutiliza o es conceptualmente importante, debe moverse a `shaders/lib/`.

---

## 5. Reglas para Archivos de Librería

Los archivos de librería deben agrupar comportamientos relacionados.

Ejemplos recomendados:

### `materials.glsl`

Definiciones de categorías materiales y helpers de materiales.

### `material_mapping.glsl`

Mapeo desde datos disponibles del shader/bloques hacia categorías internas de material.

### `fresnel.glsl`

Helpers de Fresnel y funciones de respuesta angular acotada.

### `specular.glsl`

Helpers de respuesta especular.

### `reflections.glsl`

Compuertas de reflejo y composición de reflejos basada en materiales.

### `ssr.glsl`

Funciones de screen-space reflections y comportamiento fallback.

### `color_pipeline.glsl`

Helpers de exposición, tonemap y corrección de color contenida.

### `debug_views.glsl`

Enrutamiento de debug views y helpers de visualización.

Cada archivo de librería debe tener una razón clara para existir.

---

## 6. Reglas para Archivos Include

Los archivos include deben definir valores compartidos, no sistemas grandes.

Pueden contener:

- Constantes
- Declaraciones de uniforms
- Definiciones de structs
- Macros
- Enums compartidos o IDs enteros

Deben evitar:

- Funciones largas de render
- Implementaciones grandes de features
- Comportamiento específico de una etapa
- Ajustes específicos de presets

---

## 7. Convenciones de Nombres

### Archivos

Usar snake case en minúsculas:

```plaintext
material_mapping.glsl
color_pipeline.glsl
debug_views.glsl
```

### Funciones

Usar lower camel case:

```glsl
float computeFresnel(float cosTheta, float strength)
vec3 applyNeutralTonemap(vec3 color)
bool isReflectiveMaterial(int materialId)
```

### Constantes

Usar snake case en mayúsculas:

```glsl
const float EPSILON = 0.0001;
const int MATERIAL_WATER = 1;
const int DEBUG_REFLECTIVE_MASK = 2;
```

### Variables locales

Usar lower camel case:

```glsl
vec3 baseColor;
float roughness;
float fresnelFactor;
```

### IDs de materiales

Usar nombres claros:

```glsl
MATERIAL_WATER
MATERIAL_GLASS
MATERIAL_ICE
MATERIAL_WOOD_MATTE
MATERIAL_STONE_MATTE
```

Evitar nombres vagos como:

```glsl
MAT_1
THING_REFLECT
SURFACE_A
```

---

## 8. Reglas de Comentarios

Los comentarios deben explicar por qué, no solo qué.

Buen comentario:

```glsl
// Clamp Fresnel contribution to prevent exaggerated edge glow.
fresnel = clamp(fresnel, 0.0, maxFresnel);
```

Comentario débil:

```glsl
// Clamp value.
fresnel = clamp(fresnel, 0.0, maxFresnel);
```

Los comentarios son requeridos cuando:

- Un comportamiento protege una regla visual
- Un compromiso de rendimiento es intencional
- Existe un fallback para evitar artefactos
- Un valor está ajustado para contención Vanilla+
- Existe un workaround por limitaciones del pipeline

---

## 9. Reglas de Lógica Material

La lógica material debe centralizarse siempre que sea posible.

No dispersar reglas materiales en archivos no relacionados.

Patrón incorrecto:

```glsl
if (blockId == 1) {
    reflection = 0.4;
}
```

Patrón mejor:

```glsl
MaterialInfo material = getMaterialInfo(materialId);
reflection = computeMaterialReflection(material, viewData);
```

La implementación debe dificultar que los materiales mate reciban reflejos accidentalmente.

---

## 10. Reglas de Lógica de Reflejos

La lógica de reflejos siempre debe estar controlada por compuertas.

Antes de aplicar reflejo, verificar:

- Categoría de material
- Permiso reflectivo
- Roughness
- Factor Fresnel
- Calidad del preset
- Disponibilidad de la feature

Los reflejos no deben aplicarse globalmente.

Patrón conceptual:

```glsl
if (material.allowsReflection && profile.enableReflections) {
    reflection = computeReflection(material, viewData);
}
```

Nunca usar reflejo como efecto full-screen global sin lógica material.

---

## 11. Reglas de Fresnel

Los helpers de Fresnel deben estar acotados.

Fresnel debe:

- Aumentar la respuesta en ángulos rasantes
- Reducir la respuesta en ángulos frontales
- Evitar bordes brillantes exagerados
- Respetar fuerza específica por material
- Respetar calidad de preset si aplica

El proyecto debe evitar efectos Fresnel sin límite que hagan que toda superficie parezca glossy.

---

## 12. Reglas de Roughness

Roughness debe influir en:

- Claridad del reflejo
- Nitidez especular
- Cantidad de blur
- Intensidad de respuesta material

Roughness debe ayudar a preservar la identidad de materiales mate.

Una roughness alta generalmente debe reducir o eliminar la claridad reflectiva.

---

## 13. Reglas de Presets

Los valores de preset deben vivir en `shaders/profiles/`.

Los archivos de programa y librería deben consumir valores de preset, no definirlos casualmente.

Los presets deben controlar:

- Estado activado/desactivado de features
- Sample counts
- Multiplicadores de calidad
- Umbrales de fallback
- Límites sensibles al costo

Los presets no deben cambiar la filosofía visual central.

---

## 14. Reglas de Debug Views

Los debug views deben tratarse como parte del flujo de ingeniería.

El código de debug views debe ser:

- Centralizado
- Fácil de extender
- Nombrado claramente
- Seguro de activar
- Útil para escenas de validación

Debug views mínimos planeados:

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Los IDs de debug view deben ser constantes nombradas.

---

## 15. Reglas de Rendimiento

El rendimiento debe considerarse al escribir código.

Evitar:

- Efectos costosos en todos los materiales
- Bucles sin límite
- Sample counts altos sin control por preset
- Cálculos repetidos que pueden compartirse
- Trabajo full-screen cuando el trabajo controlado por material es posible
- Branches complejas sin propósito

Preferir:

- Máscaras de material antes de efectos costosos
- Early exits cuando aplique
- Compuertas de calidad por preset
- Fallbacks de menor costo
- Límites claros de sample count
- Reutilizar valores calculados cuando sea seguro

---

## 16. Reglas de Fallback

Los sistemas costosos o propensos a artefactos deben definir fallbacks.

Ejemplos:

### Fallback SSR

Si SSR falla o está desactivado:

- Desvanecer contribución de reflejo
- Usar aproximación de menor costo si está disponible
- Evitar artefactos duros

### Fallback de Material

Si la clasificación material es incierta:

- Preferir comportamiento mate
- Preferir respuesta sutil
- Evitar reflejo accidental

### Fallback de Atmósfera

Si la calidad de atmósfera es baja:

- Usar niebla más simple
- Reducir samples
- Evitar god rays ruidosos

---

## 17. Constantes y Números Mágicos

Evitar números mágicos sin explicación.

Incorrecto:

```glsl
color *= 1.37;
```

Mejor:

```glsl
const float TORCH_WARMTH_BALANCED = 1.37;
color *= TORCH_WARMTH_BALANCED;
```

Mejor aún:

```glsl
// Balanced preset warmth tuned to keep torches warm without becoming red-heavy.
color *= TORCH_WARMTH_BALANCED;
```

Los valores que afecten identidad visual deben tener nombre y documentación.

---

## 18. Tamaño de Funciones

Las funciones deben ser enfocadas.

Evitar funciones muy grandes que realicen trabajo no relacionado.

Una función normalmente debería hacer una tarea conceptual:

- calcular Fresnel
- clasificar material
- aplicar tonemap
- calcular specular
- seleccionar debug output
- aplicar niebla

Si una función se vuelve difícil de explicar en una frase, considerar dividirla.

---

## 19. Reglas de Branching

Las ramas condicionales son aceptables cuando protegen rendimiento o corrección.

Razones válidas para branches:

- Gating material
- Gating por preset
- Selección de debug output
- Fallback de feature
- Selección de nivel de calidad

Evitar branches que creen identidad visual inconsistente entre materiales similares.

---

## 20. Reglas de Opciones de Usuario

No añadir opciones visibles al usuario casualmente.

Toda opción visible al usuario debe documentarse en:

```plaintext
docs/en/13_option_registry.md
```

Una opción debe tener:

- Propósito claro
- Rango seguro
- Valor por defecto
- Interacción con presets
- Tier de costo
- Impacto visual
- Dependencias
- Restricciones

Las opciones no deben permitir que el usuario rompa reglas materiales no negociables.

---

## 21. Reglas para Código Generado por IA

El código generado por IA debe seguir las mismas reglas que el código escrito por humanos.

Antes de pedir a Codex u otra herramienta de IA modificar código, proporcionar:

- Objetivo
- Archivos permitidos para modificar
- Archivos prohibidos de modificar
- Restricciones
- Criterios de aceptación
- Qué no debe romperse

El código generado por IA debe revisarse para detectar:

- Violaciones de reglas materiales
- Efectos demasiado amplios
- Hacks hardcodeados
- Problemas de rendimiento
- Deriva documental
- Inconsistencias entre presets

---

## 22. Comentarios de Documentación

Cuando una función sea importante para la identidad visual, añadir un comentario corto de documentación.

Ejemplo:

```glsl
// Computes bounded Fresnel response for approved reflective materials.
// This function must not be used to enable reflection on matte surfaces.
float computeBoundedFresnel(float cosTheta, float strength, float maxValue) {
    ...
}
```

Los helpers importantes deben explicar sus restricciones.

---

## 23. Reglas de Prevención de Errores

El código base debe hacer que el comportamiento incorrecto sea más difícil de introducir.

Preferir patrones que prevengan:

- Materiales mate reflectivos
- Reflejos globales
- Bloom sin límite
- Color grading sin control
- Sistemas costosos ejecutándose globalmente
- Debug views rompiendo salida final
- Presets derivando hacia estilos artísticos diferentes

---

## 24. Regla de Código Seguro para Commit

Un cambio de código debe ser suficientemente pequeño para revisarse.

Evitar commits que mezclen:

- Lógica de reflejos
- Tonemapping
- Presets
- Documentación
- Debug views
- Refactors

salvo que el cambio esté intencionalmente estructurado y documentado.

Preferir commits pequeños y trazables.

---

## 25. Checklist de Revisión de Código

Antes de aceptar cambios de código, revisar:

- ¿Preserva identidad Vanilla?
- ¿Respeta reglas materiales?
- ¿Evita efectos globales sin gating?
- ¿Permanece modular?
- ¿Incluye fallback cuando se necesita?
- ¿Evita afirmaciones falsas de rendimiento?
- ¿Mantiene posibles los debug views?
- ¿Actualiza documentación si cambia comportamiento?

---

## 26. Regla de Gobierno de Código

Cuando haya incertidumbre, elegir:

1. Legibilidad sobre ingenio
2. Modularidad sobre conveniencia
3. Seguridad material sobre atajos visuales
4. Depurabilidad sobre comportamiento oculto
5. Costo acotado sobre defaults costosos
6. Documentación sobre suposiciones
