# Carta del Proyecto — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Hito: v0.1.0-prealpha — Fundación
- Alcance estable objetivo: v1.0.0 — Solo Overworld

---

## 1. Propósito del Proyecto

Vanilla RTX Lite existe para crear un shader de Minecraft Java que mejore el realismo visual mientras preserva la identidad Vanilla original del juego.

El proyecto busca ofrecer una experiencia tipo RTX contenida mediante render basado en materiales, reflejos selectivos, iluminación controlada, atmósfera sutil y comunicación honesta del rendimiento.

Este no es un proyecto de shader cinematográfico. Es un proyecto de ingeniería gráfica Vanilla+.

---

## 2. Visión Central

El shader debe sentirse como una evolución natural de Minecraft.

Lema central:

> Debe seguir viéndose como Minecraft — solo que mejor.

La dirección visual debe mantenerse:

- Sutil
- Limpia
- Legible
- Basada en materiales
- Consciente del rendimiento
- Coherente con el estilo original de Minecraft

---

## 3. Problema que Resuelve

Muchos shader packs para Minecraft mejoran la imagen aplicando efectos globales fuertes como bloom pesado, sobresaturación, grading cinematográfico, reflejos excesivos y atmósfera dramática.

Aunque estos efectos pueden verse impactantes en capturas, muchas veces reducen la legibilidad durante el juego y hacen que distintos materiales se comporten de forma inconsistente.

Vanilla RTX Lite responde a esto priorizando:

- Lógica de render específica por material
- Reflejos selectivos
- Iluminación controlada
- Tratamiento neutral del color
- Compromisos de rendimiento documentados
- Restricciones visuales claras

---

## 4. Público Objetivo

Usuarios principales:

- Jugadores de Minecraft Java que quieren una experiencia visual Vanilla+ refinada
- Jugadores que no disfrutan la estética exagerada de algunos shaders
- Usuarios con GPUs dedicadas de gama media y alta
- Usuarios que quieren configurar lo visual sin perder consistencia

Audiencias secundarias:

- Personas aprendiendo programación gráfica
- Revisores de portafolio
- Visitantes de GitHub
- Audiencia de YouTube siguiendo el proceso de desarrollo
- Futuros colaboradores
- Flujos de desarrollo asistidos por IA como Codex

---

## 5. Alcance para v1.0.0

La primera versión estable estará enfocada únicamente en el Overworld.

Este alcance es intencional. El Overworld es el entorno más común de juego y debe alcanzar un estado pulido, coherente y disfrutable antes de expandirse a otras dimensiones.

### Dentro del alcance

- Iluminación del Overworld
- Exposición controlada
- Tonemapping neutral
- Pipeline de color sutil
- Clasificación de materiales
- Reflejos selectivos
- Respuesta reflectiva basada en Fresnel
- Comportamiento material basado en roughness
- Comportamiento reflectivo del agua
- Comportamiento reflectivo del vidrio
- Respuesta del hielo
- Respuesta pulida tipo cuarzo
- Respuesta especular de cobre y metales simulados
- Respuesta cristalina sutil para amatista
- Iluminación cálida de antorchas
- Niebla sutil
- Atmósfera sutil
- Debug views
- Presets: Lite, Balanced, Quality, Experimental, Custom
- Cost tiers y tooltips
- Releases en GitHub
- Documentación en inglés y español

---

## 6. Fuera del Alcance para v1.0.0

Lo siguiente no forma parte de la primera versión estable:

- Soporte completo para Nether
- Soporte completo para End
- Path tracing
- Ray tracing real
- Postprocesado cinematográfico pesado
- Motion blur
- Depth of field pesado
- Chromatic aberration
- Lens dirt
- Viñeta fuerte
- Reflejos globales en materiales mate
- Updater interno del shader
- Reporte exacto de uso de GPU
- Reporte exacto de uso de VRAM
- Soporte universal para gráficos integrados

Estos elementos solo podrán considerarse como trabajo futuro si siguen alineados con la filosofía del proyecto.

---

## 7. Restricciones No Negociables

El proyecto no debe introducir comportamiento reflectivo en materiales mate como:

- Tierra
- Piedra
- Arena
- Grava
- Madera
- Hojas
- Materiales rugosos de terreno
- La mayoría de bloques orgánicos o mate de construcción

El proyecto no debe depender de:

- Bloom excesivo
- Saturación extrema
- Grading cinematográfico pesado
- Antorchas blancas por defecto
- Terreno tipo espejo
- Efectos globales sin lógica material

---

## 8. Criterios de Éxito

El proyecto será exitoso cuando:

- Siga sintiéndose como Minecraft.
- Las mejoras visuales sean notables pero contenidas.
- Los materiales se comporten coherentemente.
- Los materiales mate no reflejen.
- La iluminación se sienta natural y legible.
- Los presets sean útiles y estén documentados.
- La comunicación de rendimiento sea honesta.
- La documentación sea clara para usuarios y colaboradores.
- Los releases sean reproducibles.
- El proyecto pueda mostrarse en GitHub, YouTube y portafolio profesional.

---

## 9. Objetivos del Nivel 0

El Nivel 0 existe para establecer la fundación profesional del proyecto antes de empezar con implementación compleja de shader.

### El Nivel 0 debe entregar

- Estructura del repositorio
- README
- ROADMAP
- CHANGELOG
- Guía CONTRIBUTING
- Guía AGENTS
- Licencias
- Templates de issues en GitHub
- Template de pull request
- Especificación Maestra del Proyecto
- Esqueleto documental
- Plan de fundación Nivel 0
- Flujo Git inicial

### El Nivel 0 no debe priorizar

- Implementación de SSR
- God rays
- Niebla avanzada
- Atmósfera compleja
- Implementación del sistema de materiales
- Promesas de rendimiento sin mediciones
- Builds públicas para usuarios finales

---

## 10. Stakeholders del Proyecto

### Propietario del proyecto

El propietario del proyecto es responsable de:

- Dirección creativa
- Dirección técnica
- Control del alcance
- Decisiones de release
- Calidad documental
- Presentación pública

### Colaboradores

Los colaboradores pueden apoyar en:

- Documentación
- Código shader
- Pruebas
- Escenas de validación
- Traducciones
- Perfilado de rendimiento
- Reporte de issues

### Herramientas asistidas por IA

Herramientas de IA como Codex pueden ayudar con:

- Generación de código
- Refactorización
- Documentación
- Trabajo estructural repetitivo
- Redacción de issues o tareas

El trabajo generado por IA debe seguir `AGENTS.md` y la Especificación Maestra del Proyecto.

---

## 11. Posicionamiento de Hardware y Rendimiento

### Hardware de referencia de desarrollo

- RTX 3070 Ti
- 1080p

### Clase objetivo para Lite

- GTX 1050 Ti / RX 570
- Ajustes reducidos
- Expectativas realistas

### Gráficos integrados

- Best effort únicamente para v1.0.0
- Sin promesa formal sin validación real

El proyecto usará cost tiers y tooltips en lugar de fingir que puede entregar uso exacto de GPU o VRAM.

---

## 12. Estrategia de Documentación

El proyecto usa documentación bilingüe.

- Inglés es el idioma canónico.
- Español es traducción oficial.
- Los documentos en inglés deben actualizarse primero.
- Los documentos en español deben mantenerse sincronizados en significado.

La documentación debe apoyar:

- Usuarios
- Colaboradores
- Revisión de portafolio
- Presentación en GitHub
- Desarrollo asistido por IA
- Videos de desarrollo en YouTube

---

## 13. Estrategia de Releases

El proyecto usa dos sistemas de progreso:

1. Niveles del roadmap para progreso interno de ingeniería.
2. Etiquetas de madurez para estabilidad pública.

Mapeo inicial:

| Versión | Nivel del Roadmap | Madurez |
| --- | --- | --- |
| v0.1.0-prealpha | Nivel 0 — Fundación | Pre-alpha |
| v0.2.0-prealpha | Nivel 1 — Visual Base | Pre-alpha |
| v0.3.0-prealpha | Nivel 2 — Núcleo Material | Pre-alpha |
| v0.4.0-alpha | Nivel 3 — Reflejos Selectivos | Alpha |
| v0.5.0-alpha | Nivel 4 — Atmósfera | Alpha |
| v0.8.0-beta | Nivel 5 — Optimización y Preparación de Release | Beta |
| v1.0.0 | Release Estable del Overworld | Stable |

---

## 14. Riesgos Iniciales

Los riesgos iniciales conocidos incluyen:

- Limitaciones de clasificación de materiales en el pipeline del shader
- Artefactos SSR cuando los datos requeridos están fuera de pantalla
- Variación de rendimiento entre GPUs, drivers, mods y distancia de render
- Desincronización documental entre inglés y español
- Expansión de alcance antes de completar la experiencia del Overworld
- Personalización excesiva que pueda romper la identidad visual

Estos riesgos deben documentarse, no ocultarse.

---

## 15. Criterios de Salida del Nivel 0

El Nivel 0 está completo cuando:

- Existe la fundación del repositorio.
- Los archivos raíz de documentación están llenos.
- Existe la Especificación Maestra del Proyecto.
- Existe el plan de fundación del Nivel 0.
- El README explica claramente el proyecto.
- El roadmap define niveles y estados de madurez.
- Las licencias están definidas.
- Existen templates de GitHub.
- Las reglas de colaboración con IA están documentadas.
- El proyecto está listo para iniciar el Nivel 1 — Visual Base.

---

## 16. Regla de Gobierno

Cuando haya incertidumbre, elegir:

1. Identidad vanilla sobre espectáculo
2. Sutileza sobre intensidad
3. Plausibilidad física sobre trucos visuales
4. Rendimiento sobre complejidad innecesaria
5. Documentación sobre improvisación
6. Limitaciones honestas sobre promesas infladas
