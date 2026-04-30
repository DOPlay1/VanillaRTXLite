# Manifiesto Visual Base — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Manifiesto visual base y no regresión
- Idioma canónico: Inglés
- Alcance objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define la línea base visual de Vanilla RTX Lite.

La línea base visual es el estándar usado para juzgar si un cambio del shader todavía pertenece al proyecto.

Protege el proyecto contra deriva visual, efectos excesivos, errores materiales y cambios artísticos no respaldados.

---

## 2. Filosofía de la Línea Base Visual

Vanilla RTX Lite debe hacer que Minecraft se vea más refinado mientras preserva su identidad original.

El proyecto debe sentirse:

- Vanilla+
- Natural
- Contenido
- Jugable
- Consciente de materiales
- Consciente del rendimiento
- Ligeramente más realista sin volverse cinematográfico pesado

El shader debe mejorar la imagen sin reemplazar el lenguaje visual de Minecraft.

---

## 3. Declaración Visual Central

El shader debe seguir viéndose como Minecraft.

Un buen cambio visual debe hacer que el jugador sienta:

```plaintext
Esto se ve como Minecraft, pero más limpio, profundo y creíble.
```

Un mal cambio visual hace que el jugador sienta:

```plaintext
Esto parece otro juego.
```

---

## 4. Reglas de Línea Base Visual

Toda feature visual debe respetar estas reglas:

1. Preservar identidad Vanilla.
2. Mejorar legibilidad.
3. Respetar categorías materiales.
4. Evitar efectos exagerados.
5. Mantenerse sutil por defecto.
6. Evitar hacks visuales globales.
7. Mantener conciencia de rendimiento.
8. Poder explicarse mediante documentación o debug views.

---

## 5. Requisitos de Identidad Vanilla

Minecraft debe seguir siendo reconocible a primera vista.

El shader debe preservar:

- Legibilidad de bloques
- Identidad material original
- Simplicidad estilizada
- Siluetas claras
- Visibilidad durante gameplay
- Relaciones naturales de color
- Atmósfera familiar del Overworld

El shader no debe hacer que el juego parezca:

- Una demo cinematográfica
- Un asset pack fotorrealista
- Un showcase de superficies mojadas
- Un shader fantástico de bloom alto
- Un motor de juego diferente

---

## 6. Línea Base de Color

El color debe mantenerse contenido y cercano a la identidad Vanilla.

### Comportamiento requerido

- El pasto permanece natural.
- El follaje permanece legible.
- El color del cielo permanece creíble.
- La luz de antorcha es cálida, pero no excesivamente roja.
- La calidez del atardecer está presente, pero controlada.
- Las sombras conservan detalle.
- Los blancos no se queman.
- Los negros no se aplastan.

### Comportamiento prohibido

- Pasto sobresaturado
- Grading cinematográfico teal/orange
- Contraste pesado
- Día lavado
- Atardeceres extremadamente naranjas
- Tinte nocturno púrpura o poco natural
- Filtros de color que dominen el gameplay

---

## 7. Línea Base de Iluminación

La iluminación debe mejorar profundidad y legibilidad.

### Comportamiento requerido

- La luz de día permanece clara.
- Las sombras son suficientemente suaves para gameplay.
- La noche permanece jugable.
- Las antorchas dan luz cálida y legible.
- Las cuevas son oscuras, pero no ilegibles.
- La luz local apoya la respuesta material sin exagerarla.

### Comportamiento prohibido

- Cuevas extremadamente oscuras por defecto
- Iluminación blanca de antorchas
- Iluminación excesivamente roja de antorchas
- Altas luces quemadas alrededor de antorchas
- Contraste duro en sombras
- Iluminación que oculte información importante de gameplay

---

## 8. Línea Base de Reflejos

Los reflejos deben ser selectivos y basados en materiales.

### Comportamiento requerido

Los reflejos pueden aparecer en:

- Agua
- Vidrio
- Vidrio tintado
- Paneles de vidrio
- Hielo
- Superficies pulidas seleccionadas
- Metales especulares seleccionados
- Materiales cristalinos tipo amatista, de forma sutil

Los reflejos deben depender de:

- Categoría material
- Roughness
- Fresnel
- Ángulo de vista
- Condición de iluminación
- Calidad del preset

### Comportamiento prohibido

Los reflejos no deben aparecer en:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- Terreno rugoso
- La mayoría de materiales orgánicos

El shader no debe crear:

- Terreno tipo espejo
- Tierra reflectiva
- Madera glossy por defecto
- Hojas mojadas por defecto
- Piedra que parezca pulida salvo que esté clasificada explícitamente
- Reflejo global en toda la pantalla

---

## 9. Línea Base del Agua

El agua puede ser el material común más reflectivo.

### Comportamiento requerido

- El agua refleja más en ángulos rasantes.
- El reflejo está controlado por Fresnel.
- Roughness o distorsión suavizan el reflejo.
- El agua permanece jugable y legible.
- Lite puede reducir calidad de reflejos.

### Comportamiento prohibido

- Agua como espejo perfecto bajo todos los ángulos
- Shimmer excesivo
- Artefactos de reflejo sin fallback
- Agua dominando la escena
- Agua pareciendo metal pulido

---

## 10. Línea Base del Vidrio

El vidrio debe tener una respuesta sutil dependiente del ángulo.

### Comportamiento requerido

- El vidrio permanece transparente.
- Los reflejos en bordes son visibles, pero controlados.
- El vidrio tintado permanece más oscuro y apagado.
- Los paneles de vidrio evitan artefactos ruidosos.

### Comportamiento prohibido

- Vidrio convertido en espejo fuerte
- Glare excesivo
- Vidrio tintado perdiendo identidad
- Paneles delgados de vidrio produciendo ruido reflectivo distractor

---

## 11. Línea Base del Hielo

El hielo puede ser reflectivo, pero no debe comportarse como vidrio limpio.

### Comportamiento requerido

- El hielo tiene reflejo controlado.
- El hielo compacto y azul son más suaves que el vidrio limpio.
- El reflejo se suaviza por roughness.
- Las escenas de nieve y hielo permanecen legibles.

### Comportamiento prohibido

- Hielo comportándose como vidrio perfecto
- Hielo azul sobresaturado
- Nieve recortada a blanco puro
- Glare excesivo en biomas fríos

---

## 12. Línea Base de Metales y Cobre

Los metales pueden tener respuesta especular, pero no deben convertirse en espejos por defecto.

### Comportamiento requerido

- El cobre nuevo tiene respuesta más fuerte que el cobre oxidado.
- El cobre oxidado es más mate.
- Las superficies tipo hierro tienen highlights controlados.
- Las superficies tipo oro tienen respuesta cálida, pero contenida.
- Los metales preservan legibilidad de textura del bloque.

### Comportamiento prohibido

- Bloques metálicos tipo espejo por defecto
- Cobre nuevo pareciendo oro pulido
- Cobre oxidado reflejando como cobre nuevo
- Highlights metálicos sobresaturados
- Respuesta especular ocultando textura del bloque

---

## 13. Línea Base de Amatista

La amatista puede tener una respuesta cristalina sutil.

### Comportamiento requerido

- La amatista puede mostrar highlights sutiles.
- El indicio tipo emisivo permanece muy bajo.
- La respuesta púrpura permanece contenida.
- La calcita y piedra alrededor permanecen principalmente mate.

### Comportamiento prohibido

- Brillo mágico fuerte por defecto
- Púrpura sobresaturado
- Calcita volviéndose glossy
- Piedra alrededor de amatista reflejando

---

## 14. Línea Base de Materiales Mate

Los materiales mate están protegidos.

Los siguientes materiales deben permanecer no reflectivos por defecto:

- Tierra
- Laterales de bloque de pasto
- Piedra
- Adoquín
- Deepslate
- Arena
- Grava
- Madera
- Troncos
- Tablones
- Hojas
- La mayoría de terreno rugoso
- La mayoría de materiales orgánicos

### Comportamiento requerido

- Solo iluminación difusa o respuesta casi difusa.
- Respuesta especular muy sutil solo si está explícitamente justificada.
- Sin contribución de reflejo.
- Sin brillo Fresnel.
- Sin apariencia mojada por defecto.

### Comportamiento prohibido

- Terreno mate reflectivo
- Madera glossy
- Hojas plásticas
- Piedra mojada por defecto
- Reflejo en arena o grava
- Filtración de máscaras materiales hacia categorías mate

---

## 15. Línea Base de Atmósfera

La atmósfera debe añadir profundidad, no drama.

### Comportamiento requerido

- La niebla mejora percepción de distancia.
- Amanecer y atardecer permanecen controlados.
- La atmósfera de lluvia es legible.
- Los god rays, si existen, son sutiles.
- El mundo permanece visible.

### Comportamiento prohibido

- Niebla ocultando gameplay
- Haze cinematográfico fuerte
- God rays dominando la imagen
- Lluvia haciendo reflectiva cada superficie
- Atmósfera usada para ocultar problemas de render

---

## 16. Línea Base de Bloom

El bloom debe ser contenido.

### Comportamiento requerido

- El bloom, si se implementa, es sutil.
- El glow de antorchas permanece controlado.
- Las altas luces no se queman.
- El bloom apoya legibilidad, no espectáculo.

### Comportamiento prohibido

- Bloom pesado
- Halos grandes alrededor de antorchas
- Bloom ocultando detalle de texturas
- Bloom usado como efecto cinematográfico por defecto

---

## 17. Línea Base de Tonemap y Exposición

Tonemap y exposición deben preservar claridad.

### Comportamiento requerido

- Tonemap neutral por defecto.
- La exposición protege legibilidad.
- Las altas luces permanecen controladas.
- Las sombras conservan detalle útil.
- El pipeline de color se siente pulido, no filtrado.

### Comportamiento prohibido

- Grading fílmico pesado
- Negros aplastados
- Blancos quemados
- Sesgo fuerte de color
- Bombeo de exposición que distraiga durante gameplay

---

## 18. Línea Base Visual por Preset

Todos los presets deben preservar la misma identidad central.

### Lite

Lite debe reducir costo, no romper identidad.

Lite puede reducir:

- Calidad SSR
- Resolución de reflejos
- Sample counts
- Complejidad atmosférica
- Calidad de sombras

Lite debe preservar:

- Reglas materiales
- Identidad Vanilla+
- Calidez de antorchas
- Pipeline básico de color
- Legibilidad durante gameplay

### Balanced

Balanced es la línea base visual de referencia.

Las capturas y documentación normalmente deben usar Balanced salvo que se indique lo contrario.

### Quality

Quality mejora fidelidad, no dirección artística.

Puede mejorar suavidad y estabilidad, pero no debe volverse cinematográfico pesado.

### Experimental

Experimental puede probar features inestables.

Experimental no debe definir la identidad visual estable.

### Custom

Custom permite control acotado.

Custom no debe permitir que el usuario rompa reglas materiales no negociables.

---

## 19. Línea Base de Debug

Los debug views forman parte del proceso de validación visual.

Debug views planeados requeridos:

- Material ID/categoría
- Reflective mask
- Roughness
- Fresnel factor
- Specular contribution
- SSR contribution
- Exposure/luminance

Los debug views deben ayudar a explicar por qué una superficie se comporta de cierta manera.

Si un problema visual no puede explicarse, el sistema necesita mejor visibilidad de debug.

---

## 20. Línea Base de Validación

Los cambios visuales importantes deben revisarse contra escenas de validación.

Escenas importantes:

- Exterior al mediodía
- Amanecer
- Atardecer
- Noche con antorchas
- Río o lago
- Transición con vidrio
- Cueva
- Entorno de hielo o nieve
- Cobre nuevo vs cobre oxidado
- Escena de lluvia
- Escena de amatista
- Escena de estrés de materiales mate

Una feature que solo se ve bien en una captura no es suficiente.

---

## 21. Checklist de No Regresión

Antes de aceptar un cambio visual significativo, verificar:

| Regla | Debe seguir siendo cierto |
| --- | --- |
| La tierra no refleja | Sí |
| La piedra no refleja | Sí |
| La madera no se vuelve glossy por defecto | Sí |
| Las hojas no se ven mojadas por defecto | Sí |
| Arena y grava permanecen difusas | Sí |
| El agua es reflectiva pero no espejo perfecto | Sí |
| El vidrio permanece legible | Sí |
| El hielo es reflectivo pero no vidrio limpio | Sí |
| La oxidación del cobre reduce respuesta | Sí |
| La amatista permanece sutil | Sí |
| La luz de antorcha permanece cálida, pero no excesivamente roja | Sí |
| El bloom permanece contenido | Sí |
| El color permanece cercano a identidad Vanilla | Sí |
| La legibilidad de gameplay se preserva | Sí |

---

## 22. Preguntas de Revisión para Cambios Visuales

Antes de aceptar un cambio visual, preguntar:

1. ¿Esto sigue viéndose como Minecraft?
2. ¿Respeta la matriz de materiales?
3. ¿Mejora la legibilidad durante gameplay?
4. ¿Es suficientemente sutil por defecto?
5. ¿Está controlado por preset u opción si es costoso?
6. ¿Puede validarse en una escena?
7. ¿Los debug views pueden explicarlo?
8. ¿Introduce expansión de alcance?
9. ¿Preserva el enfoque Overworld de v1.0.0?
10. ¿Evita falsas expectativas de RTX/path tracing?

---

## 23. Modos Comunes de Fallo Visual

El proyecto debe evitar:

- Deriva cinematográfica
- Bloom excesivo
- Sobresaturación
- Materiales mate reflectivos
- Terreno mojado por defecto
- Agua tipo espejo bajo todos los ángulos
- Vidrio tipo espejo
- Cuevas demasiado oscuras
- Antorchas demasiado brillantes
- Reflejos globales
- Deriva de estilos por preset
- Configuración Custom rompiendo identidad
- Defaults pesados en rendimiento
- Visibilidad debug añadida demasiado tarde

---

## 24. Política de Actualización de la Línea Base Visual

Este documento puede evolucionar, pero los cambios deben ser intencionales.

Actualizar este manifiesto cuando:

- Se acepte una nueva categoría material
- Cambie una regla visual importante
- Una nueva dimensión entre en alcance
- Un hito de release cambie expectativas visuales
- La validación revele que una regla base necesita refinarse

No debilitar este documento casualmente para justificar un atajo visual.

---

## 25. Regla de Gobierno de Línea Base Visual

Cuando haya incertidumbre, elegir:

1. Identidad Vanilla sobre espectáculo
2. Corrección material sobre atajos visuales
3. Sutileza sobre intensidad
4. Legibilidad de gameplay sobre drama de captura
5. Depurabilidad sobre comportamiento oculto
6. Limitaciones honestas sobre afirmaciones impresionantes
