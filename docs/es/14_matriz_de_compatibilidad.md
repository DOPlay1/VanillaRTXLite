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

Todavía no existen entradas completas de validación de compatibilidad del shader.

El proyecto se encuentra actualmente en fase de fundación documental.

Las primeras entradas deberían añadirse durante el Nivel 1 o posterior, cuando exista un pipeline mínimo de shader.

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
