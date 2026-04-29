# Matriz de Materiales — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Especificación del sistema de materiales
- Idioma canónico: Inglés
- Alcance objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define la matriz inicial de materiales para Vanilla RTX Lite.

La matriz de materiales traduce la filosofía visual del proyecto en categorías prácticas de render y parámetros materiales.

El shader debe pensar en materiales, no en trucos aislados por bloque.

Este documento existe para prevenir comportamientos visuales inconsistentes como tierra reflectiva, hojas brillantes, piedra tipo espejo o highlights exagerados en superficies mate.

---

## 2. Regla Central

Un material solo debe reflejar si su identidad física permite reflejo.

Esta regla es no negociable.

El proyecto no debe aplicar reflejos de forma global.

---

## 3. Separación Conceptual

El sistema de materiales separa cuatro conceptos:

### Reflection

Respuesta del entorno.

Reflection solo está permitida en materiales aprobados como agua, vidrio, hielo y algunas superficies pulidas.

### Specular

Highlight direccional causado por interacción con la luz.

Un material puede tener specular sin convertirse en una superficie reflectiva.

### Gloss

Percepción de suavidad o pulido.

Gloss no significa reflejo tipo espejo.

### Emissive-like Response

Respuesta sutil interna o luminosa.

Solo se permite en materiales seleccionados como superficies tipo amatista o futuros materiales emisivos.

---

## 4. Escala de Valores

Salvo que se indique lo contrario, los valores se expresan como objetivos conceptuales normalizados de `0.0` a `1.0`.

Estos valores todavía no son constantes finales del shader.

Definen el comportamiento previsto y deben guiar la implementación futura.

| Rango de Valor | Significado |
| --- | --- |
| 0.00 | Ninguno |
| 0.05 - 0.15 | Muy sutil |
| 0.20 - 0.35 | Bajo |
| 0.40 - 0.60 | Medio |
| 0.65 - 0.80 | Alto |
| 0.85 - 1.00 | Muy alto |

---

## 5. Campos Requeridos por Material

Cada entrada de material debe definir:

| Campo | Propósito |
| --- | --- |
| `material_id` | Identificador interno estable |
| `display_name` | Nombre legible del material |
| `category` | Categoría de render |
| `reflectivity` | Fuerza base de reflejo |
| `roughness` | Rugosidad de la superficie |
| `fresnel_strength` | Influencia de reflejo dependiente del ángulo |
| `specular_strength` | Intensidad del highlight direccional |
| `ssr_strength` | Contribución de screen-space reflections |
| `blur_amount` | Suavidad del reflejo o highlight |
| `emissive_hint` | Indicio visual interno/emisivo |
| `day_response` | Respuesta esperada durante el día |
| `night_response` | Respuesta esperada durante la noche |
| `gpu_cost` | Tier estimado de costo GPU |
| `memory_cost` | Tier estimado de presión de memoria |
| `visual_impact` | Impacto visual esperado |
| `restrictions` | Reglas que no se deben romper |

---

## 6. Categorías de Materiales

### Reflectivos Primarios

Materiales que pueden recibir reflejos controlados del entorno.

Ejemplos:

- Agua
- Vidrio
- Hielo

### Especulares Secundarios

Materiales que pueden recibir highlights, pero no deben convertirse en espejos.

Ejemplos:

- Superficies tipo hierro
- Superficies tipo oro
- Cobre
- Cobre oxidado

### Pulidos / Glossy

Materiales que pueden mostrar una respuesta pulida muy sutil.

Ejemplos:

- Superficies pulidas tipo cuarzo
- Calcita, de forma extremadamente sutil

### Cristalinos

Materiales que pueden mostrar una respuesta sutil tipo cristal.

Ejemplos:

- Amatista

### Mate

Materiales que deben permanecer no reflectivos.

Ejemplos:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas

### Opcionales Futuros

Materiales que pueden explorarse más adelante, pero no son obligatorios para v1.0.0.

Ejemplos:

- Terracota esmaltada
- Slime block
- Honey block

---

## 7. Matriz Inicial de Materiales

### 7.1 Agua

| Campo | Valor |
| --- | --- |
| `material_id` | `water` |
| `display_name` | Agua |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.70 |
| `roughness` | 0.18 |
| `fresnel_strength` | 0.85 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.75 |
| `blur_amount` | 0.15 |
| `emissive_hint` | 0.00 |
| `day_response` | Reflejos visibles pero no espejo perfecto |
| `night_response` | Contenido salvo que haya luz de luna o luz local |
| `gpu_cost` | High |
| `memory_cost` | Medium |
| `visual_impact` | Very High |
| `restrictions` | No debe verse como espejo perfecto en todas las condiciones |

Notas:

El agua puede ser el material común más reflectivo, pero debe seguir siendo creíble y jugable.

El reflejo debe ser más fuerte en ángulos rasantes y suavizado por distorsión leve de ondas cuando se implemente.

---

### 7.2 Vidrio

| Campo | Valor |
| --- | --- |
| `material_id` | `glass` |
| `display_name` | Vidrio |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.45 |
| `roughness` | 0.08 |
| `fresnel_strength` | 0.65 |
| `specular_strength` | 0.35 |
| `ssr_strength` | 0.45 |
| `blur_amount` | 0.05 |
| `emissive_hint` | 0.00 |
| `day_response` | Reflejo sutil de borde y glare controlado |
| `night_response` | Reflejo bajo salvo que esté iluminado |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | High |
| `restrictions` | Debe preservar visibilidad a través del vidrio |

Notas:

El vidrio no debe convertirse en un espejo fuerte.

Su respuesta debe ser visible principalmente por ángulo, luz y comportamiento especular controlado.

---

### 7.3 Vidrio Tintado

| Campo | Valor |
| --- | --- |
| `material_id` | `tinted_glass` |
| `display_name` | Vidrio Tintado |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.35 |
| `roughness` | 0.10 |
| `fresnel_strength` | 0.60 |
| `specular_strength` | 0.30 |
| `ssr_strength` | 0.35 |
| `blur_amount` | 0.06 |
| `emissive_hint` | 0.00 |
| `day_response` | Reflejo controlado con sensación de transmisión más oscura |
| `night_response` | Reflejo muy contenido |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe opacar su identidad tintada |

Notas:

El vidrio tintado debe mantenerse más oscuro y apagado que el vidrio normal.

---

### 7.4 Paneles de Vidrio

| Campo | Valor |
| --- | --- |
| `material_id` | `glass_pane` |
| `display_name` | Panel de Vidrio |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.40 |
| `roughness` | 0.08 |
| `fresnel_strength` | 0.65 |
| `specular_strength` | 0.32 |
| `ssr_strength` | 0.40 |
| `blur_amount` | 0.05 |
| `emissive_hint` | 0.00 |
| `day_response` | Respuesta sutil en bordes |
| `night_response` | Respuesta baja salvo que esté iluminado |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe crear artefactos ruidosos en superficies delgadas |

Notas:

Los paneles de vidrio pueden requerir cuidado especial porque la geometría delgada puede producir artefactos visuales.

---

### 7.5 Hielo

| Campo | Valor |
| --- | --- |
| `material_id` | `ice` |
| `display_name` | Hielo |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.55 |
| `roughness` | 0.20 |
| `fresnel_strength` | 0.70 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.50 |
| `blur_amount` | 0.20 |
| `emissive_hint` | 0.00 |
| `day_response` | Reflejo medio con claridad suavizada |
| `night_response` | Sutil salvo que esté iluminado |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | High |
| `restrictions` | No debe comportarse como vidrio limpio |

Notas:

El hielo puede reflejar más que el cuarzo, pero debe mantenerse más suave y ligeramente desenfocado.

---

### 7.6 Hielo Compacto / Hielo Azul

| Campo | Valor |
| --- | --- |
| `material_id` | `packed_ice_blue_ice` |
| `display_name` | Hielo Compacto / Hielo Azul |
| `category` | Reflectivo Primario |
| `reflectivity` | 0.45 |
| `roughness` | 0.28 |
| `fresnel_strength` | 0.60 |
| `specular_strength` | 0.35 |
| `ssr_strength` | 0.35 |
| `blur_amount` | 0.25 |
| `emissive_hint` | 0.00 |
| `day_response` | Más suave y menos claro que el hielo regular |
| `night_response` | Muy sutil |
| `gpu_cost` | Medium |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | Debe sentirse helado, no como vidrio |

Notas:

El hielo compacto y el hielo azul deben sentirse pulidos, pero no como vidrio transparente.

---

### 7.7 Superficies Pulidas Tipo Cuarzo

| Campo | Valor |
| --- | --- |
| `material_id` | `quartz_polished` |
| `display_name` | Superficie Pulida Tipo Cuarzo |
| `category` | Pulido / Glossy |
| `reflectivity` | 0.18 |
| `roughness` | 0.32 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.25 |
| `ssr_strength` | 0.10 |
| `blur_amount` | 0.35 |
| `emissive_hint` | 0.00 |
| `day_response` | Respuesta pulida muy sutil |
| `night_response` | Respuesta mínima |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe convertirse en espejo |

Notas:

El cuarzo debe sentirse ligeramente pulido, no reflectivo como vidrio.

---

### 7.8 Calcita

| Campo | Valor |
| --- | --- |
| `material_id` | `calcite` |
| `display_name` | Calcita |
| `category` | Pulido / Glossy |
| `reflectivity` | 0.08 |
| `roughness` | 0.48 |
| `fresnel_strength` | 0.18 |
| `specular_strength` | 0.12 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.45 |
| `emissive_hint` | 0.00 |
| `day_response` | Casi mate con leve respuesta a la luz |
| `night_response` | Mínima |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Low |
| `restrictions` | Debe permanecer casi mate |

Notas:

La calcita es casi mate. Su respuesta debe ser extremadamente sutil.

---

### 7.9 Superficies Tipo Hierro

| Campo | Valor |
| --- | --- |
| `material_id` | `iron_like` |
| `display_name` | Superficie Tipo Hierro |
| `category` | Especular Secundario |
| `reflectivity` | 0.15 |
| `roughness` | 0.35 |
| `fresnel_strength` | 0.30 |
| `specular_strength` | 0.45 |
| `ssr_strength` | 0.10 |
| `blur_amount` | 0.30 |
| `emissive_hint` | 0.00 |
| `day_response` | Highlight visible, reflejo controlado |
| `night_response` | Dependiente de luz local |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe comportarse como espejo |

Notas:

Los materiales tipo hierro deben tener más specular que reflejo.

---

### 7.10 Superficies Tipo Oro

| Campo | Valor |
| --- | --- |
| `material_id` | `gold_like` |
| `display_name` | Superficie Tipo Oro |
| `category` | Especular Secundario |
| `reflectivity` | 0.22 |
| `roughness` | 0.28 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.55 |
| `ssr_strength` | 0.12 |
| `blur_amount` | 0.25 |
| `emissive_hint` | 0.00 |
| `day_response` | Highlight cálido, reflejo sutil |
| `night_response` | Dependiente de luz local |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe volverse demasiado saturado ni espejo |

Notas:

Las superficies tipo oro pueden tener respuesta especular cálida, pero el shader debe evitar un brillo dorado exagerado.

---

### 7.11 Cobre Nuevo

| Campo | Valor |
| --- | --- |
| `material_id` | `copper_fresh` |
| `display_name` | Cobre Nuevo |
| `category` | Especular Secundario |
| `reflectivity` | 0.24 |
| `roughness` | 0.32 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.50 |
| `ssr_strength` | 0.12 |
| `blur_amount` | 0.28 |
| `emissive_hint` | 0.00 |
| `day_response` | Respuesta especular cálida |
| `night_response` | Dependiente de luz local |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe parecer oro pulido |

Notas:

El cobre nuevo debe responder más que el cobre oxidado.

---

### 7.12 Cobre Oxidado

| Campo | Valor |
| --- | --- |
| `material_id` | `copper_oxidized` |
| `display_name` | Cobre Oxidado |
| `category` | Especular Secundario |
| `reflectivity` | 0.08 |
| `roughness` | 0.55 |
| `fresnel_strength` | 0.15 |
| `specular_strength` | 0.18 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.45 |
| `emissive_hint` | 0.00 |
| `day_response` | Principalmente mate con leve respuesta |
| `night_response` | Mínima |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Low |
| `restrictions` | Debe ser menos reflectivo que el cobre nuevo |

Notas:

La oxidación reduce la reflectividad visual y la fuerza especular.

---

### 7.13 Amatista

| Campo | Valor |
| --- | --- |
| `material_id` | `amethyst` |
| `display_name` | Amatista |
| `category` | Cristalino |
| `reflectivity` | 0.16 |
| `roughness` | 0.22 |
| `fresnel_strength` | 0.35 |
| `specular_strength` | 0.40 |
| `ssr_strength` | 0.05 |
| `blur_amount` | 0.18 |
| `emissive_hint` | 0.10 |
| `day_response` | Highlight sutil tipo cristal |
| `night_response` | Indicio interno muy sutil si hay luz local |
| `gpu_cost` | Low |
| `memory_cost` | Low |
| `visual_impact` | Medium |
| `restrictions` | No debe brillar fuertemente ni parecer mágico por defecto |

Notas:

La amatista puede tener una respuesta cristalina sutil, pero no un brillo fantástico.

---

### 7.14 Terreno Mate

| Campo | Valor |
| --- | --- |
| `material_id` | `matte_terrain` |
| `display_name` | Terreno Mate |
| `category` | Mate |
| `reflectivity` | 0.00 |
| `roughness` | 0.85 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.00 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Solo difuso |
| `night_response` | Solo difuso |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Nunca debe reflejar |

Aplica a:

- Tierra
- Laterales del bloque de pasto
- Tierra gruesa
- Podzol
- Lodo cuando no sea tratado como material húmedo opcional futuro
- La mayoría de bloques tipo suelo

Notas:

Esta categoría existe para proteger el terreno de volverse brillante.

---

### 7.15 Materiales Mate Tipo Piedra

| Campo | Valor |
| --- | --- |
| `material_id` | `stone_matte` |
| `display_name` | Materiales Mate Tipo Piedra |
| `category` | Mate |
| `reflectivity` | 0.00 |
| `roughness` | 0.78 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.02 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Difuso con respuesta mínima a la luz |
| `night_response` | Solo difuso |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | No debe verse mojado ni pulido por defecto |

Aplica a:

- Piedra
- Adoquín
- Deepslate
- Andesita
- Diorita
- Granito
- Toba
- La mayoría de bloques de piedra rugosa

Notas:

La piedra puede tener respuesta difusa a la luz, pero no reflejo.

---

### 7.16 Madera

| Campo | Valor |
| --- | --- |
| `material_id` | `wood_matte` |
| `display_name` | Madera |
| `category` | Mate |
| `reflectivity` | 0.00 |
| `roughness` | 0.70 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.03 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Difuso con ligera calidez de iluminación |
| `night_response` | Solo difuso |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | No debe volverse glossy por defecto |

Aplica a:

- Troncos
- Tablones
- Troncos pelados
- Escaleras de madera
- Losas de madera
- Vallas
- Puertas y trampillas salvo que se definan casos especiales futuros

Notas:

La madera debe mantenerse natural y rugosa.

---

### 7.17 Hojas y Follaje

| Campo | Valor |
| --- | --- |
| `material_id` | `foliage_matte` |
| `display_name` | Hojas y Follaje |
| `category` | Mate |
| `reflectivity` | 0.00 |
| `roughness` | 0.80 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.02 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Difuso y suave |
| `night_response` | Solo difuso |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | No debe verse mojado ni plástico por defecto |

Notas:

Las hojas no deben volverse brillantes salvo que un sistema futuro de lluvia se diseñe y documente explícitamente.

---

### 7.18 Arena y Grava

| Campo | Valor |
| --- | --- |
| `material_id` | `sand_gravel_matte` |
| `display_name` | Arena y Grava |
| `category` | Mate |
| `reflectivity` | 0.00 |
| `roughness` | 0.88 |
| `fresnel_strength` | 0.00 |
| `specular_strength` | 0.00 |
| `ssr_strength` | 0.00 |
| `blur_amount` | 0.00 |
| `emissive_hint` | 0.00 |
| `day_response` | Solo difuso |
| `night_response` | Solo difuso |
| `gpu_cost` | Very Low |
| `memory_cost` | Very Low |
| `visual_impact` | Foundational |
| `restrictions` | Nunca debe reflejar |

Notas:

Arena y grava deben permanecer secas y difusas salvo que una lógica futura de bioma/clima defina lo contrario.

---

## 8. Materiales Opcionales Futuros

Estos materiales pueden explorarse después de que el sistema material central del Overworld sea estable.

No son obligatorios para v1.0.0.

### Terracota Esmaltada

Comportamiento potencial:

- Gloss leve
- Sin reflejo tipo espejo
- Respuesta especular baja

Riesgo:

- Puede verse demasiado artificial si se exagera

### Slime Block

Comportamiento potencial:

- Superficie con apariencia húmeda
- Respuesta especular suave
- Posible sensación translúcida

Riesgo:

- Puede volverse visualmente ruidoso o demasiado plástico

### Honey Block

Comportamiento potencial:

- Respuesta translúcida suave
- Reflejo bajo
- Preservación de color cálido

Riesgo:

- Puede volverse demasiado brillante o saturado

### Respuesta de Clima Húmedo

Comportamiento potencial:

- La lluvia puede modificar ligeramente roughness u oscurecimiento superficial

Riesgo:

- No debe hacer que todos los bloques reflejen
- No debe violar la identidad de materiales mate

---

## 9. Notas de Implementación

Los valores de este documento no son constantes finales del shader.

Son objetivos de guía.

La implementación final puede ajustar valores después de:

- Pruebas visuales
- Pruebas de rendimiento
- Revisión de escenas de validación
- Ajuste de presets
- Restricciones del mapeo de materiales

Cualquier desviación importante debe documentarse en el archivo de decisiones de arquitectura.

---

## 10. Requisitos de Validación

El comportamiento material debe validarse en escenas que incluyan:

- Agua durante el día
- Agua al atardecer
- Vidrio en transición interior/exterior
- Entorno de hielo/nieve
- Construcciones tipo cuarzo
- Cobre nuevo vs cobre oxidado
- Amatista en cueva o baja luz
- Tierra/piedra/madera/hojas bajo luz fuerte
- Escena de lluvia cuando se introduzcan sistemas climáticos

---

## 11. Reglas de No Regresión

El sistema de materiales siempre debe preservar:

- La tierra no refleja
- La piedra no refleja
- La madera no se vuelve glossy
- Las hojas no se ven mojadas por defecto
- Arena y grava permanecen difusas
- El agua es reflectiva pero no espejo perfecto
- El vidrio refleja de forma sutil mientras conserva visibilidad
- Los metales tienen highlights sin convertirse en espejos
- La oxidación del cobre reduce visiblemente la respuesta material
- La amatista permanece sutil

---

## 12. Regla de Gobierno Material

Cuando haya incertidumbre, elegir:

1. Mate sobre gloss accidental
2. Highlight sutil sobre reflejo tipo espejo
3. Identidad material sobre espectáculo visual
4. Roughness sobre nitidez
5. Fresnel acotado sobre bordes brillantes
6. Validación sobre suposición