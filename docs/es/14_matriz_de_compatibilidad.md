# Matriz de Compatibilidad — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Matriz de validación de compatibilidad
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento registra los resultados de validación de compatibilidad para Vanilla RTX Lite.

La matriz de compatibilidad registra lo que realmente ha sido probado.

No debe llenarse con suposiciones, expectativas o soporte futuro no validado.

---

## 2. Relación con la Política de Compatibilidad

La política de compatibilidad está definida en:

```plaintext
docs/en/07_compatibility.md
```

Ese documento explica las reglas.

Este documento registra resultados de validación.

---

## 3. Regla Central

Solo las combinaciones probadas deben marcarse como soportadas.

Si una combinación no ha sido probada, debe marcarse como:

```plaintext
Unknown
```

No marcar versiones futuras de Minecraft, versiones de Iris, GPUs, drivers o sistemas operativos como soportados antes de validarlos.

---

## 4. Niveles de Soporte

Niveles de soporte permitidos:

| Nivel | Significado |
| --- | --- |
| Supported | Probado y esperado que funcione |
| Best effort | Puede funcionar, pero no está totalmente validado |
| Experimental | Funciona parcialmente o está en evaluación |
| Unsupported | No soportado o fuera de alcance intencionalmente |
| Unknown | No probado todavía |

---

## 5. Campos de Validación

Cada entrada de compatibilidad debería incluir:

```plaintext
ID:
Fecha:
Versión del proyecto:
Versión de Minecraft:
Versión de Iris:
Loader:
Sistema operativo:
GPU:
Driver:
Resolución:
Preset:
Escena o prueba:
Resultado:
Nivel de soporte:
Problemas conocidos:
Notas:
```

---

## 6. Resumen Actual de Compatibilidad

Etapa actual:

```plaintext
Nivel 0 — Fundación
Pre-alpha
Fase documental
```

En esta etapa, todavía no se ha validado completamente compatibilidad de implementación del shader.

| Área | Estado Actual | Notas |
| --- | --- | --- |
| Minecraft Java 26.1.x | Línea base objetivo | Línea base planeada para implementación |
| Minecraft Java 26.2+ | Unknown | Requiere validación futura |
| Minecraft Java 26.3+ | Unknown | Requiere validación futura |
| Iris 1.10.9+mc26.1 | Línea base objetivo | Línea base mínima planeada |
| OpenGL / GLSL | Backend objetivo | Línea inicial de producción |
| Vulkan | Unsupported para v1.0.0 | Ruta separada futura |
| Windows | Sistema principal esperado de desarrollo | Requiere validación durante implementación |
| Linux | Unknown | Se necesitan pruebas futuras o reportes de comunidad |
| NVIDIA RTX 3070 Ti | Referencia objetivo | Hardware de desarrollo |
| GTX 1050 Ti / RX 570 | Clase objetivo Lite | Requiere validación real |
| Gráficos integrados | Best effort | Sin afirmación de soporte formal |
| Nether | Unsupported para v1.0.0 | Alcance futuro |
| End | Unsupported para v1.0.0 | Alcance futuro |

---

## 7. Compatibilidad con Minecraft

| Versión de Minecraft | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| 26.1.x | Línea base objetivo | Unknown | Objetivo planeado de implementación |
| 26.2+ | Validación futura | Unknown | No afirmar soporte antes de pruebas |
| 26.3+ | Validación futura | Unknown | No afirmar soporte antes de pruebas |

---

## 8. Compatibilidad con Iris

| Versión de Iris | Versión de Minecraft | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- | --- |
| 1.10.9+mc26.1 | 26.1.x | Línea base objetivo | Unknown | Línea base mínima planeada |
| Última release estable validada | Línea soportada actual | Validación futura | Unknown | Debe actualizarse por release |

---

## 9. Compatibilidad con Loader

| Loader | Versión | Versión de Minecraft | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- | --- | --- |
| TBD | TBD | 26.1.x | No validado | Unknown | Depende del setup validado de Iris |

---

## 10. Compatibilidad con Sistema Operativo

| Sistema Operativo | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| Windows | Objetivo principal de desarrollo | Unknown | Primer entorno esperado de validación |
| Linux | No validado | Unknown | Se requieren pruebas futuras o reportes de comunidad |
| macOS | No validado | Unknown | Sin afirmación de soporte |

---

## 11. Compatibilidad con GPU

| GPU / Clase | Fabricante | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- | --- |
| RTX 3070 Ti | NVIDIA | Referencia objetivo | Unknown | Hardware principal de desarrollo |
| GTX 1050 Ti class | NVIDIA | Clase objetivo Lite | Unknown | Requiere validación real |
| RX 570 class | AMD | Clase objetivo Lite | Unknown | Requiere validación real |
| Gráficos integrados modernos | Intel/AMD | Best effort | Unknown | Sin afirmación formal de soporte v1.0.0 |

---

## 12. Compatibilidad por Resolución

| Resolución | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| 1080p | Línea base objetivo | Unknown | Resolución inicial de validación |
| 1440p | No validado | Unknown | Requiere pruebas futuras |
| 4K | No validado | Unknown | Probablemente mayor costo; sin afirmaciones todavía |

---

## 13. Compatibilidad por Preset

| Preset | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| Lite | Planeado | Unknown | Objetivo de menor costo |
| Balanced | Planeado | Unknown | Objetivo visual de referencia |
| Quality | Planeado | Unknown | Objetivo de mayor fidelidad |
| Experimental | Planeado | Experimental | No representa identidad estable |
| Custom | Planeado | Unknown | Debe mantenerse acotado |

---

## 14. Compatibilidad por Dimensión

| Dimensión | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| Overworld | Alcance objetivo | Unknown | Requerido para v1.0.0 |
| Nether | Fuera de alcance v1.0.0 | Unsupported | Hito futuro |
| End | Fuera de alcance v1.0.0 | Unsupported | Hito futuro |

---

## 15. Compatibilidad con Resource Packs

| Tipo de Resource Pack | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| Recursos default de Minecraft | Línea base objetivo | Unknown | Objetivo principal de validación |
| Packs similares a Vanilla | No validado | Best effort | Puede funcionar si la identidad material se mantiene cercana |
| Packs de alta resolución | No validado | Unknown | Pueden afectar balance visual y rendimiento |
| Packs PBR | No validado | Unknown | No son objetivo formal para v1.0.0 |

---

## 16. Compatibilidad con Mods

| Mod / Tipo de Mod | Estado | Nivel de Soporte | Notas |
| --- | --- | --- | --- |
| Stack requerido por Iris | Planeado | Unknown | Debe validarse |
| Mods que alteran render | No validado | Unknown | Riesgo potencial de compatibilidad |
| Mods que alteran iluminación | No validado | Unknown | Riesgo potencial de compatibilidad |
| Modpacks pesados | No validado | Unknown | Sin afirmación de compatibilidad universal |
| Mods con bloques personalizados | No validado | Unknown | El mapeo material puede no aplicar |

---

## 17. Registro de Validación

Usar esta sección para registrar resultados reales de prueba.

### Plantilla de Entrada

```plaintext
ID:
Fecha:
Versión del proyecto:
Versión de Minecraft:
Versión de Iris:
Loader:
Sistema operativo:
GPU:
Driver:
Resolución:
Preset:
Escena o prueba:
Resultado:
Nivel de soporte:
Problemas conocidos:
Notas:
```

---

## 18. Entradas Iniciales de Validación

### COMP-001 — Prueba de carga del shader baseline de Nivel 1 en Minecraft 1.21.1

```plaintext
ID: COMP-001
Fecha: 2026-05-06
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 1.21.1
Loader: NeoForge 21.1.212
Versión de Iris: 1.8.12-snapshot+mc1.21.1-local
Versión de Sodium: 0.6.13+mc1.21.1
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 4.6
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Detección inicial y prueba de carga del shader pack
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: Ligero aumento de brillo frente a Vanilla.
Notas: El shader apareció en la lista de shaders de Iris, cargó sin pantalla negra, creó pipeline en Overworld y renderizó una imagen similar a Vanilla. No se observaron errores de compilación shader en el log proporcionado.
```

Esta entrada confirma únicamente una prueba inicial de humo para Nivel 1.

No implica soporte estable para Minecraft 1.21.1, versiones anteriores, versiones futuras, modpacks pesados o todo hardware.

---

### COMP-002 — Prueba de carga del shader baseline de Nivel 1 en Minecraft 26.1.2

```plaintext
ID: COMP-002
Fecha: 2026-05-06
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Detección inicial, prueba de carga del shader pack y revisión de ítem en mano
Resultado: Pass con problema visual conocido
Nivel de soporte: Experimental
Problemas conocidos: Las semillas de trigo en mano se renderizan casi negras cuando el shader está activado.
Notas: El shader apareció en la lista de shaders de Iris, cargó en la línea objetivo 26.1.x, creó pipeline en Overworld y se activó correctamente. El error NBT/datapack observado previamente parece estar relacionado con la carga/actualización del mundo anterior `RTX Vanilla`, no con la compilación del shader.
```

Esta entrada confirma que el baseline de Nivel 1 carga en la línea objetivo 26.1.x.

No implica soporte estable todavía.

El problema de renderizado de ítems en mano debe resolverse antes de considerar Nivel 1 visualmente limpio.

---

### COMP-003 — Validación del pass mínimo de mano en Minecraft 26.1.2

```plaintext
ID: COMP-003
Fecha: 2026-05-06
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Renderizado de semillas de trigo en mano después de agregar pass mínimo de mano
Resultado: Pass con limitación visual
Nivel de soporte: Experimental
Problemas conocidos: Las semillas de trigo en mano ya no se renderizan casi negras, pero la iluminación del ítem en mano aparece demasiado brillante y sin sombreado correcto.
Notas: El pass mínimo de mano corrigió el problema crítico de ítem negro observado en COMP-002. Todavía se requiere manejo adicional de iluminación/lightmap/sombras antes de considerar correcto el renderizado de ítems en mano.
```

Esta entrada confirma que el pass mínimo de mano resuelve el problema de semillas de trigo casi negras en mano.

No implica calidad final de iluminación para ítems en mano.

---

### COMP-004 — Validación de debug views baseline en Minecraft 26.1.2

```plaintext
ID: COMP-004
Fecha: 2026-05-07
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Validación manual de modos debug baseline
Resultado: Pass
Nivel de soporte: Experimental
Modos debug probados: VRTX_DEBUG_FINAL_PASS_MARKER y VRTX_DEBUG_UV_GRADIENT
Problemas conocidos: Los modos debug son internos y todavía no están expuestos mediante opciones de Iris.
Notas: El marcador de final pass produjo una superposición magenta visible, confirmando que `final.fsh` controla la salida final. El modo de gradiente UV produjo un gradiente de coordenadas en pantalla completa, confirmando que el enrutamiento de debug recibe correctamente coordenadas UV de pantalla.
```

Esta entrada confirma que el enrutamiento interno de debug views de Nivel 1 funciona.

Los modos debug deben permanecer desactivados por defecto.

---

### COMP-005 — Validación de lightmap mínimo para mano en Minecraft 26.1.2

```plaintext
ID: COMP-005
Fecha: 2026-05-20
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Renderizado de semillas de trigo en mano después de agregar soporte mínimo de lightmap
Resultado: Pass con limitación visual restante
Nivel de soporte: Experimental
Problemas conocidos: La iluminación del ítem en mano mejoró, pero todavía no es final. Aún no se implementan iluminación material-aware completa, interacción con sombras ni refinamiento adecuado de ítems en mano.
Notas: El soporte mínimo de lightmap para mano mantiene visibles las semillas de trigo en mano y mejora la apariencia previa demasiado plana/full-bright. Esto confirma progreso frente a COMP-003, pero el renderizado de mano sigue siendo una implementación baseline de Nivel 1.
```

Esta entrada confirma que el soporte mínimo de lightmap mejora el renderizado de ítems en mano.

No implica calidad final de iluminación para ítems en mano.

---

### COMP-006 — Validación de opción debug en Iris sobre Minecraft 26.1.2

```plaintext
ID: COMP-006
Fecha: 2026-05-20
Versión del proyecto: Rama baseline de Nivel 1 / pre-v0.2.0-prealpha
Shader pack: VanillaRTXLite-Level1-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Validación de opción de shader en Iris para debug view baseline
Resultado: Pass
Nivel de soporte: Experimental
Modos debug probados: Apagado, Marcador de final pass, Gradiente UV
Problemas conocidos: Los debug views están pensados solo para validación y no son modos visuales de gameplay.
Notas: La opción baseline de debug view apareció en las opciones de shader de Iris y permitió alternar correctamente entre salida normal, superposición de marcador de final pass y salida de gradiente UV. Esto confirma que la ruta de opciones del shader, las etiquetas de idioma, el registro de opciones y el enrutamiento de debug en final pass funcionan en conjunto.
```

Esta entrada confirma que la opción debug view de Nivel 1 está expuesta y funcional mediante las opciones de shader de Iris.

Los modos debug deben permanecer apagados para gameplay normal.

---

### COMP-007 — Validación de compilación del núcleo material en Minecraft 26.1.2

```plaintext
ID: COMP-007
Fecha: 2026-05-20
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.19.2
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 5060 Laptop GPU
Driver: NVIDIA 596.36
OpenGL: 3.3.0
Resolución: No registrada
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Validación de compilación de constantes de categoría material y helper material
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: La clasificación material todavía no está conectada a datos reales de bloques/materiales.
Notas: El shader pack cargó correctamente después de agregar constantes de categorías materiales, IDs materiales, funciones base de helper material y el include de `materials.glsl`. No se esperaba ni se observó cambio visual.
```

Esta entrada confirma que el helper inicial del núcleo material de Nivel 2 compila correctamente.

No implica clasificación material final ni render material-aware todavía.

---

## 19. Riesgos Conocidos de Compatibilidad

Áreas conocidas de riesgo de compatibilidad:

- Cambios de versión de Minecraft
- Cambios en el pipeline de Iris
- Diferencias GLSL por driver
- Comportamiento OpenGL específico por fabricante
- Rendimiento en gráficos integrados
- Modpacks pesados
- Resource packs que alteren identidad visual
- Bloques personalizados sin mapeo material
- Transición futura a Vulkan

Ver:

```plaintext
docs/en/11_known_risks.md
```

---

## 20. Actualización de Esta Matriz

Actualizar esta matriz cuando:

- Se pruebe una nueva versión de Minecraft
- Se pruebe una nueva versión de Iris
- Se pruebe una nueva GPU
- Se pruebe un nuevo sistema operativo
- Se valide un preset
- Se encuentre un problema de compatibilidad
- Se corrija un problema conocido
- Se prepare una release pública

No actualizar esta matriz basándose únicamente en suposiciones.

---

## 21. Regla de Gobierno de la Matriz de Compatibilidad

Cuando haya incertidumbre, elegir:

1. Unknown sobre soporte asumido
2. Resultados probados sobre expectativas
3. Notas específicas sobre afirmaciones vagas
4. Etiquetas best-effort sobre garantías falsas
5. Problemas conocidos sobre problemas ocultos
6. Honestidad con el usuario sobre confianza de marketing
