# Riesgos Conocidos — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Registro de riesgos
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento identifica riesgos conocidos para Vanilla RTX Lite.

El objetivo no es hacer que el proyecto parezca libre de problemas.

El objetivo es documentar riesgos desde temprano, diseñar alrededor de ellos y evitar prometer de más.

Un proyecto serio de shader debe comprender claramente sus riesgos técnicos, visuales, de compatibilidad, rendimiento, documentación y alcance.

---

## 2. Filosofía de Riesgos

Los riesgos deben documentarse, no ocultarse.

El proyecto debe preferir:

- Limitaciones honestas
- Estrategias claras de mitigación
- Afirmaciones conservadoras de release
- Validación antes de promesas
- Control de alcance
- Decisiones trazables

Un riesgo no es automáticamente un fracaso.

Un riesgo oculto se convierte en un problema futuro.

---

## 3. Niveles de Severidad

El proyecto usa estos niveles de severidad:

| Severidad | Significado |
| --- | --- |
| Low | Manejable, poco probable que bloquee progreso |
| Medium | Importante, requiere atención |
| High | Puede bloquear un hito si se ignora |
| Critical | Puede invalidar una suposición mayor del proyecto |

---

## 4. Niveles de Probabilidad

El proyecto usa estos niveles de probabilidad:

| Probabilidad | Significado |
| --- | --- |
| Low | Poco probable, pero posible |
| Medium | Razonablemente posible |
| High | Probable si no se mitiga |

---

## 5. Valores de Estado del Riesgo

Estados permitidos:

| Estado | Significado |
| --- | --- |
| Open | Riesgo activo |
| Monitoring | Riesgo conocido bajo observación |
| Mitigated | Riesgo con estrategia de mitigación |
| Accepted | Riesgo entendido y aceptado |
| Closed | Riesgo que ya no aplica |

---

## 6. Resumen de Riesgos

| ID | Riesgo | Severidad | Probabilidad | Estado |
| --- | --- | --- | --- | --- |
| RISK-001 | Limitaciones de clasificación material | High | Medium | Open |
| RISK-002 | Artefactos y limitaciones de SSR | High | High | Open |
| RISK-003 | Costo de rendimiento en GPUs de menor potencia | High | Medium | Open |
| RISK-004 | Materiales mate reflejando accidentalmente | Critical | Medium | Open |
| RISK-005 | Expansión de alcance antes de Overworld v1.0.0 | High | Medium | Monitoring |
| RISK-006 | Desincronización documental entre inglés y español | Medium | Medium | Open |
| RISK-007 | Cambios de versión en Iris o Minecraft | High | Medium | Open |
| RISK-008 | Comportamiento GLSL específico por driver | Medium | Medium | Open |
| RISK-009 | Presets convirtiéndose en estilos inconsistentes | Medium | Medium | Open |
| RISK-010 | Personalización excesiva rompiendo identidad visual | High | Medium | Open |
| RISK-011 | Expectativas Vulkan prematuras | Medium | Low | Monitoring |
| RISK-012 | Falta de capturas de validación al inicio | Medium | High | Open |
| RISK-013 | Código generado por IA violando reglas del proyecto | High | Medium | Open |
| RISK-014 | Expectativas del usuario por el término “RTX” | Medium | Medium | Open |
| RISK-015 | Errores de empaquetado de release | Medium | Medium | Open |

---

## 7. RISK-001 — Limitaciones de Clasificación Material

### Descripción

Es posible que el shader no siempre tenga acceso perfecto a datos de bloque o material.

El mapeo material puede requerir aproximaciones dependiendo de lo que exponga el pipeline Iris/OpenGL.

### Impacto

Si la clasificación material es incompleta o imprecisa, el shader puede:

- Aplicar comportamiento material incorrecto
- Fallar al identificar superficies reflectivas
- Tratar accidentalmente superficies mate como elegibles para efectos
- Requerir fallbacks conservadores

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Preferir comportamiento material conservador.
- Clasificar materiales inciertos como mate por defecto.
- Usar debug views para validar categorías materiales.
- Documentar limitaciones de mapeo material.
- Evitar efectos fuertes sin compuertas materiales confiables.

### Documentos relacionados

```plaintext
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/08_code_conventions.md
```

---

## 8. RISK-002 — Artefactos y Limitaciones de SSR

### Descripción

Las screen-space reflections solo pueden reflejar información disponible en pantalla.

SSR puede fallar, distorsionarse, desaparecer o producir artefactos cuando la información reflejada no está disponible.

### Impacto

Los artefactos SSR pueden aparecer en:

- Agua
- Vidrio
- Hielo
- Superficies pulidas

Problemas comunes:

- Reflejos faltantes
- Artefactos en bordes
- Ghosting
- Reflejos ruidosos
- Saltos o popping de reflejos
- Fallback incorrecto de reflejo

### Severidad

High

### Probabilidad

High

### Mitigación

- Controlar SSR por material.
- Usar Fresnel y roughness para reducir visibilidad de artefactos.
- Proveer comportamiento fallback.
- Reducir calidad SSR en Lite.
- Evitar afirmar que SSR equivale a ray tracing real.
- Validar SSR en escenas de agua y vidrio.

### Documentos relacionados

```plaintext
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/06_performance_targets.md
```

---

## 9. RISK-003 — Costo de Rendimiento en GPUs de Menor Potencia

### Descripción

El preset Lite apunta a GPUs dedicadas de menor potencia como GTX 1050 Ti / RX 570, pero el rendimiento dependerá de resolución, distancia de render, drivers, mods y features activas.

### Impacto

El shader puede volverse demasiado costoso si:

- SSR se ejecuta demasiado ampliamente
- Se abusa de efectos full-screen
- Los sample counts son muy altos
- Los reflejos no están correctamente controlados
- Los efectos atmosféricos se vuelven demasiado pesados
- Los presets no reducen suficiente costo

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Mantener Lite como objetivo serio.
- Controlar efectos costosos por material y preset.
- Usar cost tiers en lugar de precisión falsa.
- Documentar opciones costosas.
- Proveer fallbacks.
- Validar primero a 1080p.

### Documentos relacionados

```plaintext
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

## 10. RISK-004 — Materiales Mate Reflejando Accidentalmente

### Descripción

Este es uno de los riesgos más importantes.

Si tierra, piedra, madera, hojas, arena o grava se vuelven reflectivas, el shader rompe su filosofía central.

### Impacto

Esto dañaría:

- Identidad Vanilla
- Coherencia material
- Confianza visual
- Diferenciación del proyecto
- Credibilidad de validación

### Severidad

Critical

### Probabilidad

Medium

### Mitigación

- Clasificar materiales inciertos como mate por defecto.
- Usar reflective masks.
- Añadir debug view de categoría material y elegibilidad reflectiva.
- Validar escenas de estrés de materiales mate.
- Evitar lógica global de reflejos.
- Mantener la lógica de reflejos centralizada.

### Documentos relacionados

```plaintext
docs/en/01_vision.md
docs/en/03_material_matrix.md
docs/en/05_validation_scenes.md
docs/en/17_visual_baseline_manifest.md
```

---

## 11. RISK-005 — Expansión de Alcance antes de Overworld v1.0.0

### Descripción

El proyecto puede verse tentado a añadir Nether, End, efectos cinematográficos, sistemas complejos de actualización o demasiadas opciones avanzadas antes de completar una release pulida del Overworld.

### Impacto

La expansión de alcance puede causar:

- Retraso de v1.0.0
- Features centrales incompletas
- Sobrecarga documental
- Releases inestables
- Pérdida de foco del proyecto

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Mantener v1.0.0 solo Overworld.
- Mover Nether y End a hitos futuros.
- Usar niveles de roadmap.
- Registrar decisiones de arquitectura.
- Evitar añadir features fuera del alcance documentado.

### Documentos relacionados

```plaintext
ROADMAP.md
docs/en/00_project_charter.md
docs/en/12_release_strategy.md
```

---

## 12. RISK-006 — Desincronización Documental entre Inglés y Español

### Descripción

El proyecto usa inglés como documentación canónica y español como traducción oficial.

A medida que los documentos crezcan, las traducciones pueden quedar desactualizadas o inconsistentes.

### Impacto

La desincronización documental puede causar:

- Confusión
- Reglas contradictorias
- Contexto incorrecto para Codex
- Problemas de presentación pública
- Sobrecarga de mantenimiento

### Severidad

Medium

### Probabilidad

Medium

### Mitigación

- Actualizar inglés primero.
- Actualizar español inmediatamente después.
- Commitear pares bilingües juntos cuando sea posible.
- Tratar el inglés como fuente de verdad.
- Revisar significado traducido, no solo redacción.

### Documentos relacionados

```plaintext
docs/en/10_architecture_decisions.md
docs/en/09_git_workflow.md
```

---

## 13. RISK-007 — Cambios de Versión en Iris o Minecraft

### Descripción

Actualizaciones de Minecraft o Iris pueden cambiar comportamiento del shader, compatibilidad, datos disponibles o estructura de archivos esperada.

### Impacto

Los cambios de versión pueden causar:

- Errores de compilación del shader
- Etapas de render rotas
- Uniforms modificados
- Problemas de mapeo material
- Cambios en la matriz de compatibilidad
- Retrasos de release

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Validar contra versiones específicas.
- Evitar prometer compatibilidad futura antes de probar.
- Mantener notas de compatibilidad.
- Registrar versiones de Iris y Minecraft por release.
- Mantener actualizada la matriz de compatibilidad.

### Documentos relacionados

```plaintext
docs/en/07_compatibility.md
docs/en/14_compatibility_matrix.md
```

---

## 14. RISK-008 — Comportamiento GLSL Específico por Driver

### Descripción

Distintas GPUs y drivers pueden manejar GLSL de forma diferente.

Esto puede afectar salida visual, rendimiento, precisión o compilación del shader.

### Impacto

Las diferencias por driver pueden causar:

- Inconsistencias visuales
- Errores de compilación
- Artefactos de precisión
- Diferencias de rendimiento
- Problemas específicos por fabricante

### Severidad

Medium

### Probabilidad

Medium

### Mitigación

- Evitar suposiciones específicas de un fabricante.
- Mantener código simple y legible.
- Documentar combinaciones GPU/driver probadas.
- Usar reportes de compatibilidad.
- Evitar trucos GLSL frágiles.

### Documentos relacionados

```plaintext
docs/en/07_compatibility.md
docs/en/08_code_conventions.md
```

---

## 15. RISK-009 — Presets Convertidos en Estilos Inconsistentes

### Descripción

Lite, Balanced, Quality, Experimental y Custom pueden derivar hacia direcciones artísticas diferentes si no se controlan.

### Impacto

La deriva de presets puede causar:

- Experiencia de usuario inconsistente
- Capturas confusas
- Identidad visual rota
- Validación más difícil
- Soporte más complejo

### Severidad

Medium

### Probabilidad

Medium

### Mitigación

- Definir Balanced como apariencia de referencia.
- Mantener Quality como mejora de fidelidad, no cambio de estilo.
- Mantener Lite como versión de menor costo de la misma identidad.
- Aislar Experimental.
- Acotar opciones Custom.

### Documentos relacionados

```plaintext
docs/en/01_vision.md
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

## 16. RISK-010 — Personalización Excesiva Rompiendo Identidad Visual

### Descripción

Demasiadas opciones de usuario o rangos demasiado amplios pueden permitir crear visuales que contradigan la filosofía del proyecto.

### Impacto

La personalización excesiva puede causar:

- Antorchas blancas mediante opciones normales
- Materiales mate reflectivos
- Bloom excesivo
- Sobresaturación
- Costo de rendimiento sin límite
- Capturas que representen mal al shader

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Acotar rangos de opciones.
- Documentar restricciones de opciones.
- Bloquear reglas materiales no negociables.
- Usar Custom como flexibilidad controlada.
- Evitar exponer opciones destructivas.

### Documentos relacionados

```plaintext
docs/en/13_option_registry.md
docs/en/01_vision.md
```

---

## 17. RISK-011 — Expectativas Vulkan Prematuras

### Descripción

El proyecto puede atraer expectativas sobre Vulkan antes de que la línea OpenGL esté madura.

### Impacto

Un enfoque prematuro en Vulkan puede causar:

- Confusión en el roadmap
- Retraso de la release OpenGL
- Fragmentación técnica
- Expectativas poco realistas de usuarios

### Severidad

Medium

### Probabilidad

Low

### Mitigación

- Tratar Vulkan como una ruta separada futura.
- No prometer fechas de release Vulkan.
- Reutilizar filosofía, no necesariamente código.
- Mantener la línea OpenGL estable y valiosa.

### Documentos relacionados

```plaintext
docs/en/02_technical_spec.md
docs/en/07_compatibility.md
docs/en/10_architecture_decisions.md
```

---

## 18. RISK-012 — Falta de Capturas de Validación al Inicio

### Descripción

La documentación inicial puede definir escenas de validación antes de que existan capturas reales.

### Impacto

Sin capturas, la validación puede ser más difícil de comunicar públicamente.

### Severidad

Medium

### Probabilidad

High

### Mitigación

- Añadir primero definiciones placeholder de escenas.
- Capturar screenshots curadas más adelante.
- Mantener capturas aleatorias fuera de commits.
- Usar notas de validación hasta que existan capturas.
- Guardar capturas curadas en `examples/`.

### Documentos relacionados

```plaintext
docs/en/05_validation_scenes.md
examples/
```

---

## 19. RISK-013 — Código Generado por IA Violando Reglas del Proyecto

### Descripción

Codex u otras herramientas de IA pueden generar código técnicamente plausible, pero que viole reglas materiales, restricciones de rendimiento o filosofía visual.

### Impacto

Los cambios generados por IA pueden introducir:

- Lógica global de reflejos
- Materiales mate reflectivos
- Efectos demasiado cinematográficos
- Hacks hardcodeados
- Archivos grandes poco mantenibles
- Inconsistencias documentales

### Severidad

High

### Probabilidad

Medium

### Mitigación

- Usar `AGENTS.md`.
- Usar tareas Codex acotadas.
- Definir archivos permitidos y prohibidos.
- Revisar salida de IA antes de commitear.
- Mantener debug views y escenas de validación.
- Rechazar código que viole la filosofía del proyecto.

### Documentos relacionados

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
docs/en/08_code_conventions.md
```

---

## 20. RISK-014 — Expectativas del Usuario por el Término “RTX”

### Descripción

El nombre y descripción del proyecto pueden hacer que algunos usuarios esperen RTX real, ray tracing por hardware o path tracing.

### Impacto

Esto puede causar confusión o decepción si los usuarios malinterpretan el proyecto.

### Severidad

Medium

### Probabilidad

Medium

### Mitigación

- Afirmar claramente “RTX-like, not real RTX.”
- Evitar afirmar ray tracing o path tracing.
- Explicar que el proyecto usa técnicas OpenGL/GLSL.
- Comunicar honestamente los objetivos visuales.
- Reconsiderar branding final antes de release pública si es necesario.

### Documentos relacionados

```plaintext
README.md
docs/en/01_vision.md
docs/en/07_compatibility.md
```

---

## 21. RISK-015 — Errores de Empaquetado de Release

### Descripción

Eventualmente, el shader pack deberá distribuirse como `.zip`.

Los errores de empaquetado pueden incluir archivos faltantes, archivos internos incluidos por accidente, licencias incorrectas o estructura de carpetas rota.

### Impacto

Los errores de empaquetado pueden causar:

- Instalación rota para usuarios
- Contenido de release confuso
- Omisión de licencias
- Archivos internos extra en paquetes públicos
- Problemas en GitHub releases

### Severidad

Medium

### Probabilidad

Medium

### Mitigación

- Crear scripts de empaquetado.
- Definir checklist de release.
- Probar el ZIP antes de publicar.
- Excluir archivos solo de desarrollo.
- Incluir avisos de licencia.
- Documentar reglas de empaquetado.

### Documentos relacionados

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
tools/packaging/
```

---

## 22. Proceso de Revisión de Riesgos

Los riesgos deben revisarse:

- Antes de fases mayores de implementación
- Antes de releases alpha
- Antes de releases beta
- Antes de v1.0.0
- Cuando cambien decisiones de arquitectura
- Cuando se descubran problemas de compatibilidad

Deben añadirse nuevos riesgos conforme evolucione el proyecto.

---

## 23. Regla de Gobierno de Riesgos

Cuando haya incertidumbre, elegir:

1. Riesgos documentados sobre riesgos ocultos
2. Afirmaciones conservadoras sobre promesas optimistas
3. Planes de mitigación sobre pensamiento deseoso
4. Validación sobre suposiciones
5. Control de alcance sobre expansión de features
6. Confianza del usuario sobre atractivo de marketing
