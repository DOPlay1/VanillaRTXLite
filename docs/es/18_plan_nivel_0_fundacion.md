# Plan de Fundación de Nivel 0 — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Plan de fundación y registro de cierre
- Idioma canónico: Inglés
- Estado actual: Listo para revisión de cierre de Nivel 0

---

## 1. Propósito

Este documento define y cierra la fase de fundación de Nivel 0 para Vanilla RTX Lite.

El Nivel 0 existe para preparar el proyecto antes de que comience la implementación del shader.

El propósito de esta fase es establecer:

- Estructura del repositorio
- Identidad del proyecto
- Dirección técnica
- Estándares de documentación
- Flujo de trabajo Git
- Reglas de desarrollo asistido por IA
- Estrategia de releases
- Conciencia de riesgos
- Filosofía de validación
- Reglas de línea base visual

El Nivel 0 no busca crear los visuales finales del shader.

Existe para que la implementación futura del shader sea controlada, trazable y profesional.

---

## 2. Definición de Nivel 0

El Nivel 0 es la fase de fundación.

Responde a:

- ¿Qué es este proyecto?
- ¿Qué filosofía visual sigue?
- ¿Qué está permitido y qué está prohibido?
- ¿Qué tecnologías apunta?
- ¿Cómo se manejarán los materiales?
- ¿Cómo se comunicará el rendimiento?
- ¿Cómo se prepararán las releases?
- ¿Cómo se usarán de forma segura Codex u otras herramientas de IA?
- ¿Qué riesgos ya se conocen?
- ¿Qué debe validarse antes de una release pública?

El proyecto no debería entrar en implementación compleja del shader hasta que el Nivel 0 tenga una línea base coherente.

---

## 3. Alcance de Nivel 0

El Nivel 0 incluye:

- Configuración profesional del repositorio
- Documentación central
- Estructura documental bilingüe
- Reglas del proyecto
- Planeación de arquitectura del shader
- Planeación del sistema de materiales
- Planeación del pipeline de render
- Políticas de rendimiento y compatibilidad
- Planeación del proceso de releases
- Proceso de colaboración con IA
- Reglas visuales de no regresión

El Nivel 0 excluye:

- Implementación completa del shader
- Efectos visuales finales
- Implementación de SSR
- Reflejos avanzados
- Presets finales
- Automatización de empaquetado
- Release pública estable
- Soporte para Nether
- Soporte para End
- Línea de producción Vulkan

---

## 4. Fundación del Repositorio

La fundación del repositorio incluye:

```plaintext
.github/
docs/
examples/
shaders/
tools/
README.md
ROADMAP.md
CHANGELOG.md
CONTRIBUTING.md
LICENSE
LICENSE-DOCS
AGENTS.md
.gitattributes
.gitignore
shader.properties
```

El repositorio está diseñado para soportar:

- Presentación pública en GitHub
- Revisión de portafolio
- Implementación del shader
- Desarrollo guiado por documentación
- Trabajo futuro asistido por Codex
- Empaquetado futuro para releases
- Capturas futuras de validación
- Seguimiento futuro de compatibilidad

---

## 5. Fundación Documental

El Nivel 0 establece el conjunto principal de documentación.

Documentos completados:

| Documento | Propósito |
| --- | --- |
| `00_project_charter.md` | Define identidad, alcance y principios del proyecto |
| `01_vision.md` | Define filosofía visual y dirección de diseño |
| `02_technical_spec.md` | Define arquitectura técnica y restricciones |
| `03_material_matrix.md` | Define categorías materiales y comportamiento esperado |
| `04_render_pipeline.md` | Define etapas de render y flujo de datos |
| `05_validation_scenes.md` | Define escenas repetibles de validación visual |
| `06_performance_targets.md` | Define objetivos de rendimiento y modelo de costo |
| `07_compatibility.md` | Define política de compatibilidad |
| `08_code_conventions.md` | Define convenciones de código y reglas de revisión |
| `09_git_workflow.md` | Define flujo Git y proceso de ramas |
| `10_architecture_decisions.md` | Registra decisiones de arquitectura |
| `11_known_risks.md` | Documenta riesgos conocidos y mitigaciones |
| `12_release_strategy.md` | Define versionamiento y estrategia de releases |
| `13_option_registry.md` | Define opciones planeadas orientadas al usuario |
| `14_compatibility_matrix.md` | Lleva registro de resultados reales de validación de compatibilidad |
| `15_release_checklist.md` | Define checklist de verificación de releases |
| `16_codex_task_protocol.md` | Define protocolo seguro de desarrollo asistido por IA |
| `17_visual_baseline_manifest.md` | Define línea base visual y reglas de no regresión |

Los equivalentes en español se mantienen en:

```plaintext
docs/es/
```

El inglés se mantiene como idioma canónico de documentación.

El español es una traducción oficial.

---

## 6. Especificación Maestra

El proyecto incluye una especificación maestra:

```plaintext
docs/en/master_project_specification.md
docs/es/especificacion_maestra_del_proyecto.md
```

La especificación maestra es la fuente de verdad de alto nivel para:

- Filosofía del proyecto
- Restricciones duras
- Pensamiento basado en materiales
- Dirección de render
- Honestidad de rendimiento
- Expectativas de colaboración con IA

Todo trabajo futuro debe mantenerse alineado con la especificación maestra.

---

## 7. Fundación de Colaboración con IA

El Nivel 0 establece reglas de colaboración con IA mediante:

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
```

Las herramientas de IA no deben usarse como conductores irrestrictos del proyecto.

Deben recibir:

- Objetivos específicos
- Archivos permitidos
- Archivos prohibidos
- Restricciones
- Criterios de aceptación
- Pasos de validación
- Alcance esperado del commit

Los cambios generados por IA deben revisarse antes del commit.

Codex o herramientas similares no deben inventar la dirección del proyecto.

Deben implementar decisiones ya documentadas.

---

## 8. Fundación de Git y Trazabilidad

El Nivel 0 establece un flujo Git trazable.

Estrategia actual de ramas:

```plaintext
main
dev
```

Reglas principales:

- `main` representa el estado estable o listo para release.
- `dev` es la rama activa de integración.
- Pueden usarse ramas de vida corta para tareas más grandes.
- Los commits deben seguir un estilo convencional.
- Los pares documentales bilingües deben commitearse juntos.
- Los cambios significativos deben mantenerse pequeños y revisables.

El repositorio ahora incluye `.gitattributes` para normalizar finales de línea y reducir ruido de formato entre plataformas.

---

## 9. Fundación Visual

El Nivel 0 define la identidad visual del proyecto.

Vanilla RTX Lite debe ser:

- Vanilla+
- Sutil
- Consciente de materiales
- Jugable
- Consciente del rendimiento
- Más creíble sin volverse cinematográfico pesado

La línea base visual prohíbe:

- Reflejos globales
- Tierra reflectiva
- Piedra reflectiva
- Madera glossy por defecto
- Hojas mojadas por defecto
- Bloom excesivo
- Sobresaturación
- Color grading cinematográfico pesado
- Falsas afirmaciones de RTX/path tracing

El shader debe seguir viéndose como Minecraft.

---

## 10. Fundación Material

El Nivel 0 define la filosofía material inicial.

El shader debe pensar en materiales, no en trucos aislados por bloque.

Los grupos materiales iniciales incluyen:

- Materiales reflectivos primarios
- Materiales especulares secundarios
- Materiales pulidos/glossy
- Materiales cristalinos
- Materiales mate
- Materiales opcionales futuros

Los materiales mate protegidos incluyen:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- Terreno rugoso
- La mayoría de superficies orgánicas

Estos materiales no deben recibir reflejos por defecto.

---

## 11. Fundación de Rendimiento

El Nivel 0 define un modelo honesto de rendimiento.

El proyecto usa tiers de costo:

```plaintext
Very Low
Low
Medium
High
Very High
```

El proyecto no debe afirmar:

- Uso exacto de GPU
- Uso exacto de VRAM
- FPS garantizados
- Rendimiento garantizado en gráficos integrados
- Detección automática exacta del costo de hardware

La comunicación de rendimiento debe ser honesta, relativa y ligada a entornos validados.

---

## 12. Fundación de Compatibilidad

El Nivel 0 define la política de compatibilidad.

Línea objetivo inicial:

```plaintext
Minecraft Java 26.1.x
Iris 1.10.9+mc26.1
OpenGL / GLSL a través de Iris
```

La compatibilidad futura con líneas posteriores de Minecraft debe validarse antes de afirmarse.

La línea orientada a Vulkan es una ruta futura separada y no forma parte de v1.0.0.

La matriz de compatibilidad debe registrar solo resultados probados.

Las combinaciones no probadas deben permanecer marcadas como `Unknown`.

---

## 13. Fundación de Releases

El Nivel 0 define la estrategia de releases.

El proyecto usa:

- Niveles de roadmap
- Etiquetas de madurez
- Releases versionadas
- Actualizaciones de changelog
- Checklists de release
- Notas de compatibilidad
- Limitaciones conocidas
- Paquetes de release limpios

Primer hito sugerido:

```plaintext
v0.1.0-prealpha — Foundation
```

Este hito representa la fundación documental y del repositorio.

No representa una release del shader lista para gameplay.

---

## 14. Fundación de Validación

El Nivel 0 define escenas de validación.

Las escenas de validación son necesarias para evitar juzgar el shader solo mediante capturas aleatorias.

Escenas clave incluyen:

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

El trabajo visual futuro debería validarse contra estas escenas siempre que sea posible.

---

## 15. Fundación de Riesgos

El Nivel 0 documenta riesgos conocidos.

Riesgos importantes incluyen:

- Limitaciones de clasificación material
- Artefactos de SSR
- Costo de rendimiento en GPUs de gama baja
- Materiales mate reflejando accidentalmente
- Scope creep antes de Overworld v1.0.0
- Deriva documental entre inglés y español
- Cambios de versión de Iris o Minecraft
- Comportamiento GLSL específico por driver
- Código generado por IA violando reglas del proyecto
- Expectativas de usuario alrededor del término “RTX”
- Errores de empaquetado en releases

Estos riesgos deben seguir revisándose conforme el proyecto evolucione.

---

## 16. Checklist de Finalización de Nivel 0

| Ítem | Estado |
| --- | --- |
| Estructura del repositorio creada | Complete |
| README creado | Complete |
| ROADMAP creado | Complete |
| CHANGELOG creado | Complete |
| Licencias añadidas | Complete |
| `.gitignore` añadido | Complete |
| `.gitattributes` añadido | Complete |
| Plantillas de issues de GitHub añadidas | Complete |
| Plantilla de pull request añadida | Complete |
| AGENTS.md añadido | Complete |
| Especificación maestra del proyecto añadida | Complete |
| Conjunto documental en inglés 00–17 completado | Complete |
| Conjunto documental en español 00–17 completado | Complete |
| Matriz de materiales documentada | Complete |
| Pipeline de render documentado | Complete |
| Modelo de rendimiento documentado | Complete |
| Política de compatibilidad documentada | Complete |
| Estrategia de releases documentada | Complete |
| Protocolo Codex documentado | Complete |
| Línea base visual documentada | Complete |
| Documento de cierre de Nivel 0 creado | In progress |

---

## 17. Tareas Restantes para Cierre de Nivel 0

Antes de cerrar completamente el Nivel 0, completar:

| Tarea | Estado |
| --- | --- |
| Actualizar este plan de fundación de Nivel 0 | Complete |
| Actualizar plan de fundación de Nivel 0 en español | In progress |
| Revisar `README.md` por consistencia | Pending |
| Revisar `ROADMAP.md` para finalización de Nivel 0 | Pending |
| Actualizar `CHANGELOG.md` con el trabajo de fundación de Nivel 0 | Pending |
| Confirmar que `git status` está limpio | Pending |
| Hacer merge de `dev` en `main` cuando esté listo | Pending |
| Crear opcionalmente el tag `v0.1.0-prealpha` | Pending |

---

## 18. Criterios para Entrar a Nivel 1

El proyecto puede entrar a Nivel 1 cuando:

- La documentación de Nivel 0 esté completa.
- README, ROADMAP y CHANGELOG sean consistentes.
- La estructura del repositorio sea lo bastante estable para código shader.
- El flujo Git esté funcionando.
- El protocolo Codex esté disponible.
- Las restricciones materiales y visuales estén documentadas.
- No queden blockers sin resolver de configuración del repositorio en Nivel 0.
- `dev` esté limpio y subido.

El Nivel 1 debería comenzar con carga mínima del shader e infraestructura visual base, no con efectos avanzados.

---

## 19. Vista Previa de Nivel 1

Nivel 1 — Baseline Visuals debería enfocarse en:

- Carga mínima del shader
- `shader.properties` básico
- Archivos mínimos de programa
- Final pass básico
- Placeholder inicial del pipeline de color
- Fundación del selector de debug views
- Constantes/includes básicos
- Sin SSR avanzado
- Sin sistema complejo de reflejos todavía

El objetivo del Nivel 1 es lograr una fundación mínima, segura y entendible del shader en ejecución.

---

## 20. Lo que No Debe Ocurrir Inmediatamente Después de Nivel 0

Después de Nivel 0, el proyecto no debe saltar directamente a:

- SSR completo
- Reflejos complejos en agua
- Atmósfera cinematográfica avanzada
- Grandes reescrituras del shader
- Opciones custom sin límites
- Implementación Vulkan
- Soporte para Nether o End
- Afirmaciones de release pública estable

El siguiente paso correcto es una implementación pequeña y trazable de Nivel 1.

---

## 21. Valor de Portafolio de Nivel 0

El Nivel 0 es valioso porque demuestra:

- Disciplina de planeación
- Documentación técnica
- Documentación bilingüe
- Pensamiento de arquitectura
- Planeación de releases
- Gestión de riesgos
- Flujo Git
- Disciplina de colaboración con IA
- Visión de producto
- Dirección visual
- Honestidad de rendimiento

Esta fundación ayuda a mostrar que Vanilla RTX Lite no es un experimento aleatorio de shaders.

Es un proyecto estructurado de programación gráfica.

---

## 22. Declaración de Cierre de Nivel 0

El Nivel 0 puede considerarse completo cuando este documento y su equivalente en inglés estén commiteados, y README, ROADMAP y CHANGELOG hayan sido revisados por consistencia.

En ese punto, el proyecto puede pasar a:

```plaintext
Level 1 — Baseline Visuals
```

El Nivel 1 debe comenzar con cuidado, con commits pequeños y código shader mínimo.

---

## 23. Regla de Gobierno

Al cerrar el Nivel 0, elegir:

1. Consistencia sobre velocidad
2. Trazabilidad sobre apresurarse a escribir código
3. Documentación clara sobre suposiciones
4. Siguientes pasos pequeños sobre saltos ambiciosos
5. Fundación estable sobre features prematuras
6. Proceso profesional sobre progreso improvisado
