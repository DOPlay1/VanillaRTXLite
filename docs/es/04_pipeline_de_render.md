# Pipeline de Render — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Especificación del pipeline de render
- Idioma canónico: Inglés
- Renderizador objetivo: OpenGL / GLSL mediante Iris
- Alcance estable objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define el pipeline de render previsto para Vanilla RTX Lite.

Explica las responsabilidades de cada etapa del shader, cómo deben fluir los datos de render dentro del proyecto y qué sistemas pertenecen a cada parte del pipeline.

El objetivo es mantener el shader modular, depurable y alineado con la dirección visual Vanilla+.

---

## 2. Vista General del Pipeline

El pipeline de alto nivel previsto es:

```plaintext
Gbuffers → Composite → Final
```

Cada etapa tiene una responsabilidad específica.

El proyecto debe evitar mezclar responsabilidades no relacionadas entre etapas.

---

## 3. Regla Central del Pipeline

Cada etapa de render debe hacer la menor cantidad de trabajo necesaria para cumplir su rol.

La lógica reutilizable debe vivir en:

```plaintext
shaders/lib/
```

Las definiciones compartidas deben vivir en:

```plaintext
shaders/include/
```

La configuración de presets debe vivir en:

```plaintext
shaders/profiles/
```

Los archivos de programa deben orquestar etapas de render, no convertirse en contenedores enormes de lógica no relacionada.

---

## 4. Etapa 1 — Gbuffers

### Propósito

La etapa gbuffer prepara la información base que necesitan las etapas posteriores.

Debe capturar, codificar o preparar datos de superficie.

### Responsabilidades esperadas

La etapa gbuffer puede manejar:

- Preparación de color base
- Preparación de normales
- Información de profundidad
- Categoría de material o datos de máscara cuando sea posible
- Información básica por superficie requerida por etapas de iluminación y reflejo

### Archivos

Archivos de programa esperados:

```plaintext
shaders/program/gbuffers_terrain.vsh
shaders/program/gbuffers_terrain.fsh
shaders/program/gbuffers_water.vsh
shaders/program/gbuffers_water.fsh
```

### Qué pertenece aquí

- Identificación de superficie
- Salidas básicas relacionadas con geometría
- Preparación de máscaras de material
- Datos requeridos por la etapa composite

### Qué no pertenece aquí

La etapa gbuffer no debe contener:

- Color grading final
- Tonemapping final
- Composición atmosférica pesada
- Lógica completa de SSR
- Bloom final o postprocesado final
- Hacks visuales extensos específicos por material

### Regla de diseño

Gbuffers debe preparar datos, no decidir toda la apariencia final.

---

## 5. Etapa 2 — Composite

### Propósito

La etapa composite integra los sistemas visuales principales.

Aquí se combinan la mayoría de sistemas visuales intermedios.

### Responsabilidades esperadas

La etapa composite puede manejar:

- Composición principal de iluminación
- Respuesta especular
- Selección de reflejos
- SSR donde esté permitido
- Respuesta basada en roughness
- Modulación basada en Fresnel
- Niebla
- Atmósfera sutil
- Salidas de debug intermedias

### Archivos

Archivos de programa esperados:

```plaintext
shaders/program/composite.vsh
shaders/program/composite.fsh
```

### Qué pertenece aquí

- Aplicar respuesta de iluminación basada en materiales
- Combinar contribución de reflejos
- Aplicar niebla y atmósfera antes del grading final
- Depurar sistemas intermedios de render
- Respetar niveles de calidad por preset

### Qué no pertenece aquí

La etapa composite no debe contener:

- Color grading final pesado
- Efectos globales sin límites
- Hacks materiales hardcodeados
- Definiciones de opciones de usuario
- Funciones reutilizables extensas que deberían estar en `shaders/lib/`

### Regla de diseño

Composite puede integrar sistemas visuales, pero la lógica reutilizable debe mantenerse modular.

---

## 6. Etapa 3 — Final

### Propósito

La etapa final prepara la imagen final para salida.

Debe mantenerse limpia, contenida y mínima.

### Responsabilidades esperadas

La etapa final puede manejar:

- Ajuste de exposición
- Tonemapping neutral
- Pipeline final de color
- Color grading mínimo y contenido
- Selección final de debug output si se necesita
- Preparación de salida final

### Archivos

Archivo de programa esperado:

```plaintext
shaders/program/final.fsh
```

Un archivo `final.vsh` puede añadirse si la implementación lo requiere.

### Qué pertenece aquí

- Tonemap final
- Manejo final de exposición
- Transformaciones finales de salida
- Últimos ajustes de consistencia

### Qué no pertenece aquí

La etapa final no debe introducir:

- Grading cinematográfico pesado
- Sesgo fuerte teal/orange
- Bloom excesivo
- Lógica de clasificación material
- SSR completo
- Sistemas grandes de iluminación
- Hacks visuales globales que anulen la lógica material

### Regla de diseño

Final debe pulir la imagen, no redefinir la identidad visual del shader.

---

## 7. Estructura de Librerías Compartidas

La lógica reutilizable de render debe colocarse en `shaders/lib/`.

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

### Principios de librerías

Las librerías shader deben ser:

- Enfocadas
- Pequeñas cuando sea posible
- Reutilizables
- Documentadas cuando el comportamiento no sea obvio
- Seguras para ajuste futuro por presets

Evitar archivos utilitarios enormes que se conviertan en depósitos de lógica mezclada.

---

## 8. Estructura de Includes Compartidos

Las definiciones compartidas deben colocarse en `shaders/include/`.

Archivos planeados:

```plaintext
constants.glsl
uniforms.glsl
structs.glsl
macros.glsl
```

### Principios de includes

Los includes deben contener:

- Constantes compartidas
- Macros comunes
- Structs compartidos
- Declaraciones de uniforms
- Definiciones compartidas entre etapas

Los includes no deben contener sistemas grandes de render.

---

## 9. Estructura de Profiles

La configuración específica por preset debe colocarse en `shaders/profiles/`.

Archivos planeados:

```plaintext
lite.glsl
balanced.glsl
quality.glsl
experimental.glsl
```

### Principios de profiles

Los profiles deben controlar:

- Niveles de calidad
- Feature toggles
- Sample counts
- Parámetros sensibles al costo
- Límites específicos por preset

Los profiles no deben duplicar sistemas enteros de render.

---

## 10. Filosofía de Flujo de Datos

El pipeline debe avanzar desde datos crudos de escena hacia presentación final.

Flujo conceptual sugerido:

```plaintext
Datos de superficie
→ Clasificación material
→ Respuesta de iluminación
→ Respuesta especular / reflejos
→ Atmósfera / niebla
→ Exposición / tonemap
→ Salida final
```

Cada etapa debe hacer que la siguiente sea más clara, no más caótica.

---

## 11. Flujo de Datos Materiales

Los datos de material deben prepararse tan temprano como sea práctico y consumirse de forma consistente.

Flujo material esperado:

```plaintext
Gbuffers:
  capturar o codificar categoría/máscara de material

Composite:
  usar datos de material para decisiones de iluminación, specular, reflejos, roughness y Fresnel

Final:
  evitar cambiar la identidad material
```

### Regla de datos materiales

La identidad material no debe reinterpretarse aleatoriamente en etapas posteriores.

Si una superficie es mate, las etapas posteriores no deben tratarla accidentalmente como reflectiva.

---

## 12. Flujo de Datos de Reflejos

La lógica de reflejos debe ser selectiva y ocurrir lo suficientemente tarde como para usar los datos de pantalla requeridos.

Flujo esperado de reflejos:

```plaintext
Gbuffers:
  proveer profundidad, normales y categoría material cuando sea posible

Composite:
  decidir si el reflejo está permitido
  aplicar Fresnel y roughness
  ejecutar SSR solo cuando el material y el preset lo permitan

Final:
  preservar el resultado reflejado sin convertirlo en brillo global
```

### Regla de reflejos

Los reflejos nunca deben aplicarse globalmente.

---

## 13. Flujo de Debug Views

Los debug views deben planearse desde el inicio.

Debug views mínimos previstos:

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

### Regla de debug views

Todo sistema visual importante debe exponer eventualmente suficiente información de debug para validarlo.

Los debug views forman parte del proceso de ingeniería, no son un detalle opcional.

---

## 14. Flujo de Presets

Los presets deben afectar costo y calidad sin cambiar la filosofía del proyecto.

### Lite

Comportamiento esperado:

- Menor sample count
- SSR reducido
- Atmósfera más simple
- Defaults de menor costo
- Misma identidad Vanilla+

### Balanced

Comportamiento esperado:

- Objetivo visual de referencia
- Apariencia por defecto prevista
- Costo controlado
- Identidad central completa

### Quality

Comportamiento esperado:

- Mayor fidelidad
- Efectos más suaves
- Mejor calidad de reflejos
- Misma dirección visual

### Experimental

Comportamiento esperado:

- Features inestables
- Comportamiento solo para pruebas
- Sin garantía de estabilidad visual

### Custom

Comportamiento esperado:

- Control acotado por el usuario
- Sin acceso a opciones que rompan identidad material
- Opciones documentadas en el registro de opciones

---

## 15. Flujo de Costo

El pipeline debe evitar trabajo costoso salvo que sea necesario.

Sistemas sensibles al costo:

- SSR
- Sombras de alta calidad
- Efectos volumétricos o god rays
- Blur de alto sample count
- Buffers intermedios de alta resolución
- Lógica material compleja por fragmento

### Regla de costo

Las features costosas deben estar controladas por:

- Preset
- Máscara de material
- Opción de usuario
- Necesidad visual
- Disponibilidad de fallback

---

## 16. Estrategia de Fallback

El shader debe degradar de forma elegante cuando sistemas costosos se desactivan o reducen.

Ejemplos:

### Fallback de SSR

Si SSR se desactiva o falla:

- Usar contribución reducida de reflejo
- Usar aproximación de cielo/entorno si está disponible
- Desvanecer el reflejo en lugar de producir artefactos duros

### Fallback de atmósfera

Si la calidad de atmósfera es baja:

- Usar niebla más simple
- Reducir sample count
- Evitar god rays ruidosos

### Fallback de material

Si la clasificación material es limitada:

- Preferir comportamiento mate sobre reflejo accidental
- Preferir respuesta sutil sobre respuesta fuerte incorrecta

---

## 17. Límites del Pipeline

### Gbuffers no debe

- Hacer grading final
- Ejecutar SSR
- Aplicar atmósfera completa
- Anular la identidad final de la imagen

### Composite no debe

- Contener toda la lógica reutilizable inline
- Aplicar efectos globales sin control
- Ignorar máscaras de material
- Romper restricciones de presets

### Final no debe

- Añadir identidad cinematográfica
- Cambiar comportamiento material
- Añadir bloom global fuerte
- Ocultar errores de etapas anteriores

---

## 18. Requisitos de Validación

El comportamiento del pipeline debe validarse con escenas que incluyan:

- Agua
- Vidrio
- Hielo
- Superficies tipo cuarzo
- Cobre nuevo y oxidado
- Amatista
- Tierra
- Piedra
- Madera
- Hojas
- Iluminación nocturna con antorchas
- Lluvia o niebla cuando esté soportado

Cada etapa del pipeline debe ser lo suficientemente depurable como para explicar problemas visuales.

---

## 19. Modos Comunes de Fallo

El pipeline debe diseñarse para evitar:

- Deriva de identidad material
- Superficies mate reflectivas
- Final pass sobrecargado
- Demasiada lógica en composite
- Presets convertidos en estilos inconsistentes
- Features costosas ejecutándose globalmente
- Debug views agregados demasiado tarde
- Color grading ocultando problemas materiales
- Artefactos de reflejo sin fallback

---

## 20. Resumen de Responsabilidades por Etapa

| Etapa | Responsable de | Debe evitar |
| --- | --- | --- |
| Gbuffers | Datos de superficie, máscaras, normales, profundidad | Apariencia final, SSR, color grading |
| Composite | Iluminación, reflejos, atmósfera, integración debug | Hacks globales, librerías inline gigantes |
| Final | Exposición, tonemap, salida final contenida | Override cinematográfico, cambios materiales |

---

## 21. Orden de Implementación

Orden recomendado para Nivel 1 y Nivel 2:

1. Carga mínima del shader
2. `shader.properties` básico
3. Salida visual básica
4. Pipeline inicial de color
5. Selector de debug views
6. Placeholder de máscara material
7. Placeholder de roughness
8. Helper de Fresnel
9. Helper de specular
10. Lógica de compuerta de reflejos

SSR avanzado no debe implementarse antes de que existan compuertas materiales y debug views.

---

## 22. Regla de Gobierno del Pipeline

Cuando haya incertidumbre, elegir:

1. Responsabilidad clara por etapa sobre conveniencia
2. Librerías reutilizables sobre lógica duplicada
3. Máscaras de material antes de efectos costosos
4. Visibilidad debug antes de visuales complejos
5. Fallbacks antes de features ambiciosas
6. Salida final contenida sobre overrides cinematográficos
