# Release Strategy — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Release planning and versioning strategy
- Canonical language: English

---

## 1. Purpose

This document defines the release strategy for Vanilla RTX Lite.

The goal is to make releases understandable, traceable, honest, and useful for users, contributors, portfolio review, and future development.

The project must avoid publishing releases that overpromise stability, compatibility, performance, or feature completeness.

---

## 2. Release Philosophy

Vanilla RTX Lite should release in controlled stages.

Each release should communicate:

- What changed
- What is stable
- What is experimental
- What is known to be incomplete
- What was tested
- What is not supported
- What users should expect

A release is not only a downloadable file.

A release is a documented project milestone.

---

## 3. Two Progress Systems

The project uses two progress systems:

1. Roadmap levels
2. Release maturity labels

These systems are related but not identical.

---

## 4. Roadmap Levels

Roadmap levels describe internal engineering progress.

They answer:

- What are we building?
- What depends on what?
- What should be implemented first?
- What should not be implemented yet?

Initial roadmap levels:

| Level | Name | Main Focus |
| --- | --- | --- |
| Level 0 | Foundation | Repository, documentation, workflow |
| Level 1 | Baseline Visuals | Minimal shader pipeline and debug infrastructure |
| Level 2 | Material Core | Material classification, roughness, Fresnel |
| Level 3 | Selective Reflections | Water, glass, ice, controlled SSR |
| Level 4 | Atmosphere | Fog, torch lighting, subtle atmosphere |
| Level 5 | Optimization and Release Prep | Presets, validation, packaging |
| Stable | Overworld Release | Public v1.0.0 Overworld-focused release |

---

## 5. Maturity Labels

Maturity labels describe public stability.

They answer:

- How stable is this release?
- Who should use it?
- Is it for testing or normal play?
- How much breakage should users expect?

Allowed maturity labels:

| Label | Meaning |
| --- | --- |
| Pre-alpha | Foundation or early implementation; not user-ready |
| Alpha | Feature work exists, but instability is expected |
| Beta | Feature set is closer to release, validation is active |
| Release Candidate | Intended stable release candidate under final review |
| Stable | Public release intended for general use |

---

## 6. Version Mapping

Suggested version mapping:

| Version | Roadmap Level | Maturity | Main Goal |
| --- | --- | --- | --- |
| v0.1.0-prealpha | Level 0 — Foundation | Pre-alpha | Repository and documentation foundation |
| v0.2.0-prealpha | Level 1 — Baseline Visuals | Pre-alpha | Minimal shader loading and debug structure |
| v0.3.0-prealpha | Level 2 — Material Core | Pre-alpha | Material classification and core helpers |
| v0.4.0-alpha | Level 3 — Selective Reflections | Alpha | Reflection logic for approved materials |
| v0.5.0-alpha | Level 4 — Atmosphere | Alpha | Fog, torch lighting, subtle atmosphere |
| v0.8.0-beta | Level 5 — Optimization and Release Prep | Beta | Presets, validation, packaging |
| v1.0.0-rc.1 | Stable Candidate | Release Candidate | Final Overworld validation |
| v1.0.0 | Stable Overworld Release | Stable | First public stable Overworld release |

This mapping may evolve, but major changes should be documented in architecture decisions.

---

## 7. Pre-alpha Release Policy

Pre-alpha releases are not intended for normal users.

Pre-alpha releases may include:

- Documentation foundation
- Repository structure
- Minimal shader loading
- Early debug infrastructure
- Placeholder systems
- Experimental technical foundations

Pre-alpha releases may be incomplete, unstable, or not visually representative.

### Pre-alpha must communicate

- What exists
- What does not exist yet
- What should not be expected
- Whether a downloadable shader pack is available
- Whether the release is mainly documentation or code

---

## 8. Alpha Release Policy

Alpha releases may include visible shader features.

Alpha releases are for testing, feedback, and technical validation.

Alpha releases may include:

- Material-aware rendering
- Early reflections
- Early atmosphere
- Debug views
- Initial presets
- Known artifacts

Alpha releases should not be marketed as stable.

### Alpha must communicate

- Known visual issues
- Known performance issues
- Tested environments
- Unsupported scenarios
- Experimental features
- Validation scenes reviewed

---

## 9. Beta Release Policy

Beta releases should be closer to user-ready.

Beta releases should include:

- More complete Overworld behavior
- Preset tuning
- Performance review
- Compatibility notes
- Known issues
- Validation screenshots or notes
- Packaging tests

Beta releases may still contain bugs, but core direction should be stable.

### Beta must communicate

- What needs final validation
- What is expected to remain stable
- What may still change
- Recommended presets
- Known compatibility limitations

---

## 10. Release Candidate Policy

Release candidates are intended to become stable if no major issues are found.

A release candidate should include:

- Finalized Overworld scope
- Validated presets
- Packaging verification
- Updated changelog
- Updated compatibility notes
- Updated release checklist
- Known issues reviewed
- No major planned feature additions before stable

Release candidates should focus on bug fixes and validation, not new features.

---

## 11. Stable Release Policy

A stable release should be suitable for general public use within the documented scope.

For `v1.0.0`, stable means:

- Overworld-focused release
- Documented material behavior
- Working presets
- Validated core scenes
- Known limitations documented
- Release package tested
- No false RTX/path tracing claims
- Performance expectations communicated honestly

Stable does not mean:

- Perfect performance on all hardware
- Full Nether support
- Full End support
- Real ray tracing
- Universal modpack compatibility
- Universal resource pack compatibility

---

## 12. v1.0.0 Scope

The first stable release targets:

```plaintext
Overworld only
```

Required for v1.0.0:

- Overworld lighting
- Controlled exposure
- Neutral tonemap
- Material-aware behavior
- Matte material protection
- Water behavior
- Glass behavior
- Ice behavior
- Quartz-like subtle polished response
- Copper differentiation
- Amethyst subtle response
- Torch warmth
- Subtle fog/atmosphere
- Presets
- Cost tier communication
- Release package
- Documentation

Out of scope for v1.0.0:

- Full Nether support
- Full End support
- Real ray tracing
- Path tracing
- Vulkan production line
- Built-in updater
- Exact GPU usage reporting
- Exact VRAM usage reporting

---

## 13. Git Branch Release Flow

Primary branches:

```plaintext
main
dev
```

### `dev`

Active integration branch.

Used for:

- Ongoing documentation
- Active implementation
- Feature integration
- Pre-release preparation

### `main`

Stable or release-ready branch.

Used for:

- Public default branch
- Release-ready state
- Tags
- GitHub releases

### Recommended flow

```powershell
git checkout dev
git pull
# work, commit, push
git checkout main
git pull
git merge dev
git push
git checkout dev
```

Release tags should be created from `main`.

---

## 14. Tagging Strategy

Use annotated tags for releases.

Example:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Tag names should follow:

```plaintext
vMAJOR.MINOR.PATCH
vMAJOR.MINOR.PATCH-prealpha
vMAJOR.MINOR.PATCH-alpha
vMAJOR.MINOR.PATCH-beta
vMAJOR.MINOR.PATCH-rc.N
```

Examples:

```plaintext
v0.1.0-prealpha
v0.4.0-alpha
v0.8.0-beta
v1.0.0-rc.1
v1.0.0
```

---

## 15. Changelog Policy

Every release must update:

```plaintext
CHANGELOG.md
```

The changelog should include:

- Added
- Changed
- Fixed
- Removed
- Known limitations
- Compatibility notes when relevant

The changelog must not exaggerate feature completeness.

---

## 16. GitHub Release Notes

GitHub release notes should include:

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

Release notes should be understandable to both technical and non-technical users.

---

## 17. Release Package Policy

The shader pack should eventually be distributed as a clean `.zip`.

The release package should include:

- Required shader files
- `shaders/shaders.properties`
- Required license notices
- Minimal user-facing documentation if needed

The release package should exclude:

- Git metadata
- Raw development notes
- Random screenshots
- Local IDE files
- Internal planning files unless intentionally included
- Unreleased experimental files
- Temporary logs
- Build artifacts not needed by users

---

## 18. Packaging Script Policy

Future packaging scripts may live in:

```plaintext
tools/packaging/
```

Recommended scripts:

```plaintext
tools/packaging/build_pack.ps1
tools/packaging/build_pack.sh
```

The packaging process should eventually:

1. Validate required files exist.
2. Exclude development-only files.
3. Include license notices.
4. Generate a clean `.zip`.
5. Print package contents.
6. Avoid overwriting releases accidentally.

---

## 19. Release Checklist Dependency

Before any public release, use:

```plaintext
docs/en/15_release_checklist.md
docs/es/15_checklist_de_release.md
```

The release checklist should confirm:

- Version number
- Changelog
- Compatibility notes
- Validation scenes
- Known risks
- Packaging
- License notices
- Git tag
- GitHub release notes

---

## 20. Compatibility Notes

Every public release should document tested compatibility.

Recommended fields:

```plaintext
Minecraft version:
Iris version:
Loader:
Operating system:
GPU:
Driver:
Resolution:
Preset tested:
Known issues:
Unsupported scenarios:
```

If something has not been tested, say so.

---

## 21. Performance Notes

Performance notes must be honest.

Allowed statements:

- “Validated on RTX 3070 Ti at 1080p.”
- “Estimated cost: High.”
- “Lite is intended for lower-end dedicated GPUs.”
- “Performance depends on resolution, render distance, mods, drivers, and preset.”

Forbidden statements:

- “Guaranteed 60 FPS.”
- “Uses exactly 2 GB VRAM.”
- “Automatically detects exact GPU usage.”
- “Guaranteed on all integrated graphics.”

---

## 22. Screenshot Policy

Screenshots used in release notes should be curated.

Recommended screenshot types:

- Vanilla comparison
- Balanced preset
- Lite preset if relevant
- Quality preset if relevant
- Debug view when explaining technical behavior

Do not use misleading screenshots that hide known issues.

---

## 23. Experimental Feature Policy

Experimental features must be clearly labeled.

Experimental features should not be used to define the stable visual identity.

If an experimental feature is included in a release:

- Document it clearly.
- Explain known issues.
- Keep it disabled by default unless justified.
- Do not present it as stable.

---

## 24. Breaking Change Policy

Breaking changes may occur before v1.0.0.

Before stable, breaking changes are acceptable if they improve:

- Architecture
- Material correctness
- Performance
- Documentation
- Preset behavior
- Long-term maintainability

After v1.0.0, breaking changes should be more carefully documented.

---

## 25. Release Readiness Criteria

A release is ready when:

- The intended scope is complete enough for the maturity label.
- The changelog is updated.
- Known limitations are documented.
- Compatibility notes are included.
- Validation has been performed where applicable.
- The package is tested.
- The version tag is ready.
- There are no accidental local files.
- The release does not overpromise.

---

## 26. Release Governance Rule

When uncertain, choose:

1. Honest maturity labels over impressive labels
2. Clear scope over broad promises
3. Tested compatibility over assumed compatibility
4. Known limitations over hidden issues
5. Clean packages over rushed releases
6. User trust over marketing appeal
