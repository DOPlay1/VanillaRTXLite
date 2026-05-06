# Estrategia de Releases — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Estrategia de planeación de releases y versionamiento
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento define la estrategia de releases para Vanilla RTX Lite.

El objetivo es que las releases sean entendibles, trazables, honestas y útiles para usuarios, colaboradores, revisión de portafolio y desarrollo futuro.

El proyecto debe evitar publicar releases que prometan de más sobre estabilidad, compatibilidad, rendimiento o completitud de features.

---

## 2. Filosofía de Release

Vanilla RTX Lite debe publicarse en etapas controladas.

Cada release debe comunicar:

- Qué cambió
- Qué es estable
- Qué es experimental
- Qué se sabe que está incompleto
- Qué fue probado
- Qué no está soportado
- Qué deberían esperar los usuarios

Una release no es solo un archivo descargable.

Una release es un hito documentado del proyecto.

---

## 3. Dos Sistemas de Progreso

El proyecto usa dos sistemas de progreso:

1. Niveles del roadmap
2. Etiquetas de madurez de release

Estos sistemas están relacionados, pero no son idénticos.

---

## 4. Niveles del Roadmap

Los niveles del roadmap describen progreso interno de ingeniería.

Responden:

- ¿Qué estamos construyendo?
- ¿Qué depende de qué?
- ¿Qué debería implementarse primero?
- ¿Qué no debería implementarse todavía?

Niveles iniciales del roadmap:

| Nivel | Nombre | Enfoque Principal |
| --- | --- | --- |
| Nivel 0 | Fundación | Repositorio, documentación, flujo de trabajo |
| Nivel 1 | Visual Base | Pipeline mínimo de shader e infraestructura de debug |
| Nivel 2 | Núcleo Material | Clasificación material, roughness, Fresnel |
| Nivel 3 | Reflejos Selectivos | Agua, vidrio, hielo, SSR controlado |
| Nivel 4 | Atmósfera | Niebla, iluminación de antorchas, atmósfera sutil |
| Nivel 5 | Optimización y Preparación de Release | Presets, validación, empaquetado |
| Stable | Release del Overworld | Release pública v1.0.0 enfocada en Overworld |

---

## 5. Etiquetas de Madurez

Las etiquetas de madurez describen estabilidad pública.

Responden:

- ¿Qué tan estable es esta release?
- ¿Quién debería usarla?
- ¿Es para pruebas o para juego normal?
- ¿Cuánta inestabilidad deberían esperar los usuarios?

Etiquetas de madurez permitidas:

| Etiqueta | Significado |
| --- | --- |
| Pre-alpha | Fundación o implementación temprana; no lista para usuarios |
| Alpha | Existen features, pero se espera inestabilidad |
| Beta | El conjunto de features está más cerca de release, validación activa |
| Release Candidate | Candidato a release estable bajo revisión final |
| Stable | Release pública pensada para uso general |

---

## 6. Mapeo de Versiones

Mapeo sugerido de versiones:

| Versión | Nivel del Roadmap | Madurez | Objetivo Principal |
| --- | --- | --- | --- |
| v0.1.0-prealpha | Nivel 0 — Fundación | Pre-alpha | Fundación de repositorio y documentación |
| v0.2.0-prealpha | Nivel 1 — Visual Base | Pre-alpha | Carga mínima del shader y estructura debug |
| v0.3.0-prealpha | Nivel 2 — Núcleo Material | Pre-alpha | Clasificación material y helpers centrales |
| v0.4.0-alpha | Nivel 3 — Reflejos Selectivos | Alpha | Lógica de reflejos para materiales aprobados |
| v0.5.0-alpha | Nivel 4 — Atmósfera | Alpha | Niebla, iluminación de antorchas, atmósfera sutil |
| v0.8.0-beta | Nivel 5 — Optimización y Preparación de Release | Beta | Presets, validación, empaquetado |
| v1.0.0-rc.1 | Candidato Estable | Release Candidate | Validación final del Overworld |
| v1.0.0 | Release Estable del Overworld | Stable | Primera release pública estable enfocada en Overworld |

Este mapeo puede evolucionar, pero los cambios mayores deben documentarse en decisiones de arquitectura.

---

## 7. Política de Releases Pre-alpha

Las releases pre-alpha no están pensadas para usuarios normales.

Las releases pre-alpha pueden incluir:

- Fundación documental
- Estructura del repositorio
- Carga mínima del shader
- Infraestructura debug temprana
- Sistemas placeholder
- Fundaciones técnicas experimentales

Las releases pre-alpha pueden estar incompletas, inestables o no ser visualmente representativas.

### Pre-alpha debe comunicar

- Qué existe
- Qué no existe todavía
- Qué no debe esperarse
- Si hay un shader pack descargable disponible
- Si la release es principalmente documental o de código

---

## 8. Política de Releases Alpha

Las releases alpha pueden incluir features visuales visibles.

Las releases alpha son para pruebas, feedback y validación técnica.

Las releases alpha pueden incluir:

- Render basado en materiales
- Reflejos tempranos
- Atmósfera temprana
- Debug views
- Presets iniciales
- Artefactos conocidos

Las releases alpha no deben presentarse como estables.

### Alpha debe comunicar

- Problemas visuales conocidos
- Problemas de rendimiento conocidos
- Entornos probados
- Escenarios no soportados
- Features experimentales
- Escenas de validación revisadas

---

## 9. Política de Releases Beta

Las releases beta deben estar más cerca de estar listas para usuarios.

Las releases beta deberían incluir:

- Comportamiento del Overworld más completo
- Ajuste de presets
- Revisión de rendimiento
- Notas de compatibilidad
- Problemas conocidos
- Capturas o notas de validación
- Pruebas de empaquetado

Las releases beta todavía pueden contener bugs, pero la dirección central debe ser estable.

### Beta debe comunicar

- Qué necesita validación final
- Qué se espera que permanezca estable
- Qué aún puede cambiar
- Presets recomendados
- Limitaciones conocidas de compatibilidad

---

## 10. Política de Release Candidate

Los release candidates están pensados para convertirse en stable si no se encuentran problemas mayores.

Un release candidate debería incluir:

- Alcance finalizado para Overworld
- Presets validados
- Verificación de empaquetado
- Changelog actualizado
- Notas de compatibilidad actualizadas
- Checklist de release actualizado
- Problemas conocidos revisados
- Sin features mayores planeadas antes de stable

Los release candidates deben enfocarse en correcciones y validación, no en features nuevas.

---

## 11. Política de Release Stable

Una release stable debe ser adecuada para uso público general dentro del alcance documentado.

Para `v1.0.0`, stable significa:

- Release enfocada en Overworld
- Comportamiento material documentado
- Presets funcionales
- Escenas centrales validadas
- Limitaciones conocidas documentadas
- Paquete de release probado
- Sin afirmaciones falsas de RTX/path tracing
- Expectativas de rendimiento comunicadas honestamente

Stable no significa:

- Rendimiento perfecto en todo hardware
- Soporte completo para Nether
- Soporte completo para End
- Ray tracing real
- Compatibilidad universal con modpacks
- Compatibilidad universal con resource packs

---

## 12. Alcance de v1.0.0

La primera release estable apunta a:

```plaintext
Solo Overworld
```

Requerido para v1.0.0:

- Iluminación del Overworld
- Exposición controlada
- Tonemap neutral
- Comportamiento basado en materiales
- Protección de materiales mate
- Comportamiento de agua
- Comportamiento de vidrio
- Comportamiento de hielo
- Respuesta pulida sutil tipo cuarzo
- Diferenciación de cobre
- Respuesta sutil de amatista
- Calidez de antorchas
- Niebla/atmósfera sutil
- Presets
- Comunicación de cost tiers
- Paquete de release
- Documentación

Fuera de alcance para v1.0.0:

- Soporte completo para Nether
- Soporte completo para End
- Ray tracing real
- Path tracing
- Línea de producción Vulkan
- Updater interno
- Reporte exacto de uso GPU
- Reporte exacto de uso VRAM

---

## 13. Flujo de Release con Git

Ramas principales:

```plaintext
main
dev
```

### `dev`

Rama activa de integración.

Usada para:

- Documentación en progreso
- Implementación activa
- Integración de features
- Preparación de pre-release

### `main`

Rama estable o lista para release.

Usada para:

- Rama pública por defecto
- Estado listo para release
- Tags
- GitHub releases

### Flujo recomendado

```powershell
git checkout dev
git pull
# trabajar, commit, push
git checkout main
git pull
git merge dev
git push
git checkout dev
```

Los tags de release deben crearse desde `main`.

---

## 14. Estrategia de Tags

Usar tags anotados para releases.

Ejemplo:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Los nombres de tags deben seguir:

```plaintext
vMAJOR.MINOR.PATCH
vMAJOR.MINOR.PATCH-prealpha
vMAJOR.MINOR.PATCH-alpha
vMAJOR.MINOR.PATCH-beta
vMAJOR.MINOR.PATCH-rc.N
```

Ejemplos:

```plaintext
v0.1.0-prealpha
v0.4.0-alpha
v0.8.0-beta
v1.0.0-rc.1
v1.0.0
```

---

## 15. Política de Changelog

Toda release debe actualizar:

```plaintext
CHANGELOG.md
```

El changelog debe incluir:

- Added
- Changed
- Fixed
- Removed
- Known limitations
- Compatibility notes cuando aplique

El changelog no debe exagerar la completitud de features.

---

## 16. Notas de GitHub Release

Las notas de GitHub Release deben incluir:

```plaintext
Versión de release:
Madurez:
Nivel del roadmap:
Versión de Minecraft:
Versión de Iris:
Cambios principales:
Problemas conocidos:
Notas de compatibilidad:
Notas de rendimiento:
Instrucciones de descarga:
```

Las notas de release deben ser entendibles tanto para usuarios técnicos como no técnicos.

---

## 17. Política de Paquete de Release

Eventualmente, el shader pack debe distribuirse como un `.zip` limpio.

El paquete de release debe incluir:

- Archivos requeridos del shader
- `shaders/shaders.properties`
- Avisos de licencia requeridos
- Documentación mínima para usuario si aplica

El paquete de release debe excluir:

- Metadata de Git
- Notas internas de desarrollo
- Capturas aleatorias
- Archivos locales de IDE
- Archivos internos de planeación salvo que se incluyan intencionalmente
- Archivos experimentales no liberados
- Logs temporales
- Build artifacts no necesarios para usuarios

---

## 18. Política de Scripts de Empaquetado

Los scripts futuros de empaquetado pueden vivir en:

```plaintext
tools/packaging/
```

Scripts recomendados:

```plaintext
tools/packaging/build_pack.ps1
tools/packaging/build_pack.sh
```

El proceso de empaquetado debería eventualmente:

1. Validar que los archivos requeridos existan.
2. Excluir archivos solo de desarrollo.
3. Incluir avisos de licencia.
4. Generar un `.zip` limpio.
5. Imprimir el contenido del paquete.
6. Evitar sobrescribir releases accidentalmente.

---

## 19. Dependencia del Checklist de Release

Antes de cualquier release pública, usar:

```plaintext
docs/en/15_release_checklist.md
docs/es/15_checklist_de_release.md
```

El checklist de release debe confirmar:

- Número de versión
- Changelog
- Notas de compatibilidad
- Escenas de validación
- Riesgos conocidos
- Empaquetado
- Avisos de licencia
- Git tag
- Notas de GitHub Release

---

## 20. Notas de Compatibilidad

Toda release pública debe documentar compatibilidad probada.

Campos recomendados:

```plaintext
Versión de Minecraft:
Versión de Iris:
Loader:
Sistema operativo:
GPU:
Driver:
Resolución:
Preset probado:
Problemas conocidos:
Escenarios no soportados:
```

Si algo no se ha probado, decirlo.

---

## 21. Notas de Rendimiento

Las notas de rendimiento deben ser honestas.

Afirmaciones permitidas:

- “Validado en RTX 3070 Ti a 1080p.”
- “Costo estimado: High.”
- “Lite está pensado para GPUs dedicadas de menor potencia.”
- “El rendimiento depende de resolución, distancia de render, mods, drivers y preset.”

Afirmaciones prohibidas:

- “60 FPS garantizados.”
- “Usa exactamente 2 GB de VRAM.”
- “Detecta automáticamente uso exacto de GPU.”
- “Garantizado en todos los gráficos integrados.”

---

## 22. Política de Screenshots

Las capturas usadas en notas de release deben ser curadas.

Tipos de captura recomendados:

- Comparación Vanilla
- Preset Balanced
- Preset Lite si aplica
- Preset Quality si aplica
- Debug view cuando se explique comportamiento técnico

No usar capturas engañosas que oculten problemas conocidos.

---

## 23. Política de Features Experimentales

Las features experimentales deben etiquetarse claramente.

Las features experimentales no deben usarse para definir la identidad visual estable.

Si una feature experimental se incluye en una release:

- Documentarla claramente.
- Explicar problemas conocidos.
- Mantenerla desactivada por defecto salvo justificación.
- No presentarla como estable.

---

## 24. Política de Breaking Changes

Los breaking changes pueden ocurrir antes de v1.0.0.

Antes de stable, los breaking changes son aceptables si mejoran:

- Arquitectura
- Corrección material
- Rendimiento
- Documentación
- Comportamiento de presets
- Mantenibilidad a largo plazo

Después de v1.0.0, los breaking changes deben documentarse con más cuidado.

---

## 25. Criterios de Preparación de Release

Una release está lista cuando:

- El alcance previsto está suficientemente completo para la etiqueta de madurez.
- El changelog está actualizado.
- Las limitaciones conocidas están documentadas.
- Las notas de compatibilidad están incluidas.
- La validación se ha realizado cuando aplica.
- El paquete fue probado.
- El tag de versión está listo.
- No hay archivos locales accidentales.
- La release no promete de más.

---

## 26. Regla de Gobierno de Release

Cuando haya incertidumbre, elegir:

1. Etiquetas de madurez honestas sobre etiquetas impresionantes
2. Alcance claro sobre promesas amplias
3. Compatibilidad probada sobre compatibilidad asumida
4. Limitaciones conocidas sobre problemas ocultos
5. Paquetes limpios sobre releases apresuradas
6. Confianza del usuario sobre atractivo de marketing
