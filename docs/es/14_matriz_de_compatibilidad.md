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

### COMP-008 — Validación de la vista de categoría material en Minecraft 26.1.2

```plaintext
ID: COMP-008
Fecha: 2026-08-02
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 1 opción modificada
Dimensión: Overworld
Escena o prueba: Enrutamiento de la vista de Categoría Material y fallback seguro para material desconocido
Resultado: Pass
Nivel de soporte: Experimental
Modos debug probados: Apagado, Categoría Material
Problemas conocidos: La clasificación real de bloques/materiales todavía no está conectada, por lo que el ID material actual permanece como Unknown y produce una salida debug uniforme casi negra.
Notas: El shader pack cargó sin errores de compilación del shader. Categoría Material produjo la salida uniforme esperada para la categoría Unknown y al volver Debug View a Apagado se restauró la salida normal. El latest.log de Minecraft confirmó creaciones repetidas y exitosas del pipeline con el paquete de prueba activo.
```

Esta entrada confirma que la ruta debug de categoría material de Nivel 2 está expuesta, compila y conserva el fallback conservador para material desconocido.

No implica todavía clasificación material por bloque.

---

### COMP-009 — Validación de la máscara reflectiva en Minecraft 26.1.2

```plaintext
ID: COMP-009
Fecha: 2026-08-02
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 1 opción modificada
Dimensión: Overworld
Escena o prueba: Enrutamiento de Máscara Reflectiva y fallback conservador para material desconocido
Resultado: Pass
Nivel de soporte: Experimental
Modos debug probados: Apagado, Máscara Reflectiva
Problemas conocidos: La clasificación real de bloques/materiales todavía no está conectada, por lo que el material Unknown actual produce una máscara uniforme negra y no reflectiva.
Notas: El shader pack cargó normalmente antes de activar Máscara Reflectiva. Al activar el modo se reconstruyó el pipeline del Overworld sin errores de compilación del shader y se produjo la máscara negra uniforme esperada, conservando el HUD. El latest.log de Minecraft confirmó el paquete de prueba y la creación exitosa del pipeline.
```

Esta entrada confirma que la ruta debug de máscara reflectiva de Nivel 2 compila y asigna por defecto comportamiento no reflectivo a los materiales desconocidos.

No implica todavía clasificación reflectiva real por bloque.

---

### COMP-010 — Validación de la vista de rugosidad en Minecraft 26.1.2

```plaintext
ID: COMP-010
Fecha: 2026-08-02
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 1 opción modificada
Dimensión: Overworld
Escena o prueba: Enrutamiento de la vista de Rugosidad y fallback totalmente rugoso para material desconocido
Resultado: Pass
Nivel de soporte: Experimental
Modos debug probados: Rugosidad
Problemas conocidos: La clasificación real de bloques/materiales todavía no está conectada, por lo que el material Unknown actual usa roughness 1.0 y produce una salida debug uniforme blanca.
Notas: Al activar Rugosidad se reconstruyó el pipeline del Overworld sin errores de compilación del shader y se produjo la salida blanca uniforme esperada, conservando el HUD. El latest.log de Minecraft confirmó creaciones repetidas y exitosas del pipeline con el paquete de prueba activo.
```

Esta entrada confirma que la ruta debug de rugosidad de Nivel 2 compila y asigna por defecto comportamiento totalmente rugoso a los materiales desconocidos.

No implica todavía clasificación real de rugosidad por bloque.

---

### COMP-011 — Validación de compilación del helper Fresnel acotado en Minecraft 26.1.2

```plaintext
ID: COMP-011
Fecha: 2026-08-02
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Include del helper Fresnel acotado y comprobación de regresión visual baseline
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El helper Fresnel todavía no está conectado a la salida material ni de reflejos.
Notas: El shader pack cargó con `fresnel.glsl` incluido en el final pass. Iris creó el pipeline del Overworld sin errores de compilación del shader y la imagen baseline permaneció sin cambios con Debug View apagado.
```

Esta entrada confirma que el helper Fresnel acotado estilo Schlick compila en el pipeline GLSL actual de Iris sin cambiar la salida visual.

No valida todavía la respuesta Fresnel específica por material.

---

### COMP-012 — Validación de compilación de intensidades Fresnel por material en Minecraft 26.1.2

```plaintext
ID: COMP-012
Fecha: 2026-08-03
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Intensidades Fresnel por material y comprobación de regresión visual baseline nocturna
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: Las intensidades Fresnel por material todavía no están conectadas a una salida visible Fresnel ni de reflejos.
Notas: Iris cargó el shader pack de prueba y creó el pipeline del Overworld sin errores de compilación del shader. La imagen baseline nocturna posterior permaneció visualmente estable con Debug View apagado.
```

Esta entrada confirma que las intensidades Fresnel por material compilan en el pipeline GLSL actual de Iris sin cambiar la salida baseline nocturna.

No valida todavía una respuesta Fresnel visible por material.

---

### COMP-013 — Validación inicial de datos materiales de terreno y suite debug en Minecraft 26.1.2

```plaintext
ID: COMP-013
Fecha: 2026-08-03
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas para baseline y 1 opción modificada para cada debug view
Dimensión: Overworld
Escena o prueba: Validación exterior diurna y de costa con Debug apagado, Categoría material, Máscara reflectiva, Rugosidad y Factor Fresnel
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El transporte material inicial cubre solamente terreno. Las entidades, la mano del jugador y otra geometría no soportada todavía no proporcionan datos materiales.
Notas: Iris cargó el archivo de prueba corregido y recreó el pipeline del Overworld para cada modo debug sin errores de compilación del shader. La vista Categoría material mostró el agua mapeada en azul, el terreno mate mapeado en gris y las regiones desconocidas en negro. La Máscara reflectiva mantuvo negras las regiones mate y desconocidas mientras marcó el agua mapeada en blanco. La vista Rugosidad mostró rugosidad alta en terreno mate y menor rugosidad en el agua. La vista Factor Fresnel mantuvo negro el terreno mate y concentró la respuesta acotada sobre el agua en ángulos rasantes. Debug apagado restauró la salida baseline normal. Una observación transitoria sobre los ojos de mobs durante una sesión anterior con fallback por paquete inválido no se reprodujo con el shader pack válido.
```

Esta entrada confirma que el buffer material inicial de terreno llega al final pass y controla las cuatro debug views materiales de Nivel 2 con fallbacks conservadores.

No valida reflejos, salida specular ni cobertura completa de bloques y geometría.

---

### COMP-014 — Validación debug de una alineación material específica en Minecraft 26.1.2

```plaintext
ID: COMP-014
Fecha: 2026-08-03
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas para baseline y 1 opción modificada para cada debug view
Dimensión: Overworld
Escena o prueba: Alineación costera diurna con vidrio, vidrio tintado, amatista, oro, etapas de oxidación del cobre, hielo normal y packed o blue ice; Debug apagado, Categoría material, Máscara reflectiva y Factor Fresnel
Resultado: Parcial
Nivel de soporte: Experimental
Problemas conocidos: Los bloques tipo oro, las etapas intermedias de oxidación del cobre, packed o blue ice y los clusters de amatista no están incluidos en el mapeo conservador inicial y usan el fallback seguro Unknown. El transporte material inicial continúa limitado al terreno.
Notas: Iris recreó el pipeline del Overworld para cada modo debug seleccionado sin errores de compilación ni link del shader. El baseline normal permaneció estable. Las variantes de vidrio mapeadas, el hielo normal, el cobre fresco y totalmente oxidado, los bloques de amatista, el agua y el terreno mate circundante produjeron las salidas esperadas de categoría y permiso. La alineación también expuso variantes aprobadas aún no mapeadas: permanecieron oscuras en Categoría material, no reflectivas en Máscara reflectiva, totalmente rugosas y con Fresnel cero mediante el fallback conservador Unknown.
```

Esta entrada confirma que los mapeos aprobados iniciales permanecen conservadores y que las variantes no soportadas fallan de forma segura en lugar de heredar permiso de reflexión.

Identifica la siguiente tarea acotada del núcleo material: ampliar la cobertura vanilla aprobada sin debilitar la protección mate.

---

### COMP-015 — Validación de cobertura ampliada de materiales aprobados en Minecraft 26.1.2

```plaintext
ID: COMP-015
Fecha: 2026-08-03
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas para baseline y 1 opción modificada para cada debug view
Dimensión: Overworld
Escena o prueba: Alineación costera diurna después de ampliar los mapeos de oro, cobre, amatista y hielo; Categoría material, Máscara reflectiva, Rugosidad, Factor Fresnel y Debug apagado
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El transporte material continúa limitado al terreno. El cobre exposed comparte actualmente el perfil del cobre fresh, mientras el cobre weathered comparte el perfil del cobre oxidized. El resource pack Xray_Ultimate estaba activo, por lo que Debug apagado confirma la restauración de salida pero no establece una baseline visual con recursos por defecto.
Notas: Iris cargó el archivo de prueba actualizado y recreó el pipeline del Overworld para las cuatro debug views materiales y Debug apagado sin errores de compilación ni link del shader. Categoría material mostró las familias de vidrio y hielo en azul, los bloques y clusters de amatista en morado, el oro y todas las etapas de oxidación del cobre probadas en naranja, y el terreno mate en gris. Máscara reflectiva concedió permiso al agua y a las familias de vidrio y hielo, manteniendo negros el oro, cobre, amatista y terreno mate. Rugosidad produjo la separación en escala de grises esperada entre perfiles de vidrio, cristalinos, metálicos, hielo y mate. Fresnel permaneció acotado y dependiente del ángulo, con respuesta frontal baja y respuesta cero sobre materiales mate protegidos. Debug apagado restauró la salida normal de gameplay.
```

Esta entrada confirma que los mapeos vanilla aprobados ampliados llegan a todas las debug views materiales de Nivel 2 mientras conservan un permiso de reflexión conservador y la protección mate.

No valida highlights specular visibles, reflejos, SSR, geometría no soportada ni la baseline visual con recursos por defecto.

---

### COMP-016 — Baseline de la alineación material con recursos por defecto en Minecraft 26.1.2

```plaintext
ID: COMP-016
Fecha: 2026-08-03
Versión del proyecto: Rama núcleo material de Nivel 2 / pre-v0.3.0-prealpha
Shader pack: VanillaRTXLite-Level2-Test.zip
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas
Dimensión: Overworld
Escena o prueba: Alineación costera diurna con Debug apagado y los recursos por defecto de Minecraft
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El transporte material continúa limitado al terreno. La respuesta specular visible basada en materiales y los reflejos están fuera del alcance de Nivel 2 y continúan sin implementar.
Notas: Minecraft recargó el resource manager únicamente con los recursos vanilla y los recursos requeridos por Fabric, Iris y Sodium; ningún resource pack externo permaneció activo. La sesión existente de Vanilla RTX Lite continuó activa con Debug apagado. La alineación capturada conservó las texturas vanilla de los bloques, la legibilidad del vidrio transparente, las distintas etapas de oxidación del cobre, la identidad de la amatista y el hielo, la arena mate, el agua, la vegetación y el render normal del HUD. La recarga de recursos y la captura no produjeron errores de compilación ni link del shader.
```

Esta entrada establece la baseline visual limpia con recursos por defecto para la alineación material ampliada de Nivel 2.

Valida la salida normal con Debug apagado, no el comportamiento futuro de specular visible ni reflejos.

---

### COMP-017 — Validación del paquete RC1 de v0.3.0-prealpha y arranque en frío en Minecraft 26.1.2

```plaintext
ID: COMP-017
Fecha: 2026-08-03
Versión del proyecto: Candidato de release 1 de v0.3.0-prealpha
Shader pack: VanillaRTXLite-v0.3.0-prealpha-rc1.zip
SHA-256 del shader pack: F72DF77F0838AEEAA4B500AC4E8A11F94A861BD7B7B6317F81D77FDE2541D98C
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, 0 opciones modificadas para la baseline de arranque en frío y 1 opción modificada para Categoría material
Dimensión: Overworld
Escena o prueba: Inspección del archivo candidato limpio, instalación, acceso a opciones del shader, comprobación de Categoría material y posterior reinicio completo de la aplicación con Debug apagado
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: La validación cubre un único entorno Windows, NVIDIA e Iris. El transporte material continúa limitado al terreno y los reflejos visibles están fuera del hito de Nivel 2.
Notas: El archivo candidato contuvo 27 entradas ZIP con separadores forward slash y la raíz shaders requerida, entrypoints de runtime, shaders.properties, mapeos de bloques, README, licencia MIT del código y licencia de documentación. No incluyó metadata Git, el árbol de documentación de desarrollo, el directorio build, ejemplos ni capturas. Las copias del repositorio e instalada tuvieron hashes SHA-256 coincidentes. Iris abrió las opciones del candidato y recreó el pipeline del Overworld para Categoría material sin errores del shader. En el reinicio completo posterior de Minecraft, Iris seleccionó directamente el archivo RC1 con Debug apagado y cero opciones modificadas, el resource manager cargó solamente recursos vanilla y los requeridos por Fabric, Iris y Sodium, y el pipeline del Overworld compiló correctamente. La alineación material capturada conservó la baseline aceptada con recursos por defecto.
```

Esta entrada acepta el archivo RC1 limpio como candidato de paquete validado para el hito Núcleo Material de Nivel 2.

La promoción hacia ramas de integración o release y la creación del tag `v0.3.0-prealpha` permanecen como operaciones Git separadas.

---

### COMP-018 — Validación de la vista de peso material de reflexión en Minecraft 26.1.2

```plaintext
ID: COMP-018
Fecha: 2026-08-05
Versión del proyecto: Desarrollo de v0.4.0-alpha
Shader pack: VanillaRTXLite-Level3-ReflectionWeight-Test-corrected.zip
SHA-256 del shader pack: 94552FD7B0C75A1E73D8B6EA0A7CB23010E1A2FF5B858FF4C40509D520715D37
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Custom, alternando entre 0 opciones modificadas para Debug apagado y 1 opción modificada para Peso de reflexión
Dimensión: Overworld
Escena o prueba: Alineación de materiales aprobados observada en ángulo rasante con Peso de reflexión activado, seguida por la restauración de Debug apagado
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El archivo de prueba inicial usó entradas ZIP con backslash de Windows e Iris lo rechazó antes de compilar el shader. El archivo corregido contiene entradas con forward slash. El transporte material continúa limitado al terreno, el coeficiente crudo es intencionalmente oscuro en ángulos frontales y todavía no se implementan muestreo de reflejos visibles, composición ni SSR.
Notas: Iris seleccionó el archivo corregido y recreó seis veces el pipeline del Overworld mientras el usuario alternaba la opción de depuración. El log registró tres sesiones con una opción modificada y dos sesiones posteriores con Debug apagado, sin errores de compilación, enlace, programa inválido ni carga del paquete corregido. La captura de Peso de reflexión mostró respuesta gris acotada en superficies reflectivas aprobadas, mientras los materiales no aprobados y el terreno mate protegido permanecieron negros. La recreación del pipeline con Debug apagado también quedó confirmada en el log.
```

Esta entrada valida el coeficiente material acotado de reflexión de Nivel 3 y su ruta de depuración.

No valida reflejos visibles, una fuente de reflejos, composición de reflejos ni SSR.

---

### COMP-019 — Validación del fallback ambiental de reflexión en Minecraft 26.1.2

```plaintext
ID: COMP-019
Fecha: 2026-08-05
Versión del proyecto: Desarrollo de v0.4.0-alpha
Shader pack: VanillaRTXLite-Level3-EnvironmentReflection-Test.zip
SHA-256 del shader pack: D15DA7CDF8282A173EF09492C62C211FABA867CE01C06070FDB6D70FAD17B903
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Baseline interno Balanced, alternando entre Debug apagado y Contribución de reflexión
Dimensión: Overworld
Escena o prueba: Alineación diurna de playa y lago con agua, vidrio, variantes de hielo, amatista, arena y terreno mate circundante
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: La fuente ambiental es una aproximación contenida del color del cielo y no reproduce objetos en screen space, terreno, oclusión ni SSR. La salida debug de contribución es intencionalmente muy oscura en ángulos frontales. El transporte material continúa limitado a rutas de terreno soportadas, con un fallback conservador para la mano.
Notas: Iris seleccionó el paquete y creó siete veces el pipeline del Overworld durante los cambios de opción, sin errores de compilación, enlace, programa inválido ni carga para este archivo. Las capturas con Debug apagado conservaron materiales vanilla legibles, mientras las capturas de Contribución de reflexión aislaron una contribución fría tenue en superficies aprobadas de agua, vidrio y hielo. La arena, vegetación, amatista y demás materiales no aprobados o mate no recibieron la contribución de reflexión.
```

Esta entrada valida el primer fallback visible de cielo/entorno del Nivel 3, su ruta acotada de composición y su vista debug de contribución.

No valida SSR, reflejos de objetos en screen space, ajuste final de reflejos, respuesta bajo lluvia ni rendimiento en GPU adicionales.

---

### COMP-020 — Validación por clima y hora del fallback ambiental de reflexión en Minecraft 26.1.2

```plaintext
ID: COMP-020
Fecha: 2026-08-06
Versión del proyecto: Desarrollo de v0.4.0-alpha
Shader pack: VanillaRTXLite-Level3-EnvironmentReflection-Test.zip
SHA-256 del shader pack: D15DA7CDF8282A173EF09492C62C211FABA867CE01C06070FDB6D70FAD17B903
Versión de Minecraft: 26.1.2
Loader: Fabric Loader 0.18.6
Versión de Iris: 1.10.9+mc26.1.1
Versión de Sodium: 0.8.9+mc26.1.1
Versión de Java: Java 25
Sistema operativo: Windows 11
GPU: NVIDIA GeForce RTX 3070 Ti
Driver: NVIDIA 610.88
OpenGL: 3.3.0
Resolución: 1920x1080
Preset/Profile: Baseline interno Balanced, alternando entre Debug apagado y Contribución de reflexión
Dimensión: Overworld
Escena o prueba: Alineación fija de agua, vidrio, hielo y terreno mate al atardecer, a medianoche y durante lluvia
Resultado: Pass
Nivel de soporte: Experimental
Problemas conocidos: El fallback se vuelve casi negro al atardecer, a medianoche y bajo lluvia oscura porque sigue directamente el color de cielo de baja luminancia de Iris. Esta respuesta conservadora evita brillo nocturno falso, pero puede requerir ajuste artístico posterior. Continúa siendo una aproximación ambiental plana sin SSR, objetos de escena, terreno, oclusión, humedad ni lógica de reflexión específica para lluvia.
Notas: La sesión registró cinco ciclos completos de Contribución de reflexión a Debug apagado. Cada cambio recreó el pipeline del Overworld para el paquete esperado sin errores de compilación, enlace, programa inválido ni carga. Las capturas normales permanecieron legibles en las tres condiciones. Las capturas de contribución se oscurecieron de forma consistente con el entorno y permanecieron limitadas a superficies reflectivas aprobadas; el terreno mate protegido no adquirió salida de reflexión.
```

Esta entrada valida el comportamiento conservador por hora del día y lluvia del fallback ambiental inicial del Nivel 3.

No valida humedad por lluvia, SSR, ajuste final en baja luz, normales animadas del agua ni rendimiento en GPU adicionales.

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
