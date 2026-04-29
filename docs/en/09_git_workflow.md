# Git Workflow — Vanilla RTX Lite

## Status

- Roadmap stage: Level 0 — Foundation
- Maturity: Pre-alpha
- Document type: Git workflow and repository process
- Canonical language: English

---

## 1. Purpose

This document defines the Git workflow for Vanilla RTX Lite.

The goal is to keep the repository history clean, traceable, and useful for development, portfolio review, public releases, and AI-assisted work.

The project should use Git not only as a backup system, but as a record of decisions, milestones, and technical evolution.

---

## 2. Workflow Philosophy

The Git workflow should support:

- Small, meaningful commits
- Clear branch purpose
- Traceable documentation changes
- Safe experimentation
- Reproducible release preparation
- Clean collaboration with Codex or other AI tools
- A readable project history for GitHub and portfolio review

The project should avoid large, confusing commits that mix unrelated changes.

---

## 3. Main Branches

The project uses two long-lived branches:

```plaintext
main
dev
```

---

## 4. `main`

### Purpose

`main` represents the stable or release-ready state of the project.

It is the default public branch on GitHub.

### Rules

`main` should contain:

- Stable documentation
- Reviewed project structure
- Release-ready code when releases exist
- Public-facing README
- Tags and release states when applicable

`main` should not be used for daily experimental work.

### When to update `main`

Update `main` when:

- A milestone is complete
- A stable documentation block is ready
- A release candidate is prepared
- A public release is published
- `dev` contains reviewed and stable work

---

## 5. `dev`

### Purpose

`dev` is the active integration branch.

Most work should happen from or into `dev`.

### Rules

`dev` may contain:

- Active documentation work
- Early shader implementation
- In-progress feature integration
- Pre-release preparation
- Validated changes before they move to `main`

`dev` should still remain reasonably clean and functional.

It should not become a dumping ground for broken experiments.

---

## 6. Short-Lived Branches

Short-lived branches should be created from `dev`.

Recommended branch types:

```plaintext
docs/*
feature/*
fix/*
perf/*
refactor/*
chore/*
```

---

## 7. `docs/*` Branches

Use for documentation work.

Examples:

```plaintext
docs/material-matrix
docs/release-strategy
docs/validation-scenes
```

Recommended when:

- Writing or rewriting documentation
- Updating translations
- Creating roadmap documents
- Changing README or project specs

---

## 8. `feature/*` Branches

Use for new shader features.

Examples:

```plaintext
feature/debug-view-selector
feature/material-core
feature/fresnel-helper
feature/water-reflections
```

Recommended when:

- Adding new GLSL systems
- Introducing new shader options
- Creating new debug views
- Adding new material behavior

---

## 9. `fix/*` Branches

Use for bug fixes.

Examples:

```plaintext
fix/torch-overbright
fix/material-mask-leak
fix/glass-reflection-artifact
```

Recommended when:

- Fixing visual regressions
- Fixing shader compile errors
- Fixing documentation mistakes
- Fixing packaging issues

---

## 10. `perf/*` Branches

Use for performance improvements.

Examples:

```plaintext
perf/ssr-sample-count
perf/lite-preset-cost
perf/reduce-fullscreen-work
```

Recommended when:

- Reducing expensive calculations
- Improving Lite preset
- Optimizing SSR
- Reducing memory pressure
- Improving shader execution paths

---

## 11. `refactor/*` Branches

Use for structural code changes that should not change visual output.

Examples:

```plaintext
refactor/material-helpers
refactor/debug-view-routing
refactor/profile-constants
```

Recommended when:

- Moving code between files
- Renaming helpers
- Splitting large functions
- Improving modularity

Refactors should avoid changing visual behavior unless clearly documented.

---

## 12. `chore/*` Branches

Use for repository maintenance.

Examples:

```plaintext
chore/markdownlint
chore/gitattributes
chore/package-scripts
```

Recommended when:

- Updating tooling
- Cleaning formatting
- Adding ignore rules
- Maintaining repository metadata

---

## 13. Commit Style

Use conventional-style commits.

Recommended types:

```plaintext
docs
feat
fix
refactor
perf
test
chore
```

Format:

```plaintext
type(scope): short description
```

Examples:

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

## 14. Commit Principles

A good commit should be:

- Focused
- Reviewable
- Descriptive
- Traceable
- Reversible when possible

Avoid commits that mix unrelated changes.

Bad example:

```plaintext
update stuff
```

Better example:

```plaintext
docs(pipeline): define render pipeline responsibilities
```

---

## 15. Documentation Commit Strategy

Documentation should be committed in logical pairs when bilingual.

Recommended pattern:

```plaintext
docs(topic): define <topic>
```

Example:

```plaintext
docs(compatibility): define compatibility policy
```

When updating both English and Spanish files, commit them together if they represent the same conceptual change.

---

## 16. Shader Code Commit Strategy

Shader code commits should be smaller than documentation commits.

Recommended examples:

```plaintext
feat(shader): add minimal final pass
feat(debug): add debug view selector
feat(materials): add material id constants
feat(fresnel): add bounded fresnel helper
```

Avoid adding multiple major systems in one commit.

Do not combine first implementation of SSR, tonemapping, material classification, presets, and debug views in one commit.

---

## 17. AI-Assisted Work Strategy

When using Codex or another AI assistant:

1. Create or use a focused branch.
2. Provide a bounded task.
3. Limit allowed files.
4. Define files that must not be modified.
5. Include acceptance criteria.
6. Review generated changes before committing.
7. Commit only coherent, reviewed work.

AI-generated code must not be committed blindly.

---

## 18. Codex Task Branch Naming

Recommended branch names for Codex-assisted tasks:

```plaintext
docs/codex-task-protocol
feature/codex-debug-view-selector
refactor/codex-material-helpers
fix/codex-ssr-artifact
```

The branch name should describe the task, not the tool only.

Bad:

```plaintext
codex-work
ai-changes
```

Better:

```plaintext
feature/debug-view-selector
```

---

## 19. Before Starting Work

Before starting new work:

```powershell
git checkout dev
git pull
git status
```

The working tree should be clean before beginning a new task.

If unfinished work exists, either:

- Commit it if it is coherent
- Stash it if it is temporary
- Discard it only if it is truly unwanted

---

## 20. Creating a Task Branch

For larger changes:

```powershell
git checkout dev
git pull
git checkout -b docs/example-topic
```

For small documentation updates, direct work on `dev` is acceptable during early pre-alpha, but branch-based work is preferred as the project grows.

---

## 21. Checking Changes

Before committing:

```powershell
git status
git diff --stat
git diff
```

For long documentation files, at least check:

```powershell
Get-Content ".\path\to\file.md" -TotalCount 5
Get-Content ".\path\to\file.md" -Tail 10
```

This helps catch broken paste operations, truncated files, or accidental text pollution.

---

## 22. Staging Changes

Stage specific files when possible:

```powershell
git add docs/en/09_git_workflow.md docs/es/09_flujo_git.md
```

Use `git add .` only when you are sure all changes belong in the commit.

---

## 23. Committing Changes

Commit with a clear message:

```powershell
git commit -m "docs(git): define repository workflow"
```

The message should explain the intent of the change.

---

## 24. Pushing Changes

Push the active branch:

```powershell
git push
```

If pushing a new branch:

```powershell
git push -u origin branch-name
```

---

## 25. Updating `main`

When `dev` contains reviewed stable work:

```powershell
git checkout main
git pull
git merge dev
git push
git checkout dev
```

Before merging into `main`, ensure:

- `dev` is clean
- Important commits are pushed
- Documentation is coherent
- No temporary files are included
- No local-only files are accidentally tracked

---

## 26. Tagging Releases

When releases begin, use tags.

Example:

```powershell
git tag -a v0.1.0-prealpha -m "v0.1.0-prealpha — Foundation"
git push origin v0.1.0-prealpha
```

Tags should correspond to meaningful milestones.

Do not tag random intermediate work as releases.

---

## 27. Stashing Temporary Work

Use stash for temporary unfinished changes.

Example:

```powershell
git stash push -m "wip material matrix edits"
```

Apply later:

```powershell
git stash pop
```

Do not use stash as a long-term storage system.

---

## 28. Handling Mistakes

### Undo unstaged file changes

```powershell
git restore path/to/file
```

### Unstage a file

```powershell
git restore --staged path/to/file
```

### Amend the latest commit

Only if the commit has not been shared or if you understand the implications:

```powershell
git commit --amend
```

### Clean duplicate local commits before pushing

For early local work, interactive rebase or soft reset may be used carefully.

Avoid rewriting shared history unless necessary.

---

## 29. Line Endings and Formatting

The project should avoid unnecessary line-ending noise.

Recommended future addition:

```plaintext
.gitattributes
```

Potential rule:

```plaintext
* text=auto
*.md text eol=lf
*.glsl text eol=lf
*.vsh text eol=lf
*.fsh text eol=lf
```

This should be added intentionally in a separate commit.

---

## 30. What Not to Commit

Do not commit:

- Local Minecraft instances
- Random screenshots
- Recordings
- Temporary files
- Logs
- Generated release ZIPs
- Personal IDE settings
- Broken experiments
- API keys or secrets
- Large files not curated for the project

Curated screenshots may be committed under:

```plaintext
examples/screenshots/
examples/comparisons/
examples/debug_views/
```

---

## 31. Repository Hygiene Checklist

Before pushing:

- `git status` is understood
- Commit message is clear
- Only intended files are staged
- No local files are included
- No secrets are included
- Documentation files open correctly
- Markdown warnings are understood or fixed
- The change matches the project roadmap

---

## 32. Git Governance Rule

When uncertain, choose:

1. Small commits over large mixed commits
2. Branches over risky direct edits
3. Clear messages over vague messages
4. Reviewed changes over blind commits
5. Stable `main` over convenient shortcuts
6. Traceable history over rushed progress
