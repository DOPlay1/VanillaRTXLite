# Known Risks — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Risk register
- Canonical language: English

---

## 1. Purpose

This document identifies known risks for Vanilla RTX Lite.

The goal is not to make the project look problem-free.

The goal is to document risks early, design around them, and avoid overpromising.

A serious shader project should clearly understand its technical, visual, compatibility, performance, documentation, and scope risks.

---

## 2. Risk Philosophy

Risks should be documented, not hidden.

The project should prefer:

- Honest limitations
- Clear mitigation strategies
- Conservative release claims
- Validation before promises
- Scope control
- Traceable decisions

A risk is not automatically a failure.

A hidden risk becomes a future problem.

---

## 3. Risk Severity Levels

The project uses these severity levels:

| Severity | Meaning |
| --- | --- |
| Low | Manageable, unlikely to block progress |
| Medium | Important, requires attention |
| High | Could block a milestone if ignored |
| Critical | Could invalidate a major project assumption |

---

## 4. Risk Probability Levels

The project uses these probability levels:

| Probability | Meaning |
| --- | --- |
| Low | Unlikely but possible |
| Medium | Reasonably possible |
| High | Likely to occur without mitigation |

---

## 5. Risk Status Values

Allowed risk status values:

| Status | Meaning |
| --- | --- |
| Open | Active risk |
| Monitoring | Known risk being watched |
| Mitigated | Risk has a mitigation strategy in place |
| Accepted | Risk is understood and accepted |
| Closed | Risk no longer applies |

---

## 6. Risk Summary

| ID | Risk | Severity | Probability | Status |
| --- | --- | --- | --- | --- |
| RISK-001 | Material classification limitations | High | Medium | Open |
| RISK-002 | SSR artifacts and limitations | High | High | Open |
| RISK-003 | Performance cost on lower-end GPUs | High | Medium | Open |
| RISK-004 | Matte materials accidentally reflecting | Critical | Medium | Open |
| RISK-005 | Scope creep before Overworld v1.0.0 | High | Medium | Monitoring |
| RISK-006 | Documentation drift between English and Spanish | Medium | Medium | Open |
| RISK-007 | Iris or Minecraft version changes | High | Medium | Open |
| RISK-008 | Driver-specific GLSL behavior | Medium | Medium | Open |
| RISK-009 | Presets becoming inconsistent styles | Medium | Medium | Open |
| RISK-010 | Over-customization breaking visual identity | High | Medium | Open |
| RISK-011 | Vulkan expectations becoming premature | Medium | Low | Monitoring |
| RISK-012 | Lack of validation screenshots early on | Medium | High | Open |
| RISK-013 | AI-generated code violating project rules | High | Medium | Open |
| RISK-014 | User expectations around “RTX” wording | Medium | Medium | Open |
| RISK-015 | Release packaging mistakes | Medium | Medium | Open |

---

## 7. RISK-001 — Material Classification Limitations

### Description

The shader may not always have perfect access to block or material data.

Material mapping may require approximations depending on what the Iris/OpenGL pipeline exposes.

### Impact

If material classification is incomplete or inaccurate, the shader may:

- Apply incorrect material behavior
- Fail to identify reflective surfaces
- Accidentally treat matte surfaces as eligible for effects
- Require conservative fallbacks

### Severity

High

### Probability

Medium

### Mitigation

- Prefer conservative material behavior.
- Default uncertain materials to matte.
- Use debug views for material category validation.
- Document material mapping limitations.
- Avoid strong effects without reliable material gates.

### Related documents

```plaintext
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/08_code_conventions.md
```

---

## 8. RISK-002 — SSR Artifacts and Limitations

### Description

Screen-space reflections can only reflect information available on screen.

SSR may fail, smear, disappear, or create artifacts when reflected information is missing.

### Impact

SSR artifacts may appear on:

- Water
- Glass
- Ice
- Polished surfaces

Common issues include:

- Missing reflections
- Edge artifacts
- Ghosting
- Noisy reflections
- Reflection popping
- Incorrect reflection fallback

### Severity

High

### Probability

High

### Mitigation

- Gate SSR by material.
- Use Fresnel and roughness to reduce visibility of artifacts.
- Provide fallback behavior.
- Reduce SSR quality in Lite.
- Avoid claiming SSR is equivalent to real ray tracing.
- Validate SSR in water and glass scenes.

### Related documents

```plaintext
docs/en/04_render_pipeline.md
docs/en/05_validation_scenes.md
docs/en/06_performance_targets.md
```

---

## 9. RISK-003 — Performance Cost on Lower-End GPUs

### Description

The Lite preset targets lower-end dedicated GPUs such as GTX 1050 Ti / RX 570 class hardware, but performance will depend on resolution, render distance, drivers, mods, and enabled features.

### Impact

The shader may be too expensive if:

- SSR runs too broadly
- Full-screen effects are overused
- Sample counts are too high
- Reflections are not properly gated
- Atmosphere effects become too heavy
- Presets do not reduce enough cost

### Severity

High

### Probability

Medium

### Mitigation

- Keep Lite as a serious target.
- Gate expensive effects by material and preset.
- Use cost tiers instead of false precision.
- Document expensive options.
- Provide fallbacks.
- Validate at 1080p first.

### Related documents

```plaintext
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

## 10. RISK-004 — Matte Materials Accidentally Reflecting

### Description

This is one of the most important risks.

If dirt, stone, wood, leaves, sand, or gravel become reflective, the shader breaks its core philosophy.

### Impact

This would damage:

- Vanilla identity
- Material coherence
- Visual trust
- Project differentiation
- Validation credibility

### Severity

Critical

### Probability

Medium

### Mitigation

- Default uncertain materials to matte.
- Use reflective masks.
- Add debug view for material category and reflective eligibility.
- Validate matte stress scenes.
- Avoid global reflection logic.
- Keep reflection logic centralized.

### Related documents

```plaintext
docs/en/01_vision.md
docs/en/03_material_matrix.md
docs/en/05_validation_scenes.md
docs/en/17_visual_baseline_manifest.md
```

---

## 11. RISK-005 — Scope Creep Before Overworld v1.0.0

### Description

The project may be tempted to add Nether, End, cinematic effects, complex update systems, or too many advanced options before completing a polished Overworld release.

### Impact

Scope creep may cause:

- Delayed v1.0.0
- Unfinished core features
- Documentation overload
- Unstable releases
- Loss of project focus

### Severity

High

### Probability

Medium

### Mitigation

- Keep v1.0.0 Overworld-only.
- Move Nether and End to future milestones.
- Use roadmap levels.
- Record architecture decisions.
- Avoid adding features outside documented scope.

### Related documents

```plaintext
ROADMAP.md
docs/en/00_project_charter.md
docs/en/12_release_strategy.md
```

---

## 12. RISK-006 — Documentation Drift Between English and Spanish

### Description

The project uses English as canonical documentation and Spanish as official translation.

As documents grow, translations may become outdated or inconsistent.

### Impact

Documentation drift may cause:

- Confusion
- Contradictory rules
- Incorrect Codex context
- Public presentation issues
- Maintenance overhead

### Severity

Medium

### Probability

Medium

### Mitigation

- Update English first.
- Update Spanish immediately after.
- Commit bilingual document pairs together when possible.
- Treat English as the source of truth.
- Review translated meaning, not only wording.

### Related documents

```plaintext
docs/en/10_architecture_decisions.md
docs/en/09_git_workflow.md
```

---

## 13. RISK-007 — Iris or Minecraft Version Changes

### Description

Minecraft or Iris updates may change shader behavior, compatibility, available data, or expected file structure.

### Impact

Version changes may cause:

- Shader compile errors
- Broken rendering stages
- Changed uniforms
- Material mapping issues
- Compatibility matrix changes
- Release delays

### Severity

High

### Probability

Medium

### Mitigation

- Validate against specific versions.
- Avoid promising future compatibility before testing.
- Maintain compatibility notes.
- Track Iris and Minecraft versions per release.
- Keep compatibility matrix updated.

### Related documents

```plaintext
docs/en/07_compatibility.md
docs/en/14_compatibility_matrix.md
```

---

## 14. RISK-008 — Driver-Specific GLSL Behavior

### Description

Different GPUs and drivers may handle GLSL behavior differently.

This can affect visual output, performance, precision, or shader compilation.

### Impact

Driver differences may cause:

- Visual inconsistencies
- Compile errors
- Precision artifacts
- Performance differences
- Vendor-specific issues

### Severity

Medium

### Probability

Medium

### Mitigation

- Avoid vendor-specific assumptions.
- Keep code simple and readable.
- Document tested GPU/driver combinations.
- Use compatibility reports.
- Avoid overly fragile GLSL tricks.

### Related documents

```plaintext
docs/en/07_compatibility.md
docs/en/08_code_conventions.md
```

---

## 15. RISK-009 — Presets Becoming Inconsistent Styles

### Description

Lite, Balanced, Quality, Experimental, and Custom may drift into different artistic directions if not controlled.

### Impact

Preset drift may cause:

- Inconsistent user experience
- Confusing screenshots
- Broken visual identity
- Harder validation
- More difficult support

### Severity

Medium

### Probability

Medium

### Mitigation

- Define Balanced as the reference look.
- Keep Quality as fidelity improvement, not style change.
- Keep Lite as lower-cost version of the same identity.
- Isolate Experimental.
- Bound Custom settings.

### Related documents

```plaintext
docs/en/01_vision.md
docs/en/06_performance_targets.md
docs/en/13_option_registry.md
```

---

## 16. RISK-010 — Over-Customization Breaking Visual Identity

### Description

Too many user options or overly wide option ranges could let users create visuals that contradict the project philosophy.

### Impact

Over-customization may cause:

- White torches by normal settings
- Reflective matte materials
- Excessive bloom
- Oversaturation
- Unbounded performance cost
- Screenshots that misrepresent the shader

### Severity

High

### Probability

Medium

### Mitigation

- Bound option ranges.
- Document option constraints.
- Keep non-negotiable material rules locked.
- Use Custom as controlled flexibility.
- Avoid exposing destructive settings.

### Related documents

```plaintext
docs/en/13_option_registry.md
docs/en/01_vision.md
```

---

## 17. RISK-011 — Vulkan Expectations Becoming Premature

### Description

The project may attract expectations around Vulkan before the OpenGL line is mature.

### Impact

Premature Vulkan focus may cause:

- Roadmap confusion
- Delayed OpenGL release
- Technical fragmentation
- Unrealistic user expectations

### Severity

Medium

### Probability

Low

### Mitigation

- Treat Vulkan as a future separate track.
- Do not promise Vulkan release dates.
- Reuse philosophy, not necessarily code.
- Keep OpenGL line stable and valuable.

### Related documents

```plaintext
docs/en/02_technical_spec.md
docs/en/07_compatibility.md
docs/en/10_architecture_decisions.md
```

---

## 18. RISK-012 — Lack of Validation Screenshots Early On

### Description

Early documentation may define validation scenes before real screenshots exist.

### Impact

Without screenshots, validation may be harder to communicate publicly.

### Severity

Medium

### Probability

High

### Mitigation

- Add placeholder scene definitions first.
- Capture curated screenshots later.
- Keep random captures out of commits.
- Use validation notes until screenshots exist.
- Store curated captures under `examples/`.

### Related documents

```plaintext
docs/en/05_validation_scenes.md
examples/
```

---

## 19. RISK-013 — AI-Generated Code Violating Project Rules

### Description

Codex or other AI tools may generate code that looks technically plausible but violates material rules, performance constraints, or visual philosophy.

### Impact

AI-generated changes may introduce:

- Global reflection logic
- Reflective matte materials
- Overly cinematic effects
- Hardcoded hacks
- Large unmaintainable files
- Documentation inconsistencies

### Severity

High

### Probability

Medium

### Mitigation

- Use `AGENTS.md`.
- Use bounded Codex tasks.
- Define allowed and forbidden files.
- Review AI output before committing.
- Keep debug views and validation scenes.
- Reject code that violates project philosophy.

### Related documents

```plaintext
AGENTS.md
docs/en/16_codex_task_protocol.md
docs/en/08_code_conventions.md
```

---

## 20. RISK-014 — User Expectations Around “RTX” Wording

### Description

The name and description may cause some users to expect real RTX, hardware ray tracing, or path tracing.

### Impact

This may cause confusion or disappointment if users misunderstand the project.

### Severity

Medium

### Probability

Medium

### Mitigation

- Clearly state “RTX-like, not real RTX.”
- Avoid claiming ray tracing or path tracing.
- Explain that the project uses OpenGL/GLSL techniques.
- Communicate visual goals honestly.
- Reconsider final branding before public release if needed.

### Related documents

```plaintext
README.md
docs/en/01_vision.md
docs/en/07_compatibility.md
```

---

## 21. RISK-015 — Release Packaging Mistakes

### Description

The shader pack may eventually need to be distributed as a `.zip`.

Packaging mistakes could include missing files, including development-only files, incorrect licenses, or broken folder structure.

### Impact

Packaging mistakes may cause:

- Broken user installation
- Confusing release contents
- License omission
- Extra internal files in release packages
- GitHub release issues

### Severity

Medium

### Probability

Medium

### Mitigation

- Create packaging scripts.
- Define release checklist.
- Test release ZIP before publishing.
- Exclude dev-only files.
- Include license notices.
- Document packaging rules.

### Related documents

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
tools/packaging/
```

---

## 22. Risk Review Process

Risks should be reviewed:

- Before major implementation phases
- Before alpha releases
- Before beta releases
- Before v1.0.0
- When architecture decisions change
- When compatibility issues are discovered

New risks should be added as the project evolves.

---

## 23. Risk Governance Rule

When uncertain, choose:

1. Documented risks over hidden risks
2. Conservative claims over optimistic promises
3. Mitigation plans over wishful thinking
4. Validation over assumptions
5. Scope control over feature expansion
6. User trust over marketing appeal
