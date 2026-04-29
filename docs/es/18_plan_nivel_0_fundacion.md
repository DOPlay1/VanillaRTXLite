# Plan de Fundación — Nivel 0

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Hito: v0.1.0-prealpha — Fundación

---

## Propósito

El Nivel 0 existe para crear la base profesional de Vanilla RTX Lite antes de implementar efectos complejos de shader.

Esta etapa se enfoca en estructura del proyecto, documentación, flujo de trabajo, licencias, planificación de releases y reglas para colaboración asistida con IA.

El objetivo es que el proyecto sea entendible, mantenible y esté listo para desarrollo serio.

---

## Por qué existe el Nivel 0

Los proyectos de shaders pueden volverse caóticos rápidamente si la experimentación visual empieza antes de tener arquitectura y reglas claras.

El Nivel 0 evita eso definiendo:

- Identidad del proyecto
- Alcance
- Estructura del repositorio
- Estrategia de documentación
- Flujo Git
- Estrategia de releases
- Filosofía visual
- Reglas de materiales
- Modelo de comunicación de costo
- Protocolo de colaboración con Codex e IA

Esto hace que la implementación posterior del shader sea más controlada y trazable.

---

## Alcance actual

El Nivel 0 no busca crear efectos visuales avanzados.

Prepara el proyecto para que las siguientes etapas puedan implementarlos correctamente.

---

## Entregables

El Nivel 0 debe producir:

- Esqueleto del repositorio
- README
- ROADMAP
- CHANGELOG
- Guía de contribución
- Guía AGENTS para IA
- Licencia MIT para código y scripts
- Licencia CC BY 4.0 para documentación y medios curados
- Templates de issues en GitHub
- Template de pull request
- Especificación Maestra del Proyecto
- Esqueleto documental en `docs/en/` y `docs/es/`
- `.gitignore` inicial
- Flujo inicial del proyecto

---

## Estructura del repositorio

La estructura esperada es:

```plaintext
VanillaRTXLite/
├── shaders/
│   ├── program/
│   ├── lib/
│   ├── include/
│   └── profiles/
├── docs/
│   ├── en/
│   └── es/
├── examples/
├── tools/
├── .github/
├── shader.properties
├── README.md
├── ROADMAP.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── AGENTS.md
├── LICENSE
├── LICENSE-DOCS
└── .gitignore
```

---

## Archivos raíz requeridos

### `README.md`

Presenta el proyecto a usuarios, colaboradores y revisores de portafolio.

### `ROADMAP.md`

Define niveles del roadmap, estados de madurez, hitos planeados y alcance de v1.0.0.

### `CHANGELOG.md`

Registra los cambios importantes del proyecto con el paso del tiempo.

### `CONTRIBUTING.md`

Explica cómo contribuir sin romper la filosofía del proyecto.

### `AGENTS.md`

Entrega instrucciones para Codex y otros flujos de desarrollo asistido con IA.

### `LICENSE`

Licencia MIT para código del shader y scripts.

### `LICENSE-DOCS`

Licencia Creative Commons Attribution 4.0 International para documentación y medios curados.

### `.gitignore`

Evita que archivos locales, temporales, generados o dependientes del entorno entren al repositorio.

---

## Esqueleto documental requerido

Documentación canónica en inglés:

```plaintext
docs/en/master_project_specification.md
docs/en/00_project_charter.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/06_performance_targets.md
docs/en/07_compatibility.md
docs/en/08_code_conventions.md
docs/en/09_git_workflow.md
docs/en/10_architecture_decisions.md
docs/en/11_known_risks.md
docs/en/12_release_strategy.md
docs/en/13_option_registry.md
docs/en/14_compatibility_matrix.md
docs/en/15_release_checklist.md
docs/en/16_codex_task_protocol.md
docs/en/17_visual_baseline_manifest.md
docs/en/18_level_0_foundation_plan.md
```

Traducción oficial en español:

```plaintext
docs/es/00_carta_del_proyecto.md
docs/es/01_vision.md
docs/es/02_especificacion_tecnica.md
docs/es/03_matriz_de_materiales.md
docs/es/04_pipeline_de_render.md
docs/es/05_escenas_de_validacion.md
docs/es/06_objetivos_de_rendimiento.md
docs/es/07_compatibilidad.md
docs/es/08_convenciones_de_codigo.md
docs/es/09_flujo_git.md
docs/es/10_decisiones_de_arquitectura.md
docs/es/11_riesgos_conocidos.md
docs/es/12_estrategia_de_releases.md
docs/es/13_registro_de_opciones.md
docs/es/14_matriz_de_compatibilidad.md
docs/es/15_checklist_de_release.md
docs/es/16_protocolo_codex.md
docs/es/17_manifiesto_visual_base.md
docs/es/18_plan_nivel_0_fundacion.md
```

---

## Qué no debe incluir el Nivel 0

El Nivel 0 no debe enfocarse en:

- Efectos complejos de shader
- Screen Space Reflections
- God rays
- Atmósfera avanzada
- Implementación de materiales
- Promesas de rendimiento basadas en mediciones inexistentes
- Builds públicas para usuarios finales
- Sistemas específicos del Nether
- Sistemas específicos del End

---

## Criterios de salida

El Nivel 0 está completo cuando:

- La estructura del repositorio existe.
- Los archivos raíz del proyecto están llenos.
- Las licencias están definidas.
- Los templates de GitHub existen.
- La Especificación Maestra del Proyecto existe.
- El esqueleto documental existe.
- El roadmap define niveles y estados de madurez.
- Existe el primer commit de fundación.
- El proyecto está listo para pasar al Nivel 1 — Visual Base.

---

## Recomendación para el primer commit

Mensaje recomendado:

```plaintext
docs(project): initialize Level 0 foundation
```

Este commit debe incluir la fundación del repositorio, no código avanzado de shader.

---

## Siguiente etapa

Después de completar el Nivel 0, el proyecto pasa a:

```plaintext
Nivel 1 — Visual Base
Madurez: Pre-alpha
Versión sugerida: v0.2.0-prealpha
```

El Nivel 1 se enfocará en:

- Pipeline mínimo de shader
- Carga básica del shader
- `shader.properties` inicial
- Salida visual base
- Base de tonemap neutral
- Infraestructura de debug views

---

## Regla del Nivel 0

Cuando haya incertidumbre durante el Nivel 0, priorizar:

1. Documentación sobre improvisación
2. Estructura sobre velocidad
3. Trazabilidad sobre atajos
4. Limitaciones honestas sobre promesas infladas
5. Fundaciones estables sobre efectos visuales prematuros
