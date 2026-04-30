# Release Checklist — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Release checklist
- Canonical language: English

---

## 1. Purpose

This document defines the release checklist for Vanilla RTX Lite.

The goal is to make every public release controlled, reproducible, documented, and honest.

A release should not be published until its scope, limitations, compatibility, packaging, and known issues are clear.

---

## 2. Relationship to Release Strategy

The release strategy is defined in:

```plaintext
docs/en/12_release_strategy.md
```

That document explains how releases are planned.

This checklist defines what must be verified before publishing a release.

---

## 3. Release Checklist Philosophy

A release is more than a downloadable file.

A release must include:

- A clear version
- A maturity label
- A defined scope
- Updated changelog
- Compatibility notes
- Known limitations
- Validated package contents
- License notices
- Git tag
- GitHub release notes

The project must avoid rushed releases that overpromise or confuse users.

---

## 4. Release Identification

Before preparing a release, confirm:

| Item | Status |
| --- | --- |
| Release version is defined | Pending |
| Maturity label is defined | Pending |
| Roadmap level is identified | Pending |
| Release scope is clear | Pending |
| Release branch is clean | Pending |
| Release is aligned with roadmap | Pending |

Recommended version format:

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

## 5. Scope Verification

Confirm the release scope.

| Item | Status |
| --- | --- |
| Included features are listed | Pending |
| Excluded features are listed | Pending |
| Known incomplete areas are documented | Pending |
| Experimental features are labeled | Pending |
| Unsupported scenarios are documented | Pending |
| Release does not exceed roadmap scope | Pending |

For `v1.0.0`, the stable scope is:

```plaintext
Overworld only
```

---

## 6. Documentation Verification

Before release, verify that relevant documentation is updated.

| Document | Required | Status |
| --- | --- | --- |
| `README.md` | Yes | Pending |
| `CHANGELOG.md` | Yes | Pending |
| `ROADMAP.md` | Yes | Pending |
| `docs/en/12_release_strategy.md` | Yes | Pending |
| `docs/en/14_compatibility_matrix.md` | Yes | Pending |
| `docs/en/15_release_checklist.md` | Yes | Pending |
| `docs/en/11_known_risks.md` | Recommended | Pending |
| `docs/en/05_validation_scenes.md` | Recommended | Pending |
| `docs/en/13_option_registry.md` | If options changed | Pending |
| Spanish documentation | If applicable | Pending |

Documentation must not claim features that are not included.

---

## 7. Changelog Checklist

Before release, update:

```plaintext
CHANGELOG.md
```

Confirm:

| Item | Status |
| --- | --- |
| Release version added | Pending |
| Release date added | Pending |
| Added section updated | Pending |
| Changed section updated | Pending |
| Fixed section updated | Pending |
| Removed section updated if needed | Pending |
| Known limitations added | Pending |
| Compatibility notes added if needed | Pending |
| No exaggerated claims included | Pending |

Suggested changelog sections:

```plaintext
Added
Changed
Fixed
Removed
Known limitations
Compatibility notes
```

---

## 8. Compatibility Checklist

Before release, update compatibility information.

| Item | Status |
| --- | --- |
| Minecraft version documented | Pending |
| Iris version documented | Pending |
| Loader documented | Pending |
| Operating system documented | Pending |
| GPU documented | Pending |
| Driver documented if known | Pending |
| Resolution documented | Pending |
| Presets tested documented | Pending |
| Unsupported scenarios documented | Pending |
| Compatibility matrix updated | Pending |

If something was not tested, mark it as:

```plaintext
Unknown
```

Do not claim support based on assumptions.

---

## 9. Validation Checklist

Before release, validate appropriate scenes.

Minimum recommended scenes for public releases:

| Scene | Required for v1.0.0 | Status |
| --- | --- | --- |
| Midday exterior | Yes | Pending |
| Night with torches | Yes | Pending |
| River or lake | Yes | Pending |
| Glass transition | Yes | Pending |
| Cave | Yes | Pending |
| Ice or snow environment | Yes | Pending |
| Fresh copper vs oxidized copper | Yes | Pending |
| Matte material stress scene | Yes | Pending |
| Rain scene | Recommended | Pending |
| Amethyst scene | Recommended | Pending |

For pre-alpha documentation-only releases, visual validation may be marked as not applicable.

---

## 10. Material Rules Checklist

Confirm that the release does not break material rules.

| Rule | Status |
| --- | --- |
| Dirt does not reflect | Pending |
| Stone does not reflect | Pending |
| Wood does not become glossy by default | Pending |
| Leaves do not look wet by default | Pending |
| Sand and gravel remain diffuse | Pending |
| Water is reflective but not a perfect mirror | Pending |
| Glass remains readable | Pending |
| Ice is reflective but not clean glass | Pending |
| Copper oxidation reduces material response | Pending |
| Amethyst remains subtle | Pending |

If these cannot be validated yet, mark them clearly as not applicable or not implemented.

---

## 11. Performance Checklist

Before release, document performance honestly.

| Item | Status |
| --- | --- |
| Tested GPU documented | Pending |
| Tested resolution documented | Pending |
| Tested preset documented | Pending |
| Render distance documented | Pending |
| FPS notes added if available | Pending |
| Known expensive options documented | Pending |
| Cost tiers reviewed | Pending |
| No exact GPU usage claims made | Pending |
| No exact VRAM usage claims made | Pending |
| No universal FPS guarantee made | Pending |

Allowed language:

```plaintext
Validated on RTX 3070 Ti at 1080p.
Estimated cost: High.
Performance depends on GPU, resolution, render distance, mods, drivers, and preset.
```

Forbidden language:

```plaintext
Guaranteed 60 FPS.
Uses exactly 2 GB VRAM.
Works perfectly on all GPUs.
Automatically detects exact GPU usage.
```

---

## 12. Preset Checklist

Before release, verify preset behavior.

| Preset | Required Check | Status |
| --- | --- | --- |
| Lite | Lower-cost behavior remains usable | Pending |
| Balanced | Represents reference visual identity | Pending |
| Quality | Improves fidelity without changing style | Pending |
| Experimental | Clearly labeled as unstable/testing | Pending |
| Custom | Does not break project constraints | Pending |

If a preset is not ready, document it.

Do not imply all presets are equally validated unless they were tested.

---

## 13. Option Checklist

If shader options changed, verify:

| Item | Status |
| --- | --- |
| Option registry updated | Pending |
| Defaults documented | Pending |
| Allowed values documented | Pending |
| Cost tier documented | Pending |
| Visual impact documented | Pending |
| Dependencies documented | Pending |
| Constraints documented | Pending |
| Tooltips reviewed | Pending |
| Unsafe options avoided | Pending |

No option should allow:

```plaintext
Global reflections on matte materials
Extreme bloom
Unbounded saturation
White torch default
Mirror terrain
Disable material rules
```

---

## 14. Debug Checklist

If debug views exist in the release, verify:

| Debug View | Status |
| --- | --- |
| Off/default mode works | Pending |
| Material ID/category works | Pending |
| Reflective mask works | Pending |
| Roughness works | Pending |
| Fresnel works | Pending |
| Specular contribution works | Pending |
| SSR contribution works | Pending |
| Exposure/luminance works | Pending |
| Debug views do not affect normal output when Off | Pending |

Debug views are required infrastructure, but public exposure may depend on release maturity.

---

## 15. Packaging Checklist

Before publishing a downloadable shader pack, verify:

| Item | Status |
| --- | --- |
| Package builds successfully | Pending |
| Package installs correctly | Pending |
| Required shader files included | Pending |
| `shader.properties` included | Pending |
| License notices included | Pending |
| Development-only files excluded | Pending |
| Temporary files excluded | Pending |
| Random screenshots excluded | Pending |
| Git metadata excluded | Pending |
| Package contents reviewed | Pending |

The package should be a clean `.zip`.

---

## 16. Files That Should Not Be in Release Packages

Release packages should not include:

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

Internal repository documentation may remain in GitHub, but the downloadable shader pack should stay user-focused.

---

## 17. License Checklist

Before release, verify:

| Item | Status |
| --- | --- |
| Shader/code license included | Pending |
| Documentation license included if applicable | Pending |
| Third-party notices included if applicable | Pending |
| LICENSE file present | Pending |
| LICENSE-DOCS file present if used | Pending |
| Release package includes required notices | Pending |

Do not publish packages with missing or unclear license information.

---

## 18. Git Checklist

Before tagging a release:

```powershell
git status
git log --oneline --decorate --max-count=10
```

Confirm:

| Item | Status |
| --- | --- |
| Working tree is clean | Pending |
| Correct branch is active | Pending |
| Latest commits are pushed | Pending |
| `main` is up to date | Pending |
| Release commit is on `main` | Pending |
| No accidental files are tracked | Pending |
| Commit history is understandable | Pending |

---

## 19. Main Branch Checklist

Before release:

```powershell
git checkout main
git pull
git merge dev
git push
```

Confirm:

| Item | Status |
| --- | --- |
| `main` contains release-ready work | Pending |
| `dev` was merged intentionally | Pending |
| No merge conflicts remain | Pending |
| GitHub default branch displays correctly | Pending |
| README looks correct on GitHub | Pending |

---

## 20. Tag Checklist

Create an annotated tag only after the release state is ready.

Example:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Confirm:

| Item | Status |
| --- | --- |
| Tag name follows version format | Pending |
| Tag points to correct commit | Pending |
| Tag message is clear | Pending |
| Tag pushed to origin | Pending |

---

## 21. GitHub Release Notes Checklist

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

Confirm:

| Item | Status |
| --- | --- |
| Release notes are understandable | Pending |
| Known issues are included | Pending |
| Unsupported scenarios are included | Pending |
| Download instructions are clear | Pending |
| No unsupported claims are made | Pending |
| Screenshots are not misleading | Pending |

---

## 22. Screenshot Checklist

If screenshots are included:

| Item | Status |
| --- | --- |
| Screenshots are curated | Pending |
| Scene names are documented | Pending |
| Preset used is documented | Pending |
| Vanilla comparison included if relevant | Pending |
| Debug view screenshot included if helpful | Pending |
| Known issues are not hidden | Pending |
| Images are stored in correct folder | Pending |

Recommended folders:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

---

## 23. Known Issues Checklist

Before release, review:

```plaintext
docs/en/11_known_risks.md
```

Confirm:

| Item | Status |
| --- | --- |
| Known issues are documented | Pending |
| Open risks are still accurate | Pending |
| New risks were added if discovered | Pending |
| Release notes mention important issues | Pending |
| No major hidden blockers remain | Pending |

---

## 24. Pre-alpha Specific Checklist

For pre-alpha releases, confirm:

| Item | Status |
| --- | --- |
| Release is clearly labeled Pre-alpha | Pending |
| Users understand it may not be gameplay-ready | Pending |
| Missing features are listed | Pending |
| Documentation-only status is clear if applicable | Pending |
| No stable-quality claims are made | Pending |

---

## 25. Alpha Specific Checklist

For alpha releases, confirm:

| Item | Status |
| --- | --- |
| Visible features are listed | Pending |
| Known artifacts are listed | Pending |
| Tested scenes are listed | Pending |
| Performance limitations are listed | Pending |
| Experimental systems are labeled | Pending |
| Release is not presented as stable | Pending |

---

## 26. Beta Specific Checklist

For beta releases, confirm:

| Item | Status |
| --- | --- |
| Core feature set is mostly complete | Pending |
| Presets are validated | Pending |
| Packaging is tested | Pending |
| Compatibility notes are updated | Pending |
| Known issues are manageable | Pending |
| Final validation tasks are listed | Pending |

---

## 27. Stable Specific Checklist

For stable releases, confirm:

| Item | Status |
| --- | --- |
| Scope is complete | Pending |
| Overworld validation completed | Pending |
| Release package tested | Pending |
| Documentation is updated | Pending |
| Changelog is updated | Pending |
| Compatibility matrix is updated | Pending |
| Known limitations are clear | Pending |
| GitHub release is ready | Pending |
| No false RTX/path tracing claims exist | Pending |

---

## 28. Final Pre-Release Command Sequence

Recommended final sequence:

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

Replace `vX.Y.Z-label` with the actual release version.

---

## 29. Release Approval Notes

Before publishing, write short internal approval notes:

```plaintext
Release:
Maturity:
Approved scope:
Known limitations:
Tested environment:
Package verified:
Ready for GitHub release:
```

These notes may be included in release preparation issues or documentation.

---

## 30. Release Governance Rule

When uncertain, choose:

1. Delay release over publishing unclear work
2. Honest notes over polished marketing
3. Tested packages over assumed packages
4. Known limitations over hidden problems
5. Clear maturity labels over impressive wording
6. User trust over speed
