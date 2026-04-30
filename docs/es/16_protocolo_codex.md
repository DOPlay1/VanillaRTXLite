# Protocolo de Tareas con Codex — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Protocolo de desarrollo asistido por IA
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento define el protocolo para usar Codex u otras herramientas de asistencia por IA en Vanilla RTX Lite.

El objetivo es que el trabajo asistido por IA sea seguro, acotado, revisable y alineado con la filosofía del proyecto.

Las herramientas de IA pueden ayudar con implementación, refactorización, documentación y trabajo repetitivo del repositorio, pero no deben tomar decisiones arquitectónicas o visuales sin control.

---

## 2. Relación con Otros Documentos

Las tareas con Codex deben seguir:

```plaintext
AGENTS.md
docs/en/master_project_specification.md
docs/en/00_project_charter.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/08_code_conventions.md
docs/en/09_git_workflow.md
```

Para trabajo relacionado con releases, Codex también debe seguir:

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
```

Para opciones del shader, Codex también debe seguir:

```plaintext
docs/en/13_option_registry.md
```

---

## 3. Regla Central

Codex debe recibir tareas acotadas.

No pedir a Codex:

```plaintext
Build the whole shader.
Make it look RTX.
Improve everything.
Optimize the project.
Add reflections.
Make it realistic.
```

Estas instrucciones son demasiado amplias y pueden causar cambios sin control.

En su lugar, dar a Codex:

- Un objetivo específico
- Archivos permitidos
- Archivos prohibidos
- Restricciones
- Criterios de aceptación
- Actualizaciones documentales requeridas
- Alcance esperado del commit

---

## 4. Filosofía del Trabajo Asistido por IA

Codex debe ayudar a implementar decisiones que ya están documentadas.

Codex no debe inventar la dirección del proyecto.

El trabajo asistido por IA debe apoyar:

- Trazabilidad
- Cambios pequeños
- Revisabilidad
- Consistencia documental
- Corrección material
- Conciencia de rendimiento
- Disciplina de presets
- Depurabilidad

La salida generada por IA siempre debe revisarse antes de hacer commit.

---

## 5. Contexto Requerido Antes de Tareas con Codex

Antes de iniciar una tarea con Codex, proporcionar o referenciar los documentos requeridos.

Contexto mínimo para tareas de código shader:

```plaintext
AGENTS.md
docs/en/master_project_specification.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/08_code_conventions.md
```

Contexto mínimo para tareas documentales:

```plaintext
AGENTS.md
docs/en/master_project_specification.md
README.md
ROADMAP.md
Relevant docs/en file
Relevant docs/es file if translation is needed
```

Contexto mínimo para tareas de release:

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
CHANGELOG.md
README.md
```

---

## 6. Plantilla de Tarea

Usar esta plantilla al asignar trabajo a Codex:

```plaintext
Task title:

Objective:

Context files to read:

Allowed files to modify:

Files that must not be modified:

Constraints:

Acceptance criteria:

Validation steps:

Expected commit message:
```

---

## 7. Ejemplo de Tarea — Actualización Documental

```plaintext
Task title:
Update the option registry with a new debug option.

Objective:
Add documentation for a new debug view option that displays material roughness.

Context files to read:
- AGENTS.md
- docs/en/master_project_specification.md
- docs/en/13_option_registry.md
- docs/en/08_code_conventions.md

Allowed files to modify:
- docs/en/13_option_registry.md
- docs/es/13_registro_de_opciones.md

Files that must not be modified:
- shader source files
- README.md
- ROADMAP.md

Constraints:
- Do not add implementation code.
- Keep English as canonical.
- Keep Spanish translation equivalent in meaning.
- Do not add options that break material rules.

Acceptance criteria:
- New option is documented with ID, category, cost tier, visual impact, dependencies, and constraints.
- English and Spanish documents remain synchronized.
- No unrelated sections are rewritten.

Validation steps:
- Review changed sections manually.
- Check Markdown renders correctly.
- Run git diff before committing.

Expected commit message:
docs(options): document roughness debug option
```

---

## 8. Ejemplo de Tarea — Helper Shader

```plaintext
Task title:
Add bounded Fresnel helper.

Objective:
Create a reusable GLSL helper for bounded Fresnel response.

Context files to read:
- AGENTS.md
- docs/en/master_project_specification.md
- docs/en/03_material_matrix.md
- docs/en/04_render_pipeline.md
- docs/en/08_code_conventions.md

Allowed files to modify:
- shaders/lib/fresnel.glsl
- shaders/include/constants.glsl if needed

Files that must not be modified:
- shaders/program/*
- docs/*
- README.md

Constraints:
- Do not enable reflections.
- Do not modify material classification.
- Do not add SSR.
- Do not apply Fresnel globally.
- Helper must be bounded to avoid exaggerated edge glow.
- Code must be readable and documented.

Acceptance criteria:
- Helper function exists.
- Function has clear parameters.
- Function clamps output.
- Function comment explains that it must not be used to enable reflection on matte materials.
- No unrelated files are changed.

Validation steps:
- Review diff.
- Check naming conventions.
- Confirm no global reflection logic was introduced.

Expected commit message:
feat(fresnel): add bounded fresnel helper
```

---

## 9. Ejemplo de Tarea — Selector de Debug Views

```plaintext
Task title:
Add debug view selector constants.

Objective:
Add named constants for planned debug views.

Context files to read:
- AGENTS.md
- docs/en/master_project_specification.md
- docs/en/04_render_pipeline.md
- docs/en/08_code_conventions.md
- docs/en/13_option_registry.md

Allowed files to modify:
- shaders/include/constants.glsl
- shaders/lib/debug_views.glsl

Files that must not be modified:
- docs/*
- shaders/lib/reflections.glsl
- shaders/lib/ssr.glsl

Constraints:
- Do not implement full debug rendering yet unless requested.
- Do not change normal output.
- Use named constants.
- Keep default debug mode Off.

Acceptance criteria:
- Debug constants exist.
- Names match option registry intent.
- No normal rendering behavior changes.
- Code remains modular.

Validation steps:
- Review diff.
- Confirm constants use uppercase snake case.
- Confirm no unrelated visual systems are changed.

Expected commit message:
feat(debug): add debug view constants
```

---

## 10. Tipos de Tareas Permitidas con Codex

Codex puede usarse para:

- Crear helpers GLSL pequeños
- Refactorizar secciones de código enfocadas
- Añadir infraestructura de debug views
- Actualizar documentación
- Crear scripts de empaquetado
- Añadir plantillas de validación
- Mejorar comentarios
- Limpiar estructuras repetidas
- Redactar notas de release
- Crear plantillas de issues
- Crear actualizaciones de checklist

---

## 11. Tipos de Tareas que Requieren Cuidado Extra

Usar cuidado extra con Codex para:

- Sistemas de reflejos
- SSR
- Clasificación material
- Tonemapping
- Color grading
- Comportamiento de presets
- Código sensible al rendimiento
- Empaquetado de releases
- Afirmaciones de compatibilidad
- Planeación relacionada con Vulkan

Estas áreas pueden violar fácilmente la filosofía del proyecto si la tarea es demasiado amplia.

---

## 12. Tipos de Tareas Prohibidas con Codex

No pedir a Codex:

- Añadir reflejos globales
- Hacer todos los bloques brillantes
- Añadir modo cinematográfico
- Añadir bloom extremo
- Añadir saturación sin límite
- Desactivar reglas materiales
- Prometer uso exacto de GPU o VRAM
- Afirmar RTX real, ray tracing o path tracing
- Reescribir todo el proyecto sin revisión
- Cambiar licencias sin instrucción explícita
- Modificar archivos no relacionados casualmente

---

## 13. Disciplina de Archivos Permitidos

Toda tarea con Codex debe listar archivos permitidos.

Ejemplo:

```plaintext
Allowed files to modify:
- shaders/lib/fresnel.glsl
- shaders/include/constants.glsl
```

Si Codex modifica archivos fuera de la lista permitida, esos cambios deben rechazarse salvo que exista una razón clara y aprobación humana.

---

## 14. Disciplina de Archivos Prohibidos

Toda tarea riesgosa con Codex debe listar archivos prohibidos.

Ejemplo:

```plaintext
Files that must not be modified:
- README.md
- ROADMAP.md
- docs/en/master_project_specification.md
- LICENSE
- LICENSE-DOCS
```

Esto evita cambios accidentales en identidad del proyecto, archivos legales o documentos de roadmap.

---

## 15. Criterios de Aceptación

Toda tarea con Codex debe incluir criterios de aceptación.

Buenos criterios de aceptación son:

- Específicos
- Verificables
- Limitados
- Relacionados con el objetivo
- Claros sobre qué no debe romperse

Criterios débiles:

```plaintext
Make it better.
Improve performance.
Make it realistic.
Clean it up.
```

Mejores criterios:

```plaintext
- Add one helper function.
- Do not modify program entry files.
- Do not enable reflections globally.
- Keep matte materials non-reflective.
- Add a short comment explaining the constraint.
```

---

## 16. Proceso de Revisión

Después de que Codex modifique archivos:

1. Ejecutar `git status`.
2. Revisar archivos modificados.
3. Ejecutar `git diff --stat`.
4. Revisar `git diff`.
5. Confirmar que solo cambiaron archivos permitidos.
6. Confirmar que archivos prohibidos no cambiaron.
7. Confirmar que no se violó la filosofía del proyecto.
8. Confirmar que la documentación sigue siendo precisa.
9. Hacer commit solo del trabajo revisado.

---

## 17. Comandos Git para Revisión

Comandos recomendados:

```powershell
git status
git diff --stat
git diff
```

Para archivos específicos:

```powershell
git diff -- shaders/lib/fresnel.glsl
```

Para archivos documentales:

```powershell
Get-Content ".\docs\en\file.md" -TotalCount 5
Get-Content ".\docs\en\file.md" -Tail 10
```

---

## 18. Ramas para Trabajo con Codex

Para tareas grandes con Codex, crear una rama de tarea desde `dev`.

Ejemplo:

```powershell
git checkout dev
git pull
git checkout -b feature/fresnel-helper
```

Para tareas documentales durante pre-alpha temprana, trabajar directamente en `dev` puede ser aceptable, pero el trabajo por ramas será preferible a medida que el proyecto crezca.

---

## 19. Estrategia de Commits para Trabajo con Codex

Los commits asistidos por Codex deben permanecer pequeños.

Buenos ejemplos de commit:

```plaintext
feat(fresnel): add bounded fresnel helper
feat(debug): add debug view constants
docs(options): document debug view registry
refactor(materials): split material helpers
```

Evitar:

```plaintext
feat(shader): add everything
update codex changes
ai work
big improvements
```

---

## 20. Actualizaciones Documentales

Si Codex cambia comportamiento, la documentación relacionada puede requerir actualización.

Ejemplos:

| Cambio de Código | Documentación a Revisar |
| --- | --- |
| Nueva opción | `docs/en/13_option_registry.md` |
| Nuevo comportamiento material | `docs/en/03_material_matrix.md` |
| Nuevo debug view | `docs/en/04_render_pipeline.md`, `docs/en/13_option_registry.md` |
| Cambio de rendimiento | `docs/en/06_performance_targets.md` |
| Cambio de proceso de release | `docs/en/12_release_strategy.md`, `docs/en/15_release_checklist.md` |
| Hallazgo de compatibilidad | `docs/en/14_compatibility_matrix.md` |

La documentación no debe alejarse de la implementación.

---

## 21. Revisión de Seguridad Material

Para cualquier código de render generado por Codex, verificar:

- La tierra permanece no reflectiva.
- La piedra permanece no reflectiva.
- La madera permanece no glossy por defecto.
- Las hojas no se ven mojadas por defecto.
- Arena y grava permanecen difusas.
- El reflejo está controlado por material.
- Fresnel no afecta materiales mate.
- Roughness se respeta.
- Los debug views pueden explicar el comportamiento.

Si cualquiera de estos puntos falla, rechazar o revisar el cambio.

---

## 22. Revisión de Seguridad de Rendimiento

Para salida de Codex sensible al rendimiento, verificar:

- Los efectos costosos no son globales por defecto.
- SSR no se activa en todas partes.
- Los sample counts están acotados.
- Los presets controlan features costosas.
- Lite tiene una ruta de menor costo.
- Existen fallbacks cuando se necesitan.
- Las afirmaciones de costo siguen siendo honestas.
- No se afirma uso exacto de GPU/VRAM.

---

## 23. Revisión de Identidad Visual

Para cambios visuales, verificar:

- Minecraft sigue siendo reconocible.
- Los efectos son sutiles.
- El bloom no es excesivo.
- Los colores no están sobresaturados.
- El tonemapping es contenido.
- La luz de antorcha sigue siendo cálida, pero no excesivamente roja.
- El shader no se vuelve cinematográfico pesado.
- El resultado apoya legibilidad durante gameplay.

---

## 24. Señales de Alerta en la Salida de Codex

Rechazar o revisar cuidadosamente salidas que:

- Toquen muchos archivos no relacionados
- Añadan bloques grandes de código sin explicación
- Añadan lógica global de reflejos
- Añadan efectos cinematográficos sin solicitud
- Cambien el alcance del proyecto
- Reescriban documentación ampliamente
- Ignoren la matriz de materiales
- Añadan números mágicos sin explicación
- Eliminen restricciones
- Cambien licencias
- Afirmen compatibilidad no soportada
- Afirmen números exactos de rendimiento

---

## 25. Checklist de Calidad del Prompt para Codex

Antes de enviar una tarea a Codex, confirmar:

| Ítem | Estado |
| --- | --- |
| Objetivo específico | Pending |
| Archivos de contexto listados | Pending |
| Archivos permitidos listados | Pending |
| Archivos prohibidos listados | Pending |
| Restricciones claras | Pending |
| Criterios de aceptación verificables | Pending |
| Pasos de validación incluidos | Pending |
| Mensaje de commit esperado incluido | Pending |

---

## 26. Regla de Gobierno de Codex

Cuando haya incertidumbre, elegir:

1. Tareas pequeñas sobre tareas amplias
2. Archivos permitidos sobre acceso sin restricciones
3. Criterios de aceptación sobre intención vaga
4. Revisión humana sobre commits a ciegas
5. Seguridad material sobre atajos visuales
6. Consistencia documental sobre salida rápida
