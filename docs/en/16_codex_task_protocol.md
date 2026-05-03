# Codex Task Protocol — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: AI-assisted development protocol
- Canonical language: English

---

## 1. Purpose

This document defines the protocol for using Codex or other AI-assisted coding tools on Vanilla RTX Lite.

The goal is to make AI-assisted work safe, bounded, reviewable, and aligned with the project philosophy.

AI tools may help with implementation, refactoring, documentation, and repetitive repository work, but they must not make uncontrolled architectural or visual decisions.

---

## 2. Relationship to Other Documents

Codex tasks must follow:

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

For release-related work, Codex must also follow:

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
```

For shader options, Codex must also follow:

```plaintext
docs/en/13_option_registry.md
```

---

## 3. Core Rule

Codex must be given bounded tasks.

Do not ask Codex to:

```plaintext
Build the whole shader.
Make it look RTX.
Improve everything.
Optimize the project.
Add reflections.
Make it realistic.
```

These instructions are too broad and can cause uncontrolled changes.

Instead, give Codex:

- A specific objective
- Allowed files
- Forbidden files
- Constraints
- Acceptance criteria
- Required documentation updates
- Expected commit scope

---

## 4. AI-Assisted Work Philosophy

Codex should help implement decisions that are already documented.

Codex should not invent the project direction.

AI-assisted work should support:

- Traceability
- Small changes
- Reviewability
- Documentation consistency
- Material correctness
- Performance awareness
- Preset discipline
- Debuggability

AI output must always be reviewed before commit.

---

## 5. Required Context Before Codex Tasks

Before starting a Codex task, provide or reference the required documents.

Minimum context for shader code tasks:

```plaintext
AGENTS.md
docs/en/master_project_specification.md
docs/en/01_vision.md
docs/en/02_technical_spec.md
docs/en/03_material_matrix.md
docs/en/04_render_pipeline.md
docs/en/08_code_conventions.md
```

Minimum context for documentation tasks:

```plaintext
AGENTS.md
docs/en/master_project_specification.md
README.md
ROADMAP.md
Relevant docs/en file
Relevant docs/es file if translation is needed
```

Minimum context for release tasks:

```plaintext
docs/en/12_release_strategy.md
docs/en/15_release_checklist.md
CHANGELOG.md
README.md
```

---

## 6. Task Template

Use this template when assigning work to Codex:

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

## 7. Example Task — Documentation Update

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

## 8. Example Task — Shader Helper

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
- Runtime entrypoint files directly under shaders/
- shaders/*.vsh
- shaders/*.fsh
- docs/*
- README.md

Constraints:
- Do not enable reflections.
- Do not modify material classification.
- Do not add SSR.
- Do not apply Fresnel globally.
- Do not modify runtime entrypoint files.
- Helper must be bounded to avoid exaggerated edge glow.
- Code must be readable and documented.

Acceptance criteria:
- Helper function exists.
- Function has clear parameters.
- Function clamps output.
- Function comment explains that it must not be used to enable reflections on matte materials.
- No unrelated files are changed.

Validation steps:
- Review diff.
- Check naming conventions.
- Confirm no global reflection logic was introduced.
- Confirm no runtime entrypoint files were modified.

Expected commit message:
feat(fresnel): add bounded fresnel helper
```

---

## 9. Example Task — Debug View Selector

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

## 10. Allowed Codex Task Types

Codex may be used for:

- Creating small GLSL helpers
- Refactoring focused code sections
- Adding debug view infrastructure
- Updating documentation
- Creating packaging scripts
- Adding validation templates
- Improving comments
- Cleaning repeated structure
- Drafting release notes
- Creating issue templates
- Creating checklist updates

---

## 11. Task Types Requiring Extra Caution

Use extra caution with Codex for:

- Reflection systems
- SSR
- Material classification
- Tonemapping
- Color grading
- Preset behavior
- Performance-sensitive code
- Release packaging
- Compatibility claims
- Vulkan-related planning

These areas can easily violate project philosophy if the task is too broad.

---

## 12. Forbidden Codex Task Types

Do not ask Codex to:

- Add global reflections
- Make every block shiny
- Add cinematic mode
- Add extreme bloom
- Add unbounded saturation
- Disable material rules
- Promise exact GPU or VRAM usage
- Claim real RTX, ray tracing, or path tracing
- Rewrite the full project without review
- Change licenses without explicit instruction
- Modify unrelated files casually

---

## 13. Allowed Files Discipline

Every Codex task should list allowed files.

Example:

```plaintext
Allowed files to modify:
- shaders/lib/fresnel.glsl
- shaders/include/constants.glsl
```

If Codex modifies files outside the allowed list, those changes should be rejected unless there is a clear reason and human approval.

---

## 14. Forbidden Files Discipline

Every risky Codex task should list forbidden files.

Example:

```plaintext
Files that must not be modified:
- README.md
- ROADMAP.md
- docs/en/master_project_specification.md
- LICENSE
- LICENSE-DOCS
```

This prevents accidental changes to project identity, legal files, or roadmap documents.

---

## 15. Acceptance Criteria

Every Codex task must include acceptance criteria.

Good acceptance criteria are:

- Specific
- Testable
- Limited
- Related to the objective
- Clear about what must not break

Weak acceptance criteria:

```plaintext
Make it better.
Improve performance.
Make it realistic.
Clean it up.
```

Better acceptance criteria:

```plaintext
- Add one helper function.
- Do not modify program entry files.
- Do not enable reflections globally.
- Keep matte materials non-reflective.
- Add a short comment explaining the constraint.
```

---

## 16. Review Process

After Codex modifies files:

1. Run `git status`.
2. Review changed files.
3. Run `git diff --stat`.
4. Review `git diff`.
5. Confirm only allowed files changed.
6. Confirm forbidden files did not change.
7. Confirm project philosophy was not violated.
8. Confirm documentation remains accurate.
9. Commit only reviewed work.

---

## 17. Git Commands for Review

Recommended commands:

```powershell
git status
git diff --stat
git diff
```

For specific files:

```powershell
git diff -- shaders/lib/fresnel.glsl
```

For documentation files:

```powershell
Get-Content ".\docs\en\file.md" -TotalCount 5
Get-Content ".\docs\en\file.md" -Tail 10
```

---

## 18. Branching for Codex Work

For larger Codex tasks, create a task branch from `dev`.

Example:

```powershell
git checkout dev
git pull
git checkout -b feature/fresnel-helper
```

For documentation-only tasks during early pre-alpha, direct work on `dev` may be acceptable, but branch-based work is preferred as the project grows.

---

## 19. Commit Strategy for Codex Work

Codex-assisted commits should remain small.

Good commit examples:

```plaintext
feat(fresnel): add bounded fresnel helper
feat(debug): add debug view constants
docs(options): document debug view registry
refactor(materials): split material helpers
```

Avoid:

```plaintext
feat(shader): add everything
update codex changes
ai work
big improvements
```

---

## 20. Documentation Updates

If Codex changes behavior, related documentation may need updates.

Examples:

| Code Change | Documentation to Check |
| --- | --- |
| New option | `docs/en/13_option_registry.md` |
| New material behavior | `docs/en/03_material_matrix.md` |
| New debug view | `docs/en/04_render_pipeline.md`, `docs/en/13_option_registry.md` |
| Performance change | `docs/en/06_performance_targets.md` |
| Release process change | `docs/en/12_release_strategy.md`, `docs/en/15_release_checklist.md` |
| Compatibility finding | `docs/en/14_compatibility_matrix.md` |

Documentation should not drift away from implementation.

---

## 21. Material Safety Review

For any Codex-generated rendering code, verify:

- Dirt remains non-reflective.
- Stone remains non-reflective.
- Wood remains non-glossy by default.
- Leaves do not look wet by default.
- Sand and gravel remain diffuse.
- Reflection is material-gated.
- Fresnel does not affect matte materials.
- Roughness is respected.
- Debug views can explain the behavior.

If any of these fail, reject or revise the change.

---

## 22. Performance Safety Review

For performance-sensitive Codex output, verify:

- Expensive effects are not global by default.
- SSR is not enabled everywhere.
- Sample counts are bounded.
- Presets control expensive features.
- Lite has a lower-cost path.
- Fallbacks exist where needed.
- Cost claims remain honest.
- No exact GPU/VRAM usage is claimed.

---

## 23. Visual Identity Review

For visual changes, verify:

- Minecraft remains recognizable.
- Effects are subtle.
- Bloom is not excessive.
- Colors are not oversaturated.
- Tonemapping is restrained.
- Torch light remains warm but not red-heavy.
- The shader does not become cinematic-heavy.
- The result supports gameplay readability.

---

## 24. Red Flags in Codex Output

Reject or carefully revise output that:

- Touches many unrelated files
- Adds large unexplained code blocks
- Adds global reflection logic
- Adds cinematic effects without request
- Changes project scope
- Rewrites documentation broadly
- Ignores material matrix
- Adds magic numbers without explanation
- Removes constraints
- Changes licenses
- Claims unsupported compatibility
- Claims exact performance numbers

---

## 25. Codex Prompt Quality Checklist

Before sending a task to Codex, confirm:

| Item | Status |
| --- | --- |
| Objective is specific | Pending |
| Context files are listed | Pending |
| Allowed files are listed | Pending |
| Forbidden files are listed | Pending |
| Constraints are clear | Pending |
| Acceptance criteria are testable | Pending |
| Validation steps are included | Pending |
| Expected commit message is included | Pending |

---

## 26. Codex Governance Rule

When uncertain, choose:

1. Smaller tasks over broad tasks
2. Allowed files over unrestricted access
3. Acceptance criteria over vague intent
4. Human review over blind commits
5. Material safety over visual shortcuts
6. Documentation consistency over fast output
