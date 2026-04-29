# Compatibilidad — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Política de compatibilidad
- Idioma canónico: Inglés
- Alcance objetivo: Overworld v1.0.0

---

## 1. Propósito

Este documento define la política de compatibilidad de Vanilla RTX Lite.

El objetivo es que las expectativas de compatibilidad sean claras, honestas y mantenibles.

El proyecto debe evitar prometer soporte para versiones, hardware, drivers, loaders o backends de render que no hayan sido probados.

---

## 2. Filosofía de Compatibilidad

La compatibilidad debe basarse en validación, no en suposiciones.

Vanilla RTX Lite debe comunicar:

- Qué está soportado
- Qué está planeado
- Qué es experimental
- Qué es best-effort
- Qué no está soportado todavía
- Qué no ha sido probado

El proyecto debe preferir limitaciones honestas sobre afirmaciones amplias sin respaldo.

---

## 3. Versión Objetivo de Minecraft

### Línea base

La línea base de desarrollo es:

```plaintext
Minecraft Java 26.1.x
```

Esta es la primera línea de versión usada para desarrollo y validación del proyecto.

### Política de versiones futuras

Líneas posteriores como:

```plaintext
Minecraft Java 26.2+
Minecraft Java 26.3+
```

pueden soportarse después de validación.

El proyecto no debe afirmar compatibilidad automática con versiones futuras de Minecraft antes de probarlas.

---

## 4. Iris Objetivo

### Mínimo soportado

```plaintext
Iris 1.10.9+mc26.1
```

### Versión recomendada

La versión recomendada de Iris es:

```plaintext
Última versión estable de Iris validada contra la línea de Minecraft soportada actualmente.
```

### Política

El proyecto debe documentar qué versión de Iris se usó para cada release.

Una release no debe afirmar soporte para una versión de Iris que no haya sido probada.

---

## 5. Política de Loader

El loader principal será la combinación requerida por la versión de Iris validada.

El proyecto debe documentar:

```plaintext
Versión de Minecraft:
Versión de Iris:
Loader:
Versión de loader:
```

en notas de compatibilidad y notas de release.

El shader no debe prometer compatibilidad universal con loaders sin validación.

---

## 6. Backend de Render

### Backend actual

Vanilla RTX Lite actualmente apunta a:

```plaintext
OpenGL / GLSL mediante Iris
```

Esta es la línea de producción inicial del proyecto.

### Backend futuro

Una línea futura orientada a Vulkan puede explorarse cuando el ecosistema sea viable.

La línea orientada a Vulkan debe tratarse como una ruta técnica separada.

Debe reutilizar:

- Filosofía visual
- Reglas de materiales
- Escenas de validación
- Estrategia de documentación
- Principios del modelo de costo

No debe asumirse que reutilizará directamente el mismo código GLSL/OpenGL.

---

## 7. Política de la Línea OpenGL

La línea OpenGL sigue siendo importante porque muchos jugadores y stacks de mods pueden continuar usando render basado en OpenGL durante mucho tiempo.

La línea OpenGL no debe abandonarse inmediatamente si una línea orientada a Vulkan se vuelve posible.

El proyecto debe tratar el soporte OpenGL como valioso para:

- Compatibilidad
- Ecosistemas de mods existentes
- Mayor acceso para usuarios
- Releases públicas estables

---

## 8. Política de Compatibilidad GPU

### GPU de referencia

```plaintext
RTX 3070 Ti
```

Esta es la GPU principal de desarrollo y validación.

### Clase objetivo para Lite

```plaintext
GTX 1050 Ti / RX 570
```

Esta es la clase de GPU dedicada de menor potencia prevista para el preset Lite.

### Gráficos integrados

Los gráficos integrados son:

```plaintext
Best effort únicamente para v1.0.0
```

El proyecto no debe prometer soporte formal para iGPU sin validación.

---

## 9. Política por Fabricante de GPU

El proyecto debe evitar suposiciones específicas de un fabricante.

Fabricantes objetivo:

- NVIDIA
- AMD
- Intel, best-effort

Sin embargo, el comportamiento puede variar por:

- Driver
- Arquitectura de GPU
- Implementación OpenGL
- Sistema operativo
- Versión de Iris
- Stack de mods

Las notas de compatibilidad deben documentar problemas específicos por fabricante cuando se encuentren.

---

## 10. Política de Drivers

Las versiones de driver pueden afectar el comportamiento y rendimiento del shader.

Las notas de release deberían documentar eventualmente:

```plaintext
GPU:
Versión de driver:
Sistema operativo:
Versión de Minecraft:
Versión de Iris:
Preset probado:
Problemas conocidos:
```

El proyecto debe evitar afirmar que un driver está soportado salvo que haya sido probado.

---

## 11. Política de Sistema Operativo

El proyecto puede probarse principalmente en Windows durante el desarrollo inicial.

Otros sistemas operativos como Linux pueden considerarse best-effort salvo que sean validados.

Los reportes de compatibilidad deben documentar:

```plaintext
Sistema operativo:
GPU:
Driver:
Versión de Minecraft:
Versión de Iris:
```

El proyecto no debe afirmar comportamiento igual en todos los sistemas operativos sin pruebas.

---

## 12. Política de Resolución

Resolución inicial de validación:

```plaintext
1080p
```

Resoluciones superiores pueden funcionar, pero no deben afirmarse como validadas hasta que se prueben.

La resolución afecta:

- Costo de SSR
- Efectos full-screen
- Presión de memoria
- Costo de postprocesado
- Costo de buffers intermedios

---

## 13. Política de Compatibilidad con Mods

Vanilla RTX Lite está diseñado para Minecraft Java con Iris.

La compatibilidad con mods puede variar.

El proyecto debe evitar prometer compatibilidad con todos los modpacks.

Áreas potenciales de riesgo:

- Mods que alteran el render
- Mods que alteran el renderizado de bloques
- Mods que modifican iluminación
- Mods que añaden materiales personalizados
- Mods que cambian clima, cielo o atmósfera
- Modpacks pesados en rendimiento

La compatibilidad con modpacks específicos solo debe documentarse después de pruebas.

---

## 14. Compatibilidad con Resource Packs

Los resource packs pueden afectar la apariencia del shader.

La identidad visual por defecto del shader debe validarse primero contra el estilo de recursos por defecto de Minecraft.

Los resource packs pueden cambiar:

- Albedo/balance de color
- Percepción de roughness de texturas
- Legibilidad material
- Identidad de bloques
- Consistencia visual

El proyecto no debe garantizar comportamiento perfecto con resource packs arbitrarios.

---

## 15. Compatibilidad de Opciones del Shader

Algunas opciones pueden depender de otros sistemas.

El registro de opciones debe documentar dependencias como:

```plaintext
SSR requiere reflective material mask.
Reflection quality depende de material classification.
God rays dependen de atmosphere settings.
Debug views dependen de internal buffers.
```

Las opciones deben degradar correctamente cuando sus dependencias estén desactivadas.

---

## 16. Notas de Compatibilidad por Release

Toda release pública debería incluir eventualmente notas de compatibilidad.

Campos recomendados:

```plaintext
Versión de release:
Versión de Minecraft:
Versión de Iris:
Loader:
Sistema operativo:
GPU:
Driver:
Presets probados:
Problemas conocidos:
Escenarios no soportados:
```

---

## 17. Matriz de Compatibilidad

El proyecto debe mantener una matriz de compatibilidad en:

```plaintext
docs/en/14_compatibility_matrix.md
docs/es/14_matriz_de_compatibilidad.md
```

La matriz de compatibilidad debe registrar resultados reales de validación.

No debe llenarse con suposiciones.

---

## 18. Niveles de Soporte

El proyecto usa estos niveles de soporte de compatibilidad:

| Nivel | Significado |
| --- | --- |
| Supported | Probado y esperado que funcione |
| Best effort | Puede funcionar, pero no totalmente validado |
| Experimental | Inestable o en evaluación |
| Unsupported | No soportado o fuera de alcance intencionalmente |
| Unknown | No probado todavía |

---

## 19. Posición Inicial de Compatibilidad

Para la etapa actual del proyecto:

| Área | Estado |
| --- | --- |
| Minecraft Java 26.1.x | Línea base objetivo |
| Minecraft Java 26.2+ | Validación futura |
| Iris 1.10.9+mc26.1 | Línea base mínima |
| OpenGL / GLSL | Línea de producción |
| Vulkan | Ruta separada futura |
| RTX 3070 Ti | GPU de referencia de desarrollo |
| GTX 1050 Ti / RX 570 | Clase objetivo para Lite |
| Gráficos integrados | Best effort |
| Nether | Fuera del alcance v1.0.0 |
| End | Fuera del alcance v1.0.0 |

---

## 20. No Soportado para v1.0.0

Los siguientes no son objetivos soportados para v1.0.0:

- Soporte visual completo para Nether
- Soporte visual completo para End
- RTX/path tracing real
- Línea de producción Vulkan
- Sistema de actualización interno
- Detección exacta de uso de GPU
- Detección exacta de uso de VRAM
- Rendimiento garantizado en gráficos integrados
- Compatibilidad universal con modpacks
- Compatibilidad universal con resource packs

---

## 21. Áreas de Riesgo de Compatibilidad

Áreas de riesgo conocidas:

- Cambios de versión de Minecraft
- Cambios en el pipeline de Iris
- Comportamiento GLSL específico por driver
- Artefactos SSR
- Resource packs personalizados
- Modpacks pesados
- Gráficos integrados
- Transición futura a Vulkan
- Límites de clasificación material

Estos riesgos deben rastrearse y documentarse.

---

## 22. Regla de Gobierno de Compatibilidad

Cuando haya incertidumbre, elegir:

1. Soporte probado sobre soporte asumido
2. Etiquetas best-effort sobre garantías falsas
3. Problemas conocidos claros sobre problemas ocultos
4. Notas de compatibilidad sobre afirmaciones vagas
5. Estabilidad OpenGL sobre promesas Vulkan prematuras
6. Honestidad con el usuario sobre lenguaje de marketing
