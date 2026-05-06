# Checklist de Release — Vanilla RTX Lite

## Estado

- Etapa del roadmap: Nivel 0 — Fundación
- Madurez: Pre-alpha
- Tipo de documento: Checklist de release
- Idioma canónico: Inglés

---

## 1. Propósito

Este documento define el checklist de release para Vanilla RTX Lite.

El objetivo es que cada release pública sea controlada, reproducible, documentada y honesta.

Una release no debe publicarse hasta que su alcance, limitaciones, compatibilidad, empaquetado y problemas conocidos estén claros.

---

## 2. Relación con la Estrategia de Releases

La estrategia de releases está definida en:

```plaintext
docs/en/12_release_strategy.md
```

Ese documento explica cómo se planean las releases.

Este checklist define qué debe verificarse antes de publicar una release.

---

## 3. Filosofía del Checklist de Release

Una release es más que un archivo descargable.

Una release debe incluir:

- Una versión clara
- Una etiqueta de madurez
- Un alcance definido
- Changelog actualizado
- Notas de compatibilidad
- Limitaciones conocidas
- Contenido de paquete validado
- Avisos de licencia
- Git tag
- Notas de GitHub Release

El proyecto debe evitar releases apresuradas que prometan de más o confundan a los usuarios.

---

## 4. Identificación de Release

Antes de preparar una release, confirmar:

| Ítem | Estado |
| --- | --- |
| Versión de release definida | Pending |
| Etiqueta de madurez definida | Pending |
| Nivel del roadmap identificado | Pending |
| Alcance de release claro | Pending |
| Rama de release limpia | Pending |
| Release alineada con roadmap | Pending |

Formato recomendado de versión:

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

## 5. Verificación de Alcance

Confirmar el alcance de la release.

| Ítem | Estado |
| --- | --- |
| Features incluidas listadas | Pending |
| Features excluidas listadas | Pending |
| Áreas incompletas conocidas documentadas | Pending |
| Features experimentales etiquetadas | Pending |
| Escenarios no soportados documentados | Pending |
| La release no excede el alcance del roadmap | Pending |

Para `v1.0.0`, el alcance estable es:

```plaintext
Solo Overworld
```

---

## 6. Verificación de Documentación

Antes de release, verificar que la documentación relevante esté actualizada.

| Documento | Requerido | Estado |
| --- | --- | --- |
| `README.md` | Sí | Pending |
| `CHANGELOG.md` | Sí | Pending |
| `ROADMAP.md` | Sí | Pending |
| `docs/en/12_release_strategy.md` | Sí | Pending |
| `docs/en/14_compatibility_matrix.md` | Sí | Pending |
| `docs/en/15_release_checklist.md` | Sí | Pending |
| `docs/en/11_known_risks.md` | Recomendado | Pending |
| `docs/en/05_validation_scenes.md` | Recomendado | Pending |
| `docs/en/13_option_registry.md` | Si cambian opciones | Pending |
| Documentación en español | Si aplica | Pending |

La documentación no debe afirmar features que no están incluidas.

---

## 7. Checklist de Changelog

Antes de release, actualizar:

```plaintext
CHANGELOG.md
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| Versión de release añadida | Pending |
| Fecha de release añadida | Pending |
| Sección Added actualizada | Pending |
| Sección Changed actualizada | Pending |
| Sección Fixed actualizada | Pending |
| Sección Removed actualizada si aplica | Pending |
| Limitaciones conocidas añadidas | Pending |
| Notas de compatibilidad añadidas si aplica | Pending |
| Sin afirmaciones exageradas | Pending |

Secciones sugeridas para changelog:

```plaintext
Added
Changed
Fixed
Removed
Known limitations
Compatibility notes
```

---

## 8. Checklist de Compatibilidad

Antes de release, actualizar información de compatibilidad.

| Ítem | Estado |
| --- | --- |
| Versión de Minecraft documentada | Pending |
| Versión de Iris documentada | Pending |
| Loader documentado | Pending |
| Sistema operativo documentado | Pending |
| GPU documentada | Pending |
| Driver documentado si se conoce | Pending |
| Resolución documentada | Pending |
| Presets probados documentados | Pending |
| Escenarios no soportados documentados | Pending |
| Matriz de compatibilidad actualizada | Pending |

Si algo no fue probado, marcarlo como:

```plaintext
Unknown
```

No afirmar soporte basándose en suposiciones.

---

## 9. Checklist de Validación

Antes de release, validar las escenas correspondientes.

Escenas mínimas recomendadas para releases públicas:

| Escena | Requerida para v1.0.0 | Estado |
| --- | --- | --- |
| Exterior al mediodía | Sí | Pending |
| Noche con antorchas | Sí | Pending |
| Río o lago | Sí | Pending |
| Transición con vidrio | Sí | Pending |
| Cueva | Sí | Pending |
| Entorno de hielo o nieve | Sí | Pending |
| Cobre nuevo vs cobre oxidado | Sí | Pending |
| Escena de estrés de materiales mate | Sí | Pending |
| Escena de lluvia | Recomendado | Pending |
| Escena de amatista | Recomendado | Pending |

Para releases pre-alpha solo documentales, la validación visual puede marcarse como no aplicable.

---

## 10. Checklist de Reglas Materiales

Confirmar que la release no rompe reglas materiales.

| Regla | Estado |
| --- | --- |
| La tierra no refleja | Pending |
| La piedra no refleja | Pending |
| La madera no se vuelve glossy por defecto | Pending |
| Las hojas no se ven mojadas por defecto | Pending |
| Arena y grava permanecen difusas | Pending |
| El agua es reflectiva pero no espejo perfecto | Pending |
| El vidrio permanece legible | Pending |
| El hielo es reflectivo pero no vidrio limpio | Pending |
| La oxidación del cobre reduce respuesta material | Pending |
| La amatista permanece sutil | Pending |

Si estas reglas todavía no pueden validarse, marcarlas claramente como no aplicables o no implementadas.

---

## 11. Checklist de Rendimiento

Antes de release, documentar rendimiento de forma honesta.

| Ítem | Estado |
| --- | --- |
| GPU probada documentada | Pending |
| Resolución probada documentada | Pending |
| Preset probado documentado | Pending |
| Distancia de render documentada | Pending |
| Notas de FPS añadidas si están disponibles | Pending |
| Opciones costosas conocidas documentadas | Pending |
| Cost tiers revisados | Pending |
| Sin afirmaciones exactas de uso GPU | Pending |
| Sin afirmaciones exactas de uso VRAM | Pending |
| Sin garantía universal de FPS | Pending |

Lenguaje permitido:

```plaintext
Validated on RTX 3070 Ti at 1080p.
Estimated cost: High.
Performance depends on GPU, resolution, render distance, mods, drivers, and preset.
```

Lenguaje prohibido:

```plaintext
Guaranteed 60 FPS.
Uses exactly 2 GB VRAM.
Works perfectly on all GPUs.
Automatically detects exact GPU usage.
```

---

## 12. Checklist de Presets

Antes de release, verificar comportamiento de presets.

| Preset | Verificación requerida | Estado |
| --- | --- | --- |
| Lite | El comportamiento de menor costo sigue siendo usable | Pending |
| Balanced | Representa la identidad visual de referencia | Pending |
| Quality | Mejora fidelidad sin cambiar estilo | Pending |
| Experimental | Etiquetado claramente como inestable/pruebas | Pending |
| Custom | No rompe restricciones del proyecto | Pending |

Si un preset no está listo, documentarlo.

No implicar que todos los presets están igualmente validados salvo que se hayan probado.

---

## 13. Checklist de Opciones

Si las opciones del shader cambiaron, verificar:

| Ítem | Estado |
| --- | --- |
| Registro de opciones actualizado | Pending |
| Defaults documentados | Pending |
| Valores permitidos documentados | Pending |
| Tier de costo documentado | Pending |
| Impacto visual documentado | Pending |
| Dependencias documentadas | Pending |
| Restricciones documentadas | Pending |
| Tooltips revisados | Pending |
| Opciones inseguras evitadas | Pending |

Ninguna opción debe permitir:

```plaintext
Global reflections on matte materials
Extreme bloom
Unbounded saturation
White torch default
Mirror terrain
Disable material rules
```

---

## 14. Checklist de Debug

Si existen debug views en la release, verificar:

| Debug View | Estado |
| --- | --- |
| Modo Off/default funciona | Pending |
| Material ID/category funciona | Pending |
| Reflective mask funciona | Pending |
| Roughness funciona | Pending |
| Fresnel funciona | Pending |
| Specular contribution funciona | Pending |
| SSR contribution funciona | Pending |
| Exposure/luminance funciona | Pending |
| Debug views no afectan salida normal cuando están en Off | Pending |

Los debug views son infraestructura requerida, pero su exposición pública puede depender de la madurez de la release.

---

## 15. Checklist de Empaquetado

Antes de publicar un shader pack descargable, verificar:

| Ítem | Estado |
| --- | --- |
| El paquete se genera correctamente | Pending |
| El paquete se instala correctamente | Pending |
| Archivos shader requeridos incluidos | Pending |
| `shaders/shaders.properties` incluido | Pending |
| Avisos de licencia incluidos | Pending |
| Archivos solo de desarrollo excluidos | Pending |
| Archivos temporales excluidos | Pending |
| Capturas aleatorias excluidas | Pending |
| Metadata Git excluida | Pending |
| Contenido del paquete revisado | Pending |

El paquete debe ser un `.zip` limpio.

---

## 16. Archivos que No Deben Estar en Paquetes de Release

Los paquetes de release no deben incluir:

```plaintext
.git/
.github/
docs/internal drafts
random screenshots
recordings
local IDE settings
temporary files
logs
unreleased experiments
personal notes
build cache
```

La documentación interna del repositorio puede permanecer en GitHub, pero el shader pack descargable debe mantenerse enfocado en el usuario.

---

## 17. Checklist de Licencias

Antes de release, verificar:

| Ítem | Estado |
| --- | --- |
| Licencia de shader/código incluida | Pending |
| Licencia de documentación incluida si aplica | Pending |
| Avisos de terceros incluidos si aplica | Pending |
| Archivo LICENSE presente | Pending |
| Archivo LICENSE-DOCS presente si se usa | Pending |
| El paquete de release incluye avisos requeridos | Pending |

No publicar paquetes con información de licencia faltante o poco clara.

---

## 18. Checklist Git

Antes de crear un tag de release:

```powershell
git status
git log --oneline --decorate --max-count=10
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| Working tree limpio | Pending |
| Rama correcta activa | Pending |
| Últimos commits subidos | Pending |
| `main` actualizada | Pending |
| Commit de release en `main` | Pending |
| Sin archivos accidentales trackeados | Pending |
| Historial de commits entendible | Pending |

---

## 19. Checklist de Rama Main

Antes de release:

```powershell
git checkout main
git pull
git merge dev
git push
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| `main` contiene trabajo listo para release | Pending |
| `dev` fue mergeada intencionalmente | Pending |
| No quedan conflictos de merge | Pending |
| La rama default en GitHub se ve correctamente | Pending |
| README se ve correcto en GitHub | Pending |

---

## 20. Checklist de Tag

Crear un tag anotado solo después de que el estado de release esté listo.

Ejemplo:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| El nombre del tag sigue formato de versión | Pending |
| El tag apunta al commit correcto | Pending |
| El mensaje del tag es claro | Pending |
| El tag fue subido a origin | Pending |

---

## 21. Checklist de Notas de GitHub Release

Las notas de GitHub Release deben incluir:

```plaintext
Release version:
Maturity:
Roadmap level:
Minecraft version:
Iris version:
Main changes:
Known issues:
Compatibility notes:
Performance notes:
Download instructions:
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| Las notas de release son entendibles | Pending |
| Problemas conocidos incluidos | Pending |
| Escenarios no soportados incluidos | Pending |
| Instrucciones de descarga claras | Pending |
| Sin afirmaciones no soportadas | Pending |
| Capturas no engañosas | Pending |

---

## 22. Checklist de Capturas

Si se incluyen capturas:

| Ítem | Estado |
| --- | --- |
| Capturas curadas | Pending |
| Nombres de escenas documentados | Pending |
| Preset usado documentado | Pending |
| Comparación Vanilla incluida si aplica | Pending |
| Captura de debug view incluida si ayuda | Pending |
| Problemas conocidos no ocultos | Pending |
| Imágenes almacenadas en carpeta correcta | Pending |

Carpetas recomendadas:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

---

## 23. Checklist de Problemas Conocidos

Antes de release, revisar:

```plaintext
docs/en/11_known_risks.md
```

Confirmar:

| Ítem | Estado |
| --- | --- |
| Problemas conocidos documentados | Pending |
| Riesgos abiertos siguen siendo correctos | Pending |
| Nuevos riesgos añadidos si se descubrieron | Pending |
| Notas de release mencionan problemas importantes | Pending |
| No quedan blockers mayores ocultos | Pending |

---

## 24. Checklist Específico Pre-alpha

Para releases pre-alpha, confirmar:

| Ítem | Estado |
| --- | --- |
| Release etiquetada claramente como Pre-alpha | Pending |
| Usuarios entienden que puede no estar lista para gameplay | Pending |
| Features faltantes listadas | Pending |
| Estado solo documental claro si aplica | Pending |
| Sin afirmaciones de calidad estable | Pending |

---

## 25. Checklist Específico Alpha

Para releases alpha, confirmar:

| Ítem | Estado |
| --- | --- |
| Features visibles listadas | Pending |
| Artefactos conocidos listados | Pending |
| Escenas probadas listadas | Pending |
| Limitaciones de rendimiento listadas | Pending |
| Sistemas experimentales etiquetados | Pending |
| Release no presentada como stable | Pending |

---

## 26. Checklist Específico Beta

Para releases beta, confirmar:

| Ítem | Estado |
| --- | --- |
| Core feature set casi completo | Pending |
| Presets validados | Pending |
| Empaquetado probado | Pending |
| Notas de compatibilidad actualizadas | Pending |
| Problemas conocidos manejables | Pending |
| Tareas finales de validación listadas | Pending |

---

## 27. Checklist Específico Stable

Para releases stable, confirmar:

| Ítem | Estado |
| --- | --- |
| Alcance completo | Pending |
| Validación del Overworld completada | Pending |
| Paquete de release probado | Pending |
| Documentación actualizada | Pending |
| Changelog actualizado | Pending |
| Matriz de compatibilidad actualizada | Pending |
| Limitaciones conocidas claras | Pending |
| GitHub release lista | Pending |
| Sin afirmaciones falsas de RTX/path tracing | Pending |

---

## 28. Secuencia Final Recomendada Antes de Release

Secuencia final recomendada:

```powershell
git checkout dev
git pull
git status

git checkout main
git pull
git merge dev
git push

git status
git tag -a vX.Y.Z-label -m "vX.Y.Z-label — Release title"
git push origin vX.Y.Z-label
```

Reemplazar `vX.Y.Z-label` con la versión real de release.

---

## 29. Notas de Aprobación de Release

Antes de publicar, escribir notas internas breves de aprobación:

```plaintext
Release:
Maturity:
Approved scope:
Known limitations:
Tested environment:
Package verified:
Ready for GitHub release:
```

Estas notas pueden incluirse en issues de preparación de release o documentación.

---

## 30. Regla de Gobierno de Release

Cuando haya incertidumbre, elegir:

1. Retrasar release sobre publicar trabajo poco claro
2. Notas honestas sobre marketing pulido
3. Paquetes probados sobre paquetes asumidos
4. Limitaciones conocidas sobre problemas ocultos
5. Etiquetas de madurez claras sobre redacción impresionante
6. Confianza del usuario sobre velocidad
