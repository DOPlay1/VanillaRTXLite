# Flujo Git — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Flujo Git y proceso del repositorio
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento define el flujo Git para Vanilla RTX Lite.

El objetivo es mantener el historial del repositorio limpio, trazable y útil para desarrollo, revisión de portafolio, releases públicas y trabajo asistido por IA.

El proyecto debe usar Git no solo como sistema de respaldo, sino como registro de decisiones, hitos y evolución técnica.

---

## 2. Filosofía del Flujo

El flujo Git debe apoyar:

- Commits pequeños y significativos
- Propósito claro por rama
- Cambios documentales trazables
- Experimentación segura
- Preparación reproducible de releases
- Colaboración limpia con Codex u otras herramientas de IA
- Historial legible para GitHub y revisión de portafolio

El proyecto debe evitar commits grandes y confusos que mezclen cambios no relacionados.

---

## 3. Ramas Principales

El proyecto usa dos ramas de larga duración:

```plaintext
main
dev
```

---

## 4. `main`

### Propósito

`main` representa el estado estable o listo para release del proyecto.

Es la rama pública por defecto en GitHub.

### Reglas

`main` debe contener:

- Documentación estable
- Estructura del proyecto revisada
- Código listo para release cuando existan releases
- README público
- Tags y estados de release cuando aplique

`main` no debe usarse para trabajo experimental diario.

### Cuándo actualizar `main`

Actualizar `main` cuando:

- Un hito esté completo
- Un bloque documental estable esté listo
- Se prepare un release candidate
- Se publique una release pública
- `dev` contenga trabajo revisado y estable

---

## 5. `dev`

### Propósito

`dev` es la rama activa de integración.

La mayoría del trabajo debe ocurrir desde o hacia `dev`.

### Reglas

`dev` puede contener:

- Trabajo documental activo
- Implementación temprana del shader
- Integración de features en progreso
- Preparación de pre-release
- Cambios validados antes de pasar a `main`

`dev` debe mantenerse razonablemente limpia y funcional.

No debe convertirse en un depósito de experimentos rotos.

---

## 6. Ramas Temporales

Las ramas temporales deben crearse desde `dev`.

Tipos recomendados:

```plaintext
docs/*
feature/*
fix/*
perf/*
refactor/*
chore/*
```

---

## 7. Ramas `docs/*`

Usar para trabajo documental.

Ejemplos:

```plaintext
docs/material-matrix
docs/release-strategy
docs/validation-scenes
```

Recomendadas cuando:

- Se escribe o reescribe documentación
- Se actualizan traducciones
- Se crean documentos de roadmap
- Se cambia README o especificaciones del proyecto

---

## 8. Ramas `feature/*`

Usar para nuevas features del shader.

Ejemplos:

```plaintext
feature/debug-view-selector
feature/material-core
feature/fresnel-helper
feature/water-reflections
```

Recomendadas cuando:

- Se añaden nuevos sistemas GLSL
- Se introducen nuevas opciones del shader
- Se crean nuevos debug views
- Se añade nuevo comportamiento material

---

## 9. Ramas `fix/*`

Usar para correcciones.

Ejemplos:

```plaintext
fix/torch-overbright
fix/material-mask-leak
fix/glass-reflection-artifact
```

Recomendadas cuando:

- Se corrigen regresiones visuales
- Se corrigen errores de compilación del shader
- Se corrigen errores de documentación
- Se corrigen problemas de empaquetado

---

## 10. Ramas `perf/*`

Usar para mejoras de rendimiento.

Ejemplos:

```plaintext
perf/ssr-sample-count
perf/lite-preset-cost
perf/reduce-fullscreen-work
```

Recomendadas cuando:

- Se reducen cálculos costosos
- Se mejora el preset Lite
- Se optimiza SSR
- Se reduce presión de memoria
- Se mejoran rutas de ejecución del shader

---

## 11. Ramas `refactor/*`

Usar para cambios estructurales de código que no deberían cambiar la salida visual.

Ejemplos:

```plaintext
refactor/material-helpers
refactor/debug-view-routing
refactor/profile-constants
```

Recomendadas cuando:

- Se mueve código entre archivos
- Se renombran helpers
- Se dividen funciones grandes
- Se mejora modularidad

Los refactors deben evitar cambiar comportamiento visual salvo que esté claramente documentado.

---

## 12. Ramas `chore/*`

Usar para mantenimiento del repositorio.

Ejemplos:

```plaintext
chore/markdownlint
chore/gitattributes
chore/package-scripts
```

Recomendadas cuando:

- Se actualiza tooling
- Se limpia formato
- Se agregan reglas de ignore
- Se mantiene metadata del repositorio

---

## 13. Estilo de Commits

Usar commits estilo convencional.

Tipos recomendados:

```plaintext
docs
feat
fix
refactor
perf
test
chore
```

Formato:

```plaintext
type(scope): short description
```

Ejemplos:

```plaintext
docs(readme): add bilingual project introduction
docs(vision): define visual identity and design principles
docs(materials): define initial material matrix
feat(debug): add material mask debug view
fix(lighting): reduce torch overbright response
perf(ssr): reduce sample count for Lite preset
chore(lint): normalize trailing newlines
```

---

## 14. Principios de Commit

Un buen commit debe ser:

- Enfocado
- Revisable
- Descriptivo
- Trazable
- Reversible cuando sea posible

Evitar commits que mezclen cambios no relacionados.

Mal ejemplo:

```plaintext
update stuff
```

Mejor ejemplo:

```plaintext
docs(pipeline): define render pipeline responsibilities
```

---

## 15. Estrategia de Commits Documentales

La documentación debe commitearse en pares lógicos cuando sea bilingüe.

Patrón recomendado:

```plaintext
docs(topic): define <topic>
```

Ejemplo:

```plaintext
docs(compatibility): define compatibility policy
```

Cuando se actualicen archivos en inglés y español, commitearlos juntos si representan el mismo cambio conceptual.

---

## 16. Estrategia de Commits de Código Shader

Los commits de código shader deben ser más pequeños que los commits documentales.

Ejemplos recomendados:

```plaintext
feat(shader): add minimal final pass
feat(debug): add debug view selector
feat(materials): add material id constants
feat(fresnel): add bounded fresnel helper
```

Evitar añadir varios sistemas grandes en un solo commit.

No combinar la primera implementación de SSR, tonemapping, clasificación material, presets y debug views en un solo commit.

---

## 17. Estrategia para Trabajo Asistido por IA

Cuando se use Codex u otro asistente de IA:

1. Crear o usar una rama enfocada.
2. Proporcionar una tarea acotada.
3. Limitar archivos permitidos.
4. Definir archivos que no deben modificarse.
5. Incluir criterios de aceptación.
6. Revisar los cambios generados antes de commitear.
7. Commitear solo trabajo coherente y revisado.

El código generado por IA no debe commitearse a ciegas.

---

## 18. Nombres de Ramas para Tareas con Codex

Nombres recomendados para tareas asistidas por Codex:

```plaintext
docs/codex-task-protocol
feature/codex-debug-view-selector
refactor/codex-material-helpers
fix/codex-ssr-artifact
```

El nombre de la rama debe describir la tarea, no solo la herramienta.

Incorrecto:

```plaintext
codex-work
ai-changes
```

Mejor:

```plaintext
feature/debug-view-selector
```

---

## 19. Antes de Empezar Trabajo

Antes de iniciar una nueva tarea:

```powershell
git checkout dev
git pull
git status
```

El working tree debe estar limpio antes de empezar una tarea nueva.

Si existe trabajo sin terminar:

- Hacer commit si es coherente
- Usar stash si es temporal
- Descartarlo solo si realmente no se necesita

---

## 20. Crear una Rama de Tarea

Para cambios grandes:

```powershell
git checkout dev
git pull
git checkout -b docs/example-topic
```

Para actualizaciones documentales pequeñas, trabajar directamente en `dev` es aceptable durante pre-alpha temprana, pero el trabajo por ramas será preferible a medida que el proyecto crezca.

---

## 21. Revisar Cambios

Antes de commitear:

```powershell
git status
git diff --stat
git diff
```

Para archivos documentales largos, revisar al menos:

```powershell
Get-Content ".\path\to\file.md" -TotalCount 5
Get-Content ".\path\to\file.md" -Tail 10
```

Esto ayuda a detectar pegados rotos, archivos truncados o contaminación accidental de texto.

---

## 22. Preparar Cambios para Commit

Agregar archivos específicos cuando sea posible:

```powershell
git add docs/en/09_git_workflow.md docs/es/09_flujo_git.md
```

Usar `git add .` solo cuando se tenga seguridad de que todos los cambios pertenecen al commit.

---

## 23. Crear Commits

Crear commits con mensajes claros:

```powershell
git commit -m "docs(git): define repository workflow"
```

El mensaje debe explicar la intención del cambio.

---

## 24. Subir Cambios

Subir la rama activa:

```powershell
git push
```

Si se está subiendo una rama nueva:

```powershell
git push -u origin branch-name
```

---

## 25. Actualizar `main`

Cuando `dev` contenga trabajo revisado y estable:

```powershell
git checkout main
git pull
git merge dev
git push
git checkout dev
```

Antes de hacer merge hacia `main`, verificar:

- `dev` está limpio
- Los commits importantes están subidos
- La documentación es coherente
- No hay archivos temporales incluidos
- No hay archivos locales accidentalmente trackeados

---

## 26. Crear Tags de Release

Cuando empiecen las releases, usar tags.

Ejemplo:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Los tags deben corresponder a hitos significativos.

No etiquetar trabajo intermedio aleatorio como release.

---

## 27. Usar Stash para Trabajo Temporal

Usar stash para cambios temporales sin terminar.

Ejemplo:

```powershell
git stash push -m "wip material matrix edits"
```

Aplicar después:

```powershell
git stash pop
```

No usar stash como sistema de almacenamiento a largo plazo.

---

## 28. Manejo de Errores

### Deshacer cambios no staged en un archivo

```powershell
git restore path/to/file
```

### Quitar un archivo del staging

```powershell
git restore --staged path/to/file
```

### Modificar el último commit

Solo si el commit no ha sido compartido o si se entienden las implicaciones:

```powershell
git commit --amend
```

### Limpiar commits locales duplicados antes de push

Para trabajo local temprano, interactive rebase o soft reset pueden usarse con cuidado.

Evitar reescribir historial compartido salvo que sea necesario.

---

## 29. Line Endings y Formato

El proyecto debe evitar ruido innecesario por saltos de línea.

Adición futura recomendada:

```plaintext
.gitattributes
```

Regla potencial:

```plaintext
* text=auto
*.md text eol=lf
*.glsl text eol=lf
*.vsh text eol=lf
*.fsh text eol=lf
```

Esto debe añadirse intencionalmente en un commit separado.

---

## 30. Qué No Commitear

No commitear:

- Instancias locales de Minecraft
- Capturas aleatorias
- Grabaciones
- Archivos temporales
- Logs
- ZIPs de release generados
- Configuración personal de IDE
- Experimentos rotos
- API keys o secretos
- Archivos grandes no curados para el proyecto

Las capturas curadas pueden commitearse bajo:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

---

## 31. Checklist de Higiene del Repositorio

Antes de hacer push:

- `git status` está entendido
- El mensaje de commit es claro
- Solo están staged los archivos previstos
- No hay archivos locales incluidos
- No hay secretos incluidos
- Los archivos de documentación abren correctamente
- Las advertencias Markdown están entendidas o corregidas
- El cambio corresponde al roadmap del proyecto

---

## 32. Regla de Gobierno Git

Cuando haya incertidumbre, elegir:

1. Commits pequeños sobre commits grandes mezclados
2. Ramas sobre ediciones directas riesgosas
3. Mensajes claros sobre mensajes vagos
4. Cambios revisados sobre commits a ciegas
5. `main` estable sobre atajos convenientes
6. Historial trazable sobre progreso apresurado
