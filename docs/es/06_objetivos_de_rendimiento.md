# Objetivos de Rendimiento — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Especificación de rendimiento y modelo de costo
- Idioma canónico: Inglés
- Alcance objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define los objetivos de rendimiento y el modelo de comunicación de costo para Vanilla RTX Lite.

El objetivo es que las expectativas de rendimiento sean útiles, realistas y honestas.

Vanilla RTX Lite no debe afirmar uso exacto de GPU, uso exacto de VRAM o expectativas universales de FPS sin validación real.

---

## 2. Filosofía de Rendimiento

El rendimiento forma parte de la identidad visual del proyecto.

Un efecto visual no es exitoso si se ve bien pero hace que el shader sea poco práctico de usar.

El proyecto debe priorizar:

- Rutas de shader eficientes
- Opciones visuales acotadas
- Control de calidad por presets
- Efectos costosos controlados por material
- Degradación elegante
- Documentación honesta
- Cost tiers claros para el usuario

---

## 3. Hardware de Referencia

### Referencia principal de desarrollo

```plaintext
GPU: RTX 3070 Ti
Resolución: 1080p
Uso objetivo: Desarrollo, validación Balanced, validación Quality
```

Este es el hardware principal de referencia para desarrollo y ajuste visual.

### Clase objetivo para Lite

```plaintext
Clase GPU: GTX 1050 Ti / RX 570
Resolución: 1080p
Uso objetivo: Preset Lite, ajustes reducidos, expectativas realistas
```

Esta es una clase objetivo, no una garantía universal.

### Política para gráficos integrados

```plaintext
Gráficos integrados: Best effort únicamente para v1.0.0
```

Los gráficos integrados no son un objetivo formal de soporte para v1.0.0 salvo que exista hardware real de validación.

---

## 4. Resolución Objetivo

La resolución inicial de validación es:

```plaintext
1080p
```

Razones:

- Coincide con el entorno principal de desarrollo.
- Es común entre jugadores.
- Evita fingir validación en resoluciones que no se han probado realmente.
- Da una base práctica para el desarrollo inicial.

Resoluciones superiores pueden probarse más adelante, pero no deben afirmarse como validadas hasta ser medidas.

---

## 5. Intención de Rendimiento por Preset

### Lite

Objetivo principal:

- Menor costo GPU
- Reducción de efectos costosos
- Mayor accesibilidad
- Soporte serio para GPUs dedicadas de menor potencia

Comportamiento esperado:

- SSR de menor calidad o desactivado
- Menor sample count
- Atmósfera más simple
- Menor costo de sombras o reflejos
- Misma identidad Vanilla+

Lite no debe sentirse como una versión rota del shader.

### Balanced

Objetivo principal:

- Identidad visual de referencia
- Default práctico
- Costo controlado
- Preset pensado para uso diario

Comportamiento esperado:

- Features visuales centrales activadas
- Calidad de reflejos controlada
- Atmósfera moderada
- Buen equilibrio visual/rendimiento

Balanced es el preset por defecto recomendado para la mayoría de usuarios.

### Quality

Objetivo principal:

- Mejor fidelidad
- Efectos más suaves
- Mejor calidad de reflejos y atmósfera
- Misma contención Vanilla+

Comportamiento esperado:

- Mayor sample count
- Mejor calidad SSR donde esté permitido
- Mayor suavidad atmosférica
- Mayor pulido visual

Quality no debe convertirse en otro estilo artístico.

### Experimental

Objetivo principal:

- Pruebas controladas
- Features inestables
- Exploración visual/técnica

Comportamiento esperado:

- Features posiblemente incompletas
- Rendimiento posiblemente inestable
- No recomendado para gameplay normal
- No usado como base para afirmaciones públicas

### Custom

Objetivo principal:

- Control del usuario dentro de límites seguros

Comportamiento esperado:

- El usuario puede ajustar calidad y costo
- Las opciones permanecen acotadas
- La identidad material no puede romperse
- Las opciones están documentadas en el registro de opciones

---

## 6. Sistema de Cost Tiers

El proyecto comunica impacto de rendimiento mediante cost tiers.

Tiers permitidos:

| Tier | Significado |
| --- | --- |
| Very Low | Impacto mínimo en la mayoría de casos |
| Low | Impacto pequeño, generalmente seguro |
| Medium | Costo notable pero aceptable |
| High | Costoso, debe estar controlado por preset |
| Very High | Muy costoso, experimental o solo para Quality |

Estos son estimados relativos, no mediciones exactas.

---

## 7. Dimensiones de Costo

Cada feature importante debería definir eventualmente:

| Dimensión | Propósito |
| --- | --- |
| `gpu_cost` | Costo estimado de ejecución del shader |
| `memory_cost` | Presión estimada de render targets o buffers |
| `visual_impact` | Importancia visual de la feature |
| `resolution_scaling` | Qué tanto escala el costo con la resolución |
| `preset_availability` | Qué presets pueden activar la feature |
| `fallback_strategy` | Qué ocurre cuando la feature se reduce o desactiva |

---

## 8. Expectativas Iniciales de Costo por Feature

| Feature | Costo GPU | Costo Memoria | Impacto Visual | Notas |
| --- | --- | --- | --- | --- |
| Ajuste de calidez de antorcha | Very Low | Very Low | Medium | Solo ajuste de color/intensidad |
| Control de exposición | Low | Very Low | High | Esencial para legibilidad |
| Tonemap neutral | Low | Very Low | High | Consistencia de imagen final |
| Máscara material | Low | Low | Very High | Requerida para corrección material |
| Helper Fresnel | Low | Very Low | High | Barato pero importante |
| Respuesta de roughness | Low | Very Low | High | Esencial para comportamiento material |
| Respuesta specular | Medium | Very Low | Medium | Debe estar controlada por material |
| Reflejo de agua | High | Medium | Very High | Debe estar controlado por preset |
| Reflejo de vidrio | Medium | Low | High | Debe mantenerse sutil |
| SSR | High | Medium | High | Costoso y propenso a artefactos |
| Niebla | Low | Low | Medium | Debe mantenerse legible |
| God rays | High | Medium | Medium | Opcional y sutil |
| Debug views | Low | Very Low | High | Requisito de ingeniería |

---

## 9. Escalado por Resolución

Algunas features escalan fuertemente con la resolución.

La alta resolución aumenta el costo de:

- SSR
- Niebla full-screen
- Postprocesado full-screen
- Blur de alto sample count
- Buffers intermedios de alta resolución
- Lógica de iluminación costosa por fragmento

Las features con alta sensibilidad a resolución deben marcarse claramente en el registro de opciones.

---

## 10. Presión de Memoria

El shader debe evitar crecimiento innecesario de render targets.

La presión de memoria puede venir de:

- Buffers de color adicionales
- Buffers intermedios de alta resolución
- Buffers de reflejo
- History buffers si se introducen en el futuro
- Debug buffers implementados de forma ineficiente

El proyecto no debe afirmar uso exacto de VRAM salvo que sea medido con herramientas apropiadas.

En su lugar, debe comunicar presión relativa de memoria.

---

## 11. Métricas de Rendimiento

Cuando se mida rendimiento, los campos recomendados son:

```plaintext
GPU:
CPU:
RAM:
Resolución:
Versión de Minecraft:
Versión de Iris:
Loader:
Preset:
Distancia de render:
Mundo/escena:
FPS promedio:
1% low FPS si está disponible:
Versión de driver:
Sistema operativo:
Notas:
```

Las mediciones de rendimiento deben presentarse como observaciones específicas de un entorno.

No deben tratarse como garantías universales.

---

## 12. Método de Benchmark

El benchmark inicial debe ser simple y repetible.

Enfoque recomendado:

1. Usar una escena de validación documentada.
2. Definir una resolución fija.
3. Usar una distancia de render fija.
4. Probar un preset a la vez.
5. Registrar FPS promedio.
6. Registrar stutter visible si aparece.
7. Capturar notas sobre artefactos o regresiones visuales.
8. Evitar afirmaciones amplias a partir de un solo resultado.

---

## 13. Política de Rendimiento para Releases

Antes de una release pública, el proyecto debería documentar:

- Versión de Minecraft probada
- Versión de Iris probada
- GPU probada
- Resolución probada
- Presets probados
- Limitaciones de rendimiento conocidas
- Opciones costosas conocidas
- Ajustes recomendados para Lite/Balanced/Quality

Si un preset no ha sido probado correctamente, debe marcarse como tal.

---

## 14. Política de Afirmaciones de Rendimiento

El proyecto puede decir:

- “Costo estimado: High”
- “Recomendado para GPUs dedicadas de gama media”
- “Validado en RTX 3070 Ti a 1080p”
- “Lite está pensado para GPUs dedicadas de menor potencia”

El proyecto no debe decir:

- “Usa exactamente 2 GB de VRAM”
- “Corre a 60 FPS en todos los sistemas con GTX 1050 Ti”
- “Detecta automáticamente tu uso de GPU”
- “Rendimiento garantizado en gráficos integrados”
- “El shader muestra utilización exacta de GPU”

---

## 15. Filosofía Mínima del Preset Lite

Lite es un preset real, no una versión degradada sin cuidado.

Lite debe preservar:

- Identidad Vanilla+
- Pipeline básico de color
- Corrección material
- Calidez de antorchas
- Atmósfera legible
- Compatibilidad con debug cuando sea posible

Lite puede reducir:

- Calidad SSR
- Resolución de reflejos
- Sample counts
- Complejidad atmosférica
- Calidad de sombras
- Efectos full-screen costosos

Lite no debe permitir que materiales mate reflejen.

---

## 16. Filosofía del Preset Balanced

Balanced es el preset de referencia.

Debe representar:

- Apariencia por defecto prevista
- Costo controlado
- Filosofía visual central completa
- Buena legibilidad de gameplay
- Uso diario práctico

Balanced debería ser el preset usado para la mayoría de capturas y documentación salvo que se indique lo contrario.

---

## 17. Filosofía del Preset Quality

Quality aumenta fidelidad, pero no cambia la dirección artística.

Quality puede mejorar:

- Suavidad de reflejos
- Estabilidad SSR
- Suavidad atmosférica
- Calidad de sombras
- Precisión de color

Quality debe seguir siendo sutil y Vanilla+.

---

## 18. Filosofía del Preset Experimental

Experimental es para pruebas.

Puede incluir:

- Efectos inestables
- Features incompletas
- Sistemas de mayor costo
- Features evaluadas para inclusión futura

Experimental no debe usarse para definir la identidad visual estable.

---

## 19. Política para Gráficos Integrados

Los gráficos integrados son best-effort únicamente para v1.0.0.

El proyecto debe evitar prometer soporte para sistemas iGPU porque el rendimiento depende fuertemente de:

- Generación de GPU
- Memoria compartida
- Calidad de driver
- Resolución
- Distancia de render
- Mods
- Sistema operativo

Si el soporte iGPU mejora más adelante, debe documentarse mediante validación real.

---

## 20. Áreas de Riesgo de Rendimiento

Áreas de riesgo inicial conocidas:

- Costo y artefactos de SSR
- Lógica de reflejos ejecutándose demasiado ampliamente
- Demasiados passes full-screen
- Calidad alta de sombras en GPUs de baja potencia
- Sample count de atmósfera
- Debug views implementados de forma ineficiente
- Presets que no reduzcan suficiente costo
- Personalización excesiva creando combinaciones costosas

Estos riesgos deben rastrearse a medida que avance la implementación.

---

## 21. Prioridades de Optimización

Cuando se necesite optimización, priorizar:

1. Evitar ejecutar efectos costosos en materiales no elegibles.
2. Reducir sample counts antes de eliminar identidad visual.
3. Proveer rutas fallback de menor costo.
4. Mantener Lite como preset significativo.
5. Evitar trabajo costoso en passes full-screen cuando no sea necesario.
6. Documentar compromisos visuales.

---

## 22. Regla de Gobierno de Rendimiento

Cuando haya incertidumbre, elegir:

1. Estimaciones honestas sobre precisión falsa
2. Costo controlado por preset sobre costo global
3. Efectos controlados por material sobre efectos full-screen
4. Fallback elegante sobre ruptura visual
5. Afirmaciones medidas sobre suposiciones
6. Usabilidad sobre visuales showcase
