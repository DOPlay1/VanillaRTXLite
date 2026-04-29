# Visión — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Dirección visual y creativa
- Idioma canónico: Inglés
- Traducción oficial: Español

---

## 1. Declaración de Visión

Vanilla RTX Lite busca hacer que Minecraft Java se sienta visualmente más refinado mientras preserva la identidad Vanilla original del juego.

El shader debe mejorar iluminación, atmósfera, respuesta material y profundidad sin hacer que Minecraft se vea sobreprocesado, cinematográfico o desconectado de su estilo original.

Lema central:

> Debe seguir viéndose como Minecraft — solo que mejor.

---

## 2. Filosofía de Diseño

El proyecto se construye alrededor de la contención visual.

Vanilla RTX Lite no debe competir con shaders showcase que priorizan capturas dramáticas sobre gameplay consistente.

En cambio, debe enfocarse en:

- Realismo sutil
- Coherencia material
- Iluminación natural
- Atmósfera controlada
- Legibilidad durante el juego
- Diseño visual consciente del rendimiento

El shader debe sentirse como una mejora, no como un reemplazo.

---

## 3. Qué Significa Vanilla+ Aquí

Vanilla+ no significa “casi sin cambios”.

Significa mejorar el lenguaje visual existente de Minecraft mientras se respeta su identidad cúbica, legible y estilizada.

Para este proyecto, Vanilla+ significa:

- Minecraft sigue siendo reconocible a primera vista.
- Los bloques conservan su identidad material.
- La iluminación mejora la profundidad sin sobrecargar la escena.
- Los colores se mantienen naturales y contenidos.
- Los efectos apoyan el gameplay en lugar de distraer.
- Los cambios visuales se sienten intencionales, no decorativos.

---

## 4. Tipo RTX, No RTX Real

Vanilla RTX Lite está inspirado en respuestas materiales tipo RTX, pero no es un proyecto de ray tracing ni path tracing.

El objetivo es simular algunas cualidades tipo RTX mediante técnicas inteligentes de shader en OpenGL:

- Reflejos selectivos
- Respuesta basada en Fresnel
- Highlights basados en roughness
- Comportamiento especular controlado
- Mejor percepción de iluminación
- Profundidad atmosférica sutil

El proyecto nunca debe afirmar que es RTX real, path tracing o ray tracing por hardware.

Una mejor descripción sería:

> Fake RTX con inteligencia material y contención Vanilla+.

---

## 5. Personalidad Visual

El shader debe sentirse:

- Limpio
- Calmado
- Natural
- Claro
- Jugable
- Sutil
- Consistente
- Ligeramente más realista que Vanilla

El shader no debe sentirse:

- Ruidoso
- Cinematográfico pesado
- Sobresaturado
- Demasiado brillante
- Visualmente cargado
- Lavado
- Demasiado oscuro
- Demasiado claro
- Diseñado solo para capturas

---

## 6. Dirección de Iluminación

La iluminación debe mejorar la profundidad espacial mientras preserva la legibilidad.

El estilo de iluminación buscado es:

- Natural
- Balanceado
- Suave
- Controlado
- Cálido cuando corresponda
- Nunca agresivamente dramático por defecto

El shader debe evitar:

- Contraste duro
- Altas luces quemadas
- Sombras aplastadas
- Atardeceres excesivamente naranjas
- Iluminación blanca artificial en antorchas
- Cuevas tan oscuras que perjudiquen el gameplay

---

## 7. Identidad de Antorchas y Luz Local

La iluminación de antorchas es una parte clave de la identidad visual de Minecraft.

En Vanilla RTX Lite, las antorchas deben sentirse más cálidas y creíbles, pero no exageradas.

La luz de antorcha debe ser:

- Cálida
- Similar al fuego
- Suave
- Legible
- Ligeramente dorada
- No excesivamente roja
- No blanca por defecto

Las opciones de usuario pueden ajustar calidez e intensidad, pero solo dentro de límites seguros.

El usuario no debería poder convertir la identidad base de la antorcha en una fuente fría o artificial mediante presets normales.

---

## 8. Identidad Material

Los materiales son el corazón del shader.

El shader no debe tratar todas las superficies como brillantes o reflectivas.

El comportamiento material debe basarse en categorías físicas:

- Reflectivo
- Semi-reflectivo
- Especular
- Brillante/pulido
- Mate
- Similar a emisivo

El siguiente principio es obligatorio:

> Un material solo debe reflejar si su identidad física permite reflejo.

Esto significa:

- El agua puede reflejar.
- El vidrio puede reflejar.
- El hielo puede reflejar.
- Superficies pulidas tipo cuarzo pueden tener respuesta sutil.
- Los metales pueden tener respuesta especular.
- La amatista puede tener una respuesta cristalina sutil.
- Tierra, piedra, madera, hojas, arena y grava deben permanecer mate.

---

## 9. Dirección de Reflejos

Los reflejos deben ser selectivos y contenidos.

Deben depender de:

- Categoría de material
- Fresnel
- Roughness
- Ángulo de vista
- Condición de iluminación
- Calidad del preset

Los reflejos nunca deben aplicarse globalmente.

El proyecto debe evitar:

- Terreno tipo espejo
- Tierra reflectiva
- Madera reflectiva
- Hojas reflectivas
- Brillo excesivo en vidrio
- Agua que parezca un espejo perfecto en todas las condiciones

El agua puede ser el material más reflectivo, pero incluso el agua debe mantenerse creíble y jugable.

---

## 10. Dirección de Atmósfera

La atmósfera debe añadir profundidad, no drama.

Niebla, god rays, color de amanecer, color de atardecer y tratamiento del cielo deben mantenerse sutiles.

Los efectos atmosféricos deben:

- Mejorar la percepción de distancia
- Preservar visibilidad durante el gameplay
- Apoyar el ambiente sin dominar la imagen
- Mantenerse coherentes con el lenguaje de color Vanilla

La atmósfera no debe:

- Ocultar el mundo
- Sobresaturar el cielo
- Convertir cada escena en una toma cinematográfica
- Hacer cuevas ilegibles
- Volver cansado el gameplay normal

---

## 11. Dirección de Color

El color debe mantenerse contenido y natural.

El shader no debe aplicar un look cinematográfico pesado.

El color grading debe:

- Preservar la identidad de la paleta Vanilla
- Controlar exposición
- Evitar blancos quemados
- Evitar negros aplastados
- Evitar sobresaturación
- Evitar contraste agresivo
- Evitar sesgo fuerte teal/orange

La imagen final debe sentirse pulida, no filtrada.

---

## 12. Rendimiento como Parte de la Visión

El rendimiento forma parte de la identidad visual del proyecto.

Un efecto hermoso que destruye la usabilidad no está alineado con Vanilla RTX Lite.

El proyecto debe priorizar:

- Rutas de shader eficientes
- Opciones acotadas
- Control de costo por presets
- Features depurables
- Documentación honesta de rendimiento
- Degradación elegante para presets bajos

El preset Lite debe ser más que una idea secundaria. Debe ser un objetivo serio para GPUs dedicadas de menor potencia.

---

## 13. Personalidad de Presets

### Lite

Lite debe preservar la identidad del proyecto mientras reduce efectos costosos.

Debe sentirse como Vanilla RTX Lite, no como una versión rota o incompleta.

### Balanced

Balanced es la referencia visual.

Debe representar la identidad visual por defecto del shader.

### Quality

Quality puede mejorar fidelidad y suavidad, pero no debe convertirse en otro estilo artístico.

### Experimental

Experimental existe para pruebas.

No debe definir la identidad estable del proyecto.

### Custom

Custom permite flexibilidad, pero no contradicción visual.

Los usuarios pueden ajustar intensidad y costo, pero no deberían poder romper reglas de materiales ni la filosofía visual central.

---

## 14. Lo que el Shader Nunca Debe Volverse

Vanilla RTX Lite no debe convertirse en:

- Un shader showcase cinematográfico
- Un shader dependiente de bloom pesado
- Un shader de superficies tipo espejo
- Un shader donde todos los bloques parecen mojados
- Un shader que oculta la legibilidad del gameplay
- Un shader que ignora la identidad material
- Un shader que promete de más sobre rendimiento o detección de hardware
- Un shader que persigue tendencias visuales sin propósito

---

## 15. Regla de Línea Base Visual

Antes de añadir un efecto visual, preguntar:

1. ¿Esto sigue viéndose como Minecraft?
2. ¿Respeta el material?
3. ¿Mejora la percepción durante el gameplay?
4. ¿Es suficientemente sutil?
5. ¿Se puede validar?
6. ¿Se puede desactivar o reducir si es costoso?
7. ¿Encaja con el alcance Overworld de v1.0.0?

Si la respuesta no es clara, la feature debe documentarse, limitarse o aplazarse.

---

## 16. Criterios de Éxito Creativo

El shader tiene éxito visualmente cuando:

- Minecraft sigue siendo reconocible de inmediato.
- El mundo se siente más profundo y natural.
- Los materiales se sienten más creíbles sin exagerarse.
- La iluminación mejora la escena sin dominarla.
- Los reflejos aparecen solo donde tienen sentido.
- La imagen se siente limpia durante gameplay real.
- El shader se ve bien en movimiento, no solo en capturas.
- El jugador olvida que el shader está ahí y simplemente siente que Minecraft se ve mejor.

---

## 17. Regla Final de Visión

Cuando haya incertidumbre, elegir:

1. Identidad vanilla sobre espectáculo
2. Sutileza sobre intensidad
3. Plausibilidad física sobre trucos visuales
4. Legibilidad de gameplay sobre drama de captura
5. Rendimiento sobre complejidad innecesaria
6. Limitaciones honestas sobre promesas infladas
