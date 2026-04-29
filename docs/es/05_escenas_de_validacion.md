# Escenas de Validación — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Especificación de validación visual
- Idioma canónico: Inglés
- Alcance objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define las escenas de validación usadas para probar Vanilla RTX Lite.

Las escenas de validación son escenarios controlados de gameplay usados para evaluar iluminación, comportamiento material, reflejos, atmósfera, debug views y rendimiento.

El objetivo es evitar juzgar la calidad visual únicamente mediante capturas aleatorias o impresiones subjetivas.

Todo cambio en el shader debería evaluarse contra escenas repetibles siempre que sea posible.

---

## 2. Por qué Importan las Escenas de Validación

Vanilla RTX Lite depende de decisiones visuales sutiles.

Cambios pequeños en reflejos, exposición, niebla, iluminación de antorchas o roughness pueden romper accidentalmente la identidad Vanilla+.

Las escenas de validación ayudan a detectar:

- Materiales mate reflectivos
- Bloom excesivo
- Sobresaturación
- Deriva de color en antorchas
- Niebla que oculta el gameplay
- Vidrio demasiado parecido a espejo
- Agua demasiado reflectiva
- Cuevas ilegibles
- Regresiones de comportamiento material
- Inconsistencias entre presets

---

## 3. Filosofía de Validación

La validación debe ser práctica, repetible y honesta.

El objetivo no es hacer que cada escena se vea dramática.

El objetivo es confirmar que el shader se comporta correctamente en condiciones comunes de gameplay.

Una escena pasa la validación cuando:

- Los materiales se comportan según la matriz de materiales.
- La iluminación se mantiene legible.
- La identidad Vanilla permanece intacta.
- Los efectos costosos están controlados por presets.
- Los debug views explican el comportamiento.
- El resultado se ve bien en movimiento, no solo en capturas.

---

## 4. Escenas de Validación Requeridas

El conjunto inicial requerido incluye:

1. Exterior al mediodía
2. Amanecer
3. Atardecer
4. Noche con antorchas
5. Río o lago
6. Transición interior/exterior con vidrio
7. Cueva
8. Entorno de hielo o nieve
9. Cobre nuevo vs cobre oxidado
10. Escena de lluvia
11. Escena de amatista
12. Escena de estrés de materiales mate

Estas escenas apuntan al alcance Overworld v1.0.0.

---

## 5. Plantilla de Documentación de Escena

Cada escena de validación debería documentar eventualmente:

```plaintext
Nombre de escena:
Propósito:
Ubicación / seed / coordenadas:
Hora del día:
Clima:
Materiales bajo revisión:
Preset probado:
Comportamiento esperado:
Comportamiento prohibido:
Debug views a revisar:
Notas de rendimiento:
Capturas:
Problemas conocidos:
```

Si una escena todavía no puede reproducirse exactamente, documentar la configuración disponible más cercana.

---

## 6. Escena 01 — Exterior al Mediodía

### Propósito

Validar legibilidad general durante el día, exposición, balance de color, materiales mate y comportamiento del terreno.

### Condiciones

- Hora: Mediodía
- Clima: Despejado
- Bioma: Llanura, borde de bosque o bioma común del Overworld
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Pasto
- Tierra
- Piedra
- Madera
- Hojas
- Arena o grava si están disponibles
- Agua si es visible a distancia

### Comportamiento esperado

- La escena permanece brillante pero no sobreexpuesta.
- El pasto y el follaje se mantienen naturales.
- Tierra y piedra permanecen mate.
- La madera no se vuelve glossy.
- Las sombras permanecen legibles.
- Los colores se mantienen cerca de la identidad Vanilla.

### Comportamiento prohibido

- Terreno reflectivo
- Pasto sobresaturado
- Altas luces quemadas
- Contraste cinematográfico pesado
- Hojas con apariencia mojada o plástica
- Bloom excesivo

### Debug views a revisar

- Material ID/categoría
- Reflective mask
- Exposure/luminance

---

## 7. Escena 02 — Amanecer

### Propósito

Validar calidez de inicio del día, adaptación de exposición, transición del cielo y atmósfera sutil.

### Condiciones

- Hora: Amanecer
- Clima: Despejado
- Bioma: Área abierta con horizonte visible
- Presets: Balanced, Quality

### Materiales bajo revisión

- Terreno
- Agua si está disponible
- Vidrio si está cerca
- Madera y follaje

### Comportamiento esperado

- La calidez del amanecer es visible pero contenida.
- El cielo no se vuelve sobresaturado.
- El terreno permanece legible.
- El agua puede mostrar reflejo sutil dependiente del ángulo.
- Los materiales mate permanecen mate.

### Comportamiento prohibido

- Tinte naranja extremo
- Horizonte lavado
- Grading demasiado cinematográfico
- Tierra o pasto reflectivo
- Bloom dominando la imagen

### Debug views a revisar

- Exposure/luminance
- Reflective mask
- Fresnel factor donde haya agua o vidrio visible

---

## 8. Escena 03 — Atardecer

### Propósito

Validar iluminación cálida de bajo ángulo, comportamiento de reflejos, atmósfera y contención del color.

### Condiciones

- Hora: Atardecer
- Clima: Despejado
- Bioma: Horizonte abierto, río, lago o costa preferiblemente
- Presets: Balanced, Quality

### Materiales bajo revisión

- Agua
- Vidrio si está disponible
- Terreno
- Follaje
- Piedra o acantilados

### Comportamiento esperado

- El atardecer se siente cálido, pero no exagerado.
- El reflejo en agua es más visible en ángulos rasantes.
- Los materiales mate no se vuelven brillantes.
- La atmósfera añade profundidad sin volverse cinematográfica pesada.

### Comportamiento prohibido

- Tinte naranja/rojo fuerte sobre toda la escena
- Agua tipo espejo bajo todos los ángulos
- Terreno reflectivo
- God rays excesivos
- Pérdida de legibilidad durante gameplay

### Debug views a revisar

- Reflective mask
- Fresnel factor
- SSR contribution
- Exposure/luminance

---

## 9. Escena 04 — Noche con Antorchas

### Propósito

Validar calidez de antorchas, comportamiento de luz local, legibilidad interior/exterior y exposición nocturna.

### Condiciones

- Hora: Noche
- Clima: Despejado
- Configuración: Antorchas colocadas alrededor de madera, piedra, tierra y vidrio
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Madera iluminada por antorchas
- Piedra
- Tierra
- Vidrio
- Agua si está cerca
- Follaje si está cerca

### Comportamiento esperado

- La luz de antorcha se siente cálida y similar al fuego.
- La luz de antorcha no es blanca por defecto.
- La luz de antorcha no es excesivamente roja.
- Los materiales cercanos permanecen legibles.
- Los materiales mate no se vuelven glossy.
- Los reflejos aparecen solo donde las reglas materiales lo permiten.

### Comportamiento prohibido

- Iluminación blanca de antorchas
- Iluminación demasiado roja
- Bloom excesivo alrededor de antorchas
- Piedra o tierra con apariencia mojada
- Noche ilegiblemente oscura
- Vidrio convertido en espejo fuerte

### Debug views a revisar

- Exposure/luminance
- Material ID/categoría
- Reflective mask
- Specular contribution

---

## 10. Escena 05 — Río o Lago

### Propósito

Validar reflejo del agua, Fresnel, roughness, comportamiento SSR y costo de rendimiento.

### Condiciones

- Hora: variantes de mediodía, atardecer y noche recomendadas
- Clima: Despejado
- Configuración: Agua quieta o de movimiento lento con orilla visible
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Agua
- Tierra de orilla
- Piedra
- Arena
- Follaje
- Reflejo del cielo si está soportado

### Comportamiento esperado

- El agua es reflectiva pero no un espejo perfecto.
- El reflejo aumenta en ángulos rasantes.
- Los materiales de orilla permanecen mate.
- SSR se desvanece de forma elegante cuando no hay información disponible.
- Lite reduce el comportamiento reflectivo costoso.

### Comportamiento prohibido

- Agua espejo perfecta en todas las condiciones
- Artefactos SSR sin fallback
- Tierra o piedra reflectiva cerca del agua
- Shimmer excesivo
- Reflejo de agua dominando el gameplay

### Debug views a revisar

- Reflective mask
- Fresnel factor
- SSR contribution
- Roughness

---

## 11. Escena 06 — Transición Interior/Exterior con Vidrio

### Propósito

Validar visibilidad del vidrio, respuesta de bordes, contención de reflejos y exposición interior/exterior.

### Condiciones

- Hora: variantes de día y noche recomendadas
- Configuración: Casa o estructura con paredes/ventanas de vidrio
- Presets: Balanced, Quality

### Materiales bajo revisión

- Vidrio
- Paneles de vidrio
- Vidrio tintado
- Madera
- Piedra
- Iluminación interior con antorchas si está disponible

### Comportamiento esperado

- El vidrio tiene reflejo sutil.
- El vidrio permanece transparente y legible.
- La respuesta en bordes es visible pero no excesiva.
- El vidrio tintado permanece más oscuro y apagado.
- La transición interior/exterior se mantiene controlada.

### Comportamiento prohibido

- Vidrio convertido en espejo fuerte
- Glare excesivo
- Vidrio tintado perdiendo su identidad
- Artefactos en paneles delgados de vidrio
- Cambios de exposición demasiado agresivos

### Debug views a revisar

- Material ID/categoría
- Reflective mask
- Fresnel factor
- SSR contribution

---

## 12. Escena 07 — Cueva

### Propósito

Validar manejo de oscuridad, iluminación de antorchas, comportamiento de piedra, exposición y legibilidad.

### Condiciones

- Hora: cualquiera
- Configuración: Cueva natural o escena de cueva creada
- Iluminación: Antorchas, lava opcional pero no requerida para v1.0.0
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Piedra
- Deepslate
- Parches de tierra
- Minerales si son visibles
- Superficies iluminadas por antorchas
- Amatista si está disponible

### Comportamiento esperado

- La cueva permanece legible.
- La luz de antorcha se siente cálida y creíble.
- La piedra permanece mate.
- Las sombras son suficientemente suaves para gameplay.
- La exposición no sobrecompensa de forma agresiva.

### Comportamiento prohibido

- Cuevas demasiado oscuras para jugar
- Piedra reflectiva
- Bloom de antorchas dominando la escena
- Contraste excesivo
- Color grading ocultando detalle material

### Debug views a revisar

- Exposure/luminance
- Material ID/categoría
- Specular contribution
- Reflective mask

---

## 13. Escena 08 — Entorno de Hielo o Nieve

### Propósito

Validar respuesta del hielo, brillo de nieve, exposición y legibilidad en biomas fríos.

### Condiciones

- Hora: variantes de mediodía y atardecer recomendadas
- Clima: despejado o nieve si está disponible
- Bioma: Llanura nevada, río congelado o bioma helado
- Presets: Balanced, Quality

### Materiales bajo revisión

- Hielo
- Hielo compacto
- Hielo azul
- Nieve
- Piedra
- Agua si es visible

### Comportamiento esperado

- El hielo tiene reflejo controlado.
- El hielo compacto y azul se sienten más suaves, pero no como vidrio.
- La nieve no se sobreexpone.
- La escena fría permanece legible.
- Los reflejos se suavizan por roughness.

### Comportamiento prohibido

- Nieve recortada a blanco puro
- Hielo comportándose como vidrio limpio
- Hielo azul demasiado saturado
- Terreno reflejando incorrectamente
- Glare excesivo

### Debug views a revisar

- Reflective mask
- Roughness
- Fresnel factor
- Exposure/luminance

---

## 14. Escena 09 — Cobre Nuevo vs Cobre Oxidado

### Propósito

Validar diferenciación material entre cobre nuevo y cobre oxidado.

### Condiciones

- Hora: variantes de día y noche con antorchas recomendadas
- Configuración: Bloques de cobre nuevo junto a bloques de cobre oxidado
- Presets: Balanced, Quality

### Materiales bajo revisión

- Cobre nuevo
- Cobre expuesto
- Cobre desgastado
- Cobre oxidado
- Piedra o madera cercana para contraste

### Comportamiento esperado

- El cobre nuevo tiene respuesta especular más fuerte.
- El cobre oxidado es más mate.
- La oxidación reduce visiblemente la respuesta material.
- El cobre no parece oro.
- Los highlights permanecen controlados.

### Comportamiento prohibido

- Cobre oxidado reflejando como cobre nuevo
- Cobre nuevo pareciendo oro pulido
- Color de cobre sobresaturado
- Respuesta metálica tipo espejo
- Highlights dominando la textura del bloque

### Debug views a revisar

- Material ID/categoría
- Specular contribution
- Roughness
- Reflective mask

---

## 15. Escena 10 — Lluvia

### Propósito

Validar respuesta al clima, niebla, exposición y límites futuros de lógica de superficies húmedas.

### Condiciones

- Clima: Lluvia
- Hora: variantes de día y noche recomendadas
- Configuración: Terreno mixto con madera, piedra, hojas, agua y vidrio
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Tierra
- Piedra
- Madera
- Hojas
- Agua
- Vidrio
- Caminos o senderos si están disponibles

### Comportamiento esperado

- La lluvia añade ambiente sin volver reflectiva cada superficie.
- Los materiales mate permanecen principalmente mate.
- La niebla o atmósfera se mantiene legible.
- La respuesta del agua puede volverse más notoria.
- El costo de rendimiento permanece controlado por preset.

### Comportamiento prohibido

- Todo volviéndose mojado y reflectivo
- Hojas con apariencia plástica
- Piedra tipo espejo
- Lluvia ocultando el mundo
- Brillo excesivo de superficies húmedas
- Gran caída de rendimiento sin documentación

### Debug views a revisar

- Reflective mask
- Roughness
- Exposure/luminance
- SSR contribution cuando aplique

---

## 16. Escena 11 — Amatista

### Propósito

Validar respuesta material cristalina y evitar brillo fantástico excesivo.

### Condiciones

- Configuración: Geoda de amatista o construcción controlada con amatista
- Iluminación: Variantes con baja luz y antorchas
- Presets: Balanced, Quality

### Materiales bajo revisión

- Amatista
- Calcita
- Basalto liso o piedra alrededor
- Iluminación de antorcha si está presente

### Comportamiento esperado

- La amatista tiene highlight cristalino sutil.
- El indicio tipo emisivo permanece muy bajo.
- La calcita permanece casi mate.
- La piedra alrededor permanece no reflectiva.

### Comportamiento prohibido

- Amatista brillando fuertemente por defecto
- Brillo mágico/fantástico
- Calcita volviéndose glossy
- Piedra reflejando
- Respuesta púrpura sobresaturada

### Debug views a revisar

- Material ID/categoría
- Specular contribution
- Emissive hint si está implementado
- Reflective mask

---

## 17. Escena 12 — Estrés de Materiales Mate

### Propósito

Validar que los materiales mate permanezcan protegidos bajo iluminación fuerte y ángulos de vista extremos.

### Condiciones

- Hora: variantes de mediodía y atardecer recomendadas
- Configuración: Área con tierra, piedra, madera, hojas, arena y grava
- Opcional: colocar vidrio y agua cerca para contraste
- Presets: Lite, Balanced, Quality

### Materiales bajo revisión

- Tierra
- Piedra
- Madera
- Hojas
- Arena
- Grava
- Laterales de bloque de pasto
- Adoquín
- Troncos y tablones

### Comportamiento esperado

- Los materiales mate permanecen no reflectivos.
- La luz fuerte no crea gloss accidental.
- Fresnel no afecta materiales mate.
- La respuesta specular permanece mínima o ausente.
- La identidad material se mantiene clara.

### Comportamiento prohibido

- Tierra reflectiva
- Madera glossy
- Hojas mojadas por defecto
- Piedra brillante
- Arena o grava reflectiva
- Máscaras de material filtrando reflejo hacia categorías mate

### Debug views a revisar

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor

---

## 18. Requisitos de Capturas

Cuando se capturen screenshots de validación, usar condiciones consistentes siempre que sea posible.

Capturas recomendadas por escena:

- Baseline Vanilla
- Preset Lite
- Preset Balanced
- Preset Quality
- Debug view donde aplique

Las capturas deberían almacenarse en:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

Solo deben commitearse capturas curadas.

Las capturas aleatorias deben permanecer locales e ignoradas.

---

## 19. Notas de Rendimiento

Las escenas de validación deberían incluir eventualmente notas de rendimiento.

Campos recomendados:

```plaintext
GPU:
Resolución:
Versión de Minecraft:
Versión de Iris:
Preset:
Distancia de render:
FPS promedio:
1% low FPS si está disponible:
Cuellos de botella conocidos:
Notas:
```

Los números de rendimiento no deben publicarse como afirmaciones universales.

Son observaciones específicas de un entorno.

---

## 20. Validación Antes de Release

Antes de cualquier release pública, revisar al menos:

- Exterior al mediodía
- Noche con antorchas
- Río o lago
- Transición con vidrio
- Cueva
- Hielo/nieve
- Comparación de cobre
- Escena de estrés de materiales mate

Para releases alpha y posteriores, deberían incluirse capturas o notas cuando sea posible.

---

## 21. Regla de Gobierno de Validación

Cuando haya incertidumbre, elegir:

1. Escenas repetibles sobre capturas aleatorias
2. Legibilidad de gameplay sobre visuales dramáticos
3. Corrección material sobre espectáculo visual
4. Debug views sobre suposiciones
5. Limitaciones documentadas sobre problemas ocultos
6. Notas honestas de rendimiento sobre afirmaciones amplias
