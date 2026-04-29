# Decisiones de Arquitectura — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Registro de decisiones de arquitectura
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento registra decisiones importantes de arquitectura para Vanilla RTX Lite.

El objetivo es preservar el razonamiento detrás de decisiones técnicas, visuales, estructurales y de flujo de trabajo.

Las decisiones de arquitectura deben explicar no solo qué se decidió, sino también por qué se decidió y qué compromisos se aceptaron.

---

## 2. Por qué Importan las Decisiones de Arquitectura

Los proyectos de shaders pueden volverse difíciles de mantener cuando las decisiones se toman de forma informal.

Sin decisiones documentadas, el proyecto puede sufrir:

- Deriva de alcance
- Comportamiento visual contradictorio
- Lógica material inconsistente
- Debates repetidos
- Dirección técnica poco clara
- Cambios generados por IA que ignoran restricciones del proyecto
- Features añadidas sin entender sus consecuencias

Este documento existe para hacer trazables las decisiones importantes.

---

## 3. Formato de Registro de Decisión

Cada decisión de arquitectura debe seguir esta estructura:

```plaintext
ADR-000 — Título de la Decisión

Estado:
Fecha:
Contexto:
Decisión:
Razonamiento:
Consecuencias:
Alternativas consideradas:
Documentos relacionados:
```

### Valores de estado

Estados permitidos:

| Estado | Significado |
| --- | --- |
| Proposed | En discusión |
| Accepted | Decisión activa actual |
| Superseded | Reemplazada por una decisión más nueva |
| Deprecated | Documentada, pero ya no recomendada |
| Rejected | Considerada y rechazada intencionalmente |

---

## 4. Alcance de las Decisiones

Se deben crear decisiones de arquitectura para cambios que afecten:

- Arquitectura del shader
- Pipeline de render
- Sistema de materiales
- Estrategia de reflejos
- Estrategia de presets
- Modelo de rendimiento
- Política de compatibilidad
- Estrategia de releases
- Estructura documental
- Flujo Git
- Flujo de desarrollo asistido por IA
- Estrategia de empaquetado
- Futura dirección Vulkan

Ediciones menores de redacción o correcciones pequeñas de typos no necesitan decisiones de arquitectura.

---

# ADR-001 — Desarrollo Guiado por Documentación

## Estado

Accepted

## Contexto

Vanilla RTX Lite está pensado como un proyecto serio para portafolio, GitHub y uso público.

El proyecto también espera colaboración con herramientas de IA como Codex.

Sin documentación clara, la futura generación de código e implementación de features puede desviarse de la filosofía visual prevista.

## Decisión

El proyecto seguirá un enfoque de desarrollo guiado por documentación.

Las reglas centrales del proyecto deben documentarse antes de iniciar implementación compleja del shader.

## Razonamiento

Esto hace que el proyecto sea más fácil de:

- Mantener
- Explicar
- Revisar
- Compartir públicamente
- Usar con Codex
- Presentar como evidencia de portafolio
- Expandir sin perder dirección

## Consecuencias

Consecuencias positivas:

- Mayor claridad del proyecto
- Mejor onboarding para futuros colaboradores
- Desarrollo asistido por IA más seguro
- Mayor valor como portafolio
- Decisiones más trazables

Compromisos:

- Progreso inicial más lento
- Más escritura antes de código
- Mayor mantenimiento para mantener documentación sincronizada

## Alternativas consideradas

- Empezar a programar inmediatamente y documentar después
- Mantener la documentación solo en el chat
- Usar únicamente un README

Estas alternativas se rechazaron porque harían el proyecto menos trazable y más fácil de desviar.

## Documentos relacionados

```plaintext
README.md
AGENTS.md
docs/en/master_project_specification.md
docs/en/00_project_charter.md
docs/en/01_vision.md
```

---

# ADR-002 — Inglés como Idioma Canónico de Documentación

## Estado

Accepted

## Contexto

El proyecto está pensado para GitHub, portafolio, release pública y posible visibilidad internacional.

El propietario del proyecto trabaja en español, pero el desarrollo de shaders, el tooling open-source y la documentación de programación gráfica suelen usar inglés.

## Decisión

El inglés será el idioma canónico de documentación.

El español se mantendrá como traducción oficial.

## Razonamiento

El inglés mejora:

- Accesibilidad open-source
- Legibilidad en GitHub
- Compatibilidad con Codex y herramientas de IA
- Consistencia terminológica en programación gráfica
- Acceso de posibles colaboradores públicos

El español sigue siendo importante porque:

- Apoya el flujo de trabajo del propietario del proyecto
- Ayuda a explicar el proyecto en contextos hispanohablantes
- Apoya contenido de YouTube y explicación de portafolio en español

## Consecuencias

Consecuencias positivas:

- Mejor presentación internacional
- Mayor compatibilidad con herramientas asistidas por IA
- Fuente de verdad clara

Compromisos:

- Más trabajo de traducción
- Riesgo de desincronización entre documentación en inglés y español
- Necesidad de actualizar primero inglés y luego español

## Alternativas consideradas

- Solo español
- Solo inglés
- Mezcla de idiomas en los mismos archivos

Estas alternativas se rechazaron porque reducen claridad internacional o hacen más difícil mantener los documentos.

## Documentos relacionados

```plaintext
README.md
docs/en/
docs/es/
```

---

# ADR-003 — Alcance Solo Overworld para v1.0.0

## Estado

Accepted

## Contexto

Minecraft tiene múltiples dimensiones con necesidades visuales muy diferentes.

Overworld, Nether y End requieren iluminación, atmósfera, materiales y escenas de validación distintas.

Intentar soportar todas las dimensiones en la primera release estable aumentaría la complejidad y retrasaría una release pública pulida.

## Decisión

La primera release estable, `v1.0.0`, se enfocará únicamente en el Overworld.

El soporte para Nether y End será parte de hitos futuros.

## Razonamiento

El Overworld es el entorno de gameplay más común.

Enfocarse en el Overworld permite al proyecto:

- Entregar una primera release estable coherente
- Validar primero materiales comunes
- Evitar deriva de alcance
- Construir una fundación más sólida
- Entregar algo usable antes de expandirse

## Consecuencias

Consecuencias positivas:

- Roadmap más realista
- Mejor pulido para v1.0.0
- Validación más sencilla
- Alcance más claro

Compromisos:

- Los usuarios interesados en Nether y End deberán esperar
- Algunos sistemas del shader pueden necesitar adaptación futura
- La documentación debe comunicar claramente el alcance

## Alternativas consideradas

- Soportar todas las dimensiones desde el inicio
- Añadir soporte para Nether antes de v1.0.0
- Añadir soporte para End antes de v1.0.0

Estas alternativas se rechazaron porque aumentarían el riesgo y retrasarían la release central.

## Documentos relacionados

```plaintext
ROADMAP.md
docs/en/00_project_charter.md
docs/en/05_validation_scenes.md
docs/en/07_compatibility.md
```

---

# ADR-004 — OpenGL / GLSL mediante Iris como Línea Inicial de Producción

## Estado

Accepted

## Contexto

El proyecto apunta a shaders de Minecraft Java usando el pipeline de Iris.

Existe interés en una futura línea orientada a Vulkan, pero el ecosistema actual de shaders de Minecraft todavía depende ampliamente de OpenGL/GLSL e Iris.

## Decisión

La línea inicial de producción apuntará a OpenGL / GLSL mediante Iris.

Una futura implementación orientada a Vulkan podrá explorarse por separado cuando el ecosistema sea viable.

## Razonamiento

OpenGL / GLSL mediante Iris es el punto de partida práctico porque:

- Actualmente es accesible para desarrollo de shaders de Minecraft Java
- Está alineado con flujos existentes de shaders
- Permite experimentación temprana
- Soporta el ecosistema actual de mods
- Es apropiado para un primer proyecto público de shader

## Consecuencias

Consecuencias positivas:

- Inicio práctico
- Tooling y conocimiento existentes disponibles
- Ruta más sencilla hacia carga temprana del shader
- Mejor compatibilidad con stacks actuales de mods

Compromisos:

- El trabajo en Vulkan queda aplazado
- Algunos diseños técnicos futuros pueden necesitar replanteamiento
- Se deben aceptar limitaciones de OpenGL

## Alternativas consideradas

- Empezar directamente con Vulkan
- Esperar hasta que el ecosistema Vulkan madure
- Construir OpenGL y Vulkan desde el primer día

Estas alternativas se rechazaron porque ralentizarían o complicarían demasiado el proyecto en una etapa temprana.

## Documentos relacionados

```plaintext
docs/en/02_technical_spec.md
docs/en/04_render_pipeline.md
docs/en/07_compatibility.md
```

---

# ADR-005 — Render Basado en Materiales como Regla Central de Diseño

## Estado

Accepted

## Contexto

Un riesgo clave en el desarrollo de shaders es aplicar efectos globalmente sin respetar identidad material.

Esto puede hacer que tierra, piedra, madera y hojas se vean reflectivas o mojadas, rompiendo la filosofía Vanilla+.

## Decisión

Vanilla RTX Lite usará decisiones de render basadas en materiales.

Efectos como reflejos, highlights especulares, respuesta de roughness y comportamiento Fresnel deben estar controlados por lógica material.

## Razonamiento

El render basado en materiales soporta:

- Visuales más creíbles
- Mejor consistencia Vanilla
- Reflejos selectivos
- Debug views claros
- Implementación más segura
- Mejor control de regresiones visuales

## Consecuencias

Consecuencias positivas:

- Tierra, piedra, madera y hojas permanecen protegidas
- Los reflejos son selectivos
- La identidad visual es más fácil de mantener
- Los debug views se vuelven significativos

Compromisos:

- Requiere trabajo de mapeo material
- Requiere más planificación
- Puede estar limitado por los datos disponibles del pipeline de shader
- Algunos comportamientos materiales pueden requerir aproximación

## Alternativas consideradas

- Aplicar reflejos globalmente
- Usar hacks simples específicos por bloque
- Añadir efectos manualmente caso por caso visual

Estas alternativas se rechazaron porque son más difíciles de mantener y tienen mayor probabilidad de romper consistencia.

## Documentos relacionados

```plaintext
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/17_visual_baseline_manifest.md
```

---

# ADR-006 — Cost Tiers en Lugar de Afirmaciones Exactas de GPU/VRAM

## Estado

Accepted

## Contexto

El shader pack no puede detectar ni reportar confiablemente uso exacto de GPU o VRAM en todos los sistemas.

El rendimiento de hardware depende de múltiples factores, incluyendo GPU, driver, resolución, distancia de render, mods, sistema operativo y versión de Iris.

## Decisión

El proyecto usará cost tiers relativos y tooltips explicativos en lugar de afirmaciones exactas de uso de hardware.

Cost tiers permitidos:

```plaintext
Very Low
Low
Medium
High
Very High
```

## Razonamiento

Los cost tiers son honestos y útiles sin fingir precisión falsa.

Permiten comunicar impacto relativo evitando afirmaciones engañosas.

## Consecuencias

Consecuencias positivas:

- Comunicación honesta de rendimiento
- Mayor confianza del usuario
- Documentación de opciones más sencilla
- Notas de release más realistas

Compromisos:

- Menos precisión que un perfilado real
- Requiere redacción clara
- Algunos usuarios podrían seguir queriendo números exactos

## Alternativas consideradas

- Afirmar estimaciones exactas de VRAM
- Afirmar uso exacto de GPU
- Ocultar completamente el costo de rendimiento

Estas alternativas se rechazaron porque son engañosas o poco útiles.

## Documentos relacionados

```plaintext
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

# ADR-007 — Debug Views como Infraestructura de Ingeniería Requerida

## Estado

Accepted

## Contexto

Los bugs visuales en shaders pueden ser difíciles de diagnosticar sin vistas internas.

Clasificación material, reflejos, roughness, Fresnel, exposición y SSR pueden fallar silenciosamente.

## Decisión

Los debug views son requeridos desde la primera fase de código.

Forman parte del flujo de ingeniería, no son un detalle opcional.

## Razonamiento

Los debug views ayudan a:

- Validar clasificación material
- Detectar filtraciones de reflejo
- Explicar regresiones visuales
- Apoyar reportes de issues
- Apoyar videos de desarrollo
- Apoyar debugging asistido por IA

## Consecuencias

Consecuencias positivas:

- Validación más sencilla
- Mejor diagnóstico de problemas
- Mayor credibilidad técnica
- Proceso de desarrollo más confiable

Compromisos:

- Más código inicial
- Más opciones que documentar
- Requiere mantenimiento conforme evolucionan los sistemas

## Alternativas consideradas

- Añadir debug views después
- Usar únicamente capturas
- Depurar manualmente con inspección de código

Estas alternativas se rechazaron porque hacen el debugging visual más lento y menos confiable.

## Documentos relacionados

```plaintext
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/08_code_conventions.md
```

---

# ADR-008 — Presets Lite, Balanced, Quality, Experimental y Custom

## Estado

Accepted

## Contexto

El proyecto necesita soportar distintas necesidades de usuario sin fragmentar la identidad visual.

El usuario quiere niveles de calidad configurables y un modo custom, pero el shader debe mantenerse acotado y honesto.

## Decisión

El proyecto usará cinco presets oficiales:

```plaintext
Lite
Balanced
Quality
Experimental
Custom
```

## Razonamiento

Estos presets crean una estructura clara:

- Lite soporta GPUs dedicadas de menor potencia.
- Balanced define la apariencia por defecto prevista.
- Quality mejora fidelidad sin cambiar la dirección artística.
- Experimental aísla features inestables.
- Custom permite control de usuario acotado.

## Consecuencias

Consecuencias positivas:

- Opciones claras de cara al usuario
- Mejor comunicación de costo
- Notas de release más sencillas
- Experimentación más segura
- Identidad de producto más fuerte

Compromisos:

- Requiere más pruebas
- Requiere más documentación
- Las opciones Custom deben limitarse cuidadosamente

## Alternativas consideradas

- Solo tres presets
- Sin modo custom
- Muchos micro-presets
- Configuración totalmente sin restricciones

Estas alternativas se rechazaron porque reducen flexibilidad o hacen el proyecto más difícil de mantener.

## Documentos relacionados

```plaintext
README.md
ROADMAP.md
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

# ADR-009 — Sin Updater Interno para v1.0.0

## Estado

Accepted

## Contexto

Se consideró si el shader podría actualizarse a sí mismo o revisar si existen nuevas versiones.

Dentro de un shader pack, la revisión y descarga confiable de actualizaciones está fuera del alcance realista de v1.0.0.

## Decisión

Un updater interno está fuera del alcance de v1.0.0.

Herramientas futuras de actualización pueden existir como companion tools, pero no como feature requerida del shader pack.

## Razonamiento

Esto mantiene v1.0.0 enfocado en el shader mismo.

Un updater interno introduciría:

- Complejidad adicional
- Consideraciones de plataforma
- Consideraciones de distribución
- Consideraciones de seguridad
- Carga de mantenimiento
- Viabilidad poco clara dentro de configuración del shader

## Consecuencias

Consecuencias positivas:

- Alcance más limpio
- Menor riesgo técnico
- Más enfoque en calidad de render
- Proceso de release más simple

Compromisos:

- Los usuarios deberán descargar actualizaciones manualmente
- La futura visibilidad de actualizaciones puede requerir documentación o páginas externas

## Alternativas consideradas

- Botón interno de descarga
- Checker de updates dentro del shader
- Sistema automático de actualización

Estas alternativas se rechazaron para v1.0.0 por ser poco realistas o estar fuera de alcance.

## Documentos relacionados

```plaintext
docs/en/02_technical_spec.md
docs/en/07_compatibility.md
docs/en/12_release_strategy.md
```

---

# ADR-010 — Escenas de Validación Antes de Afirmaciones Visuales

## Estado

Accepted

## Contexto

El proyecto busca evitar juzgar calidad únicamente mediante capturas aleatorias.

Como el shader depende de realismo sutil y corrección material, se requieren escenas de validación repetibles.

## Decisión

Las afirmaciones visuales importantes y notas de release públicas deben apoyarse en escenas de validación cuando sea posible.

## Razonamiento

Las escenas de validación ayudan a prevenir:

- Optimizar visualmente para una sola captura
- Ignorar legibilidad de gameplay
- Pasar por alto regresiones materiales
- Publicar afirmaciones de rendimiento sin respaldo
- Ocultar casos límite

## Consecuencias

Consecuencias positivas:

- Dirección visual más confiable
- Mejor disciplina de releases
- Mayor credibilidad pública
- Mejores reportes de issues

Compromisos:

- Más trabajo de preparación
- Más capturas y notas que mantener
- Requiere hábitos consistentes de validación

## Alternativas consideradas

- Validar solo por impresión subjetiva
- Usar solo mundos aleatorios
- Aplazar validación hasta beta

Estas alternativas se rechazaron porque reducen confiabilidad.

## Documentos relacionados

```plaintext
docs/en/05_validation_scenes.md
examples/
```

---

## 5. Actualización de Este Documento

Cuando se necesite una nueva decisión de arquitectura:

1. Añadir una nueva sección ADR.
2. Usar el siguiente número disponible.
3. Definir el estado.
4. Explicar contexto y razonamiento.
5. Documentar consecuencias.
6. Vincular documentos relacionados.
7. Actualizar traducciones cuando aplique.

---

## 6. Regla de Gobierno de Arquitectura

Cuando haya incertidumbre, elegir:

1. Decisiones documentadas sobre memoria informal
2. Compromisos aceptados sobre suposiciones ocultas
3. Trazabilidad sobre velocidad
4. Arquitectura estable sobre features impulsivas
5. Restricciones claras sobre flexibilidad vaga
6. Mantenibilidad futura sobre conveniencia inmediata
