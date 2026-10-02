# Contributing

Thank you for helping develop the Clinical AI Education Tool.

## Before contributing

1. Read the [project charter](docs/PROJECT_CHARTER.md), [privacy guidance](docs/PRIVACY.md), and [content review standard](docs/CONTENT_REVIEW.md).
2. Open an issue or confirm the proposed change with a maintainer before beginning substantial work.
3. Do not upload PHI, PII, private institutional material, credentials, or copyrighted material without permission.

## Workflow

1. Create a short-lived branch from `main` using a descriptive name such as `docs/add-ai-bias-module` or `fix/accessibility-labels`.
2. Make one focused change per branch.
3. Test or review the change locally.
4. Open a pull request and complete the checklist.
5. Request review from the repository owner. Changes involving clinical claims require qualified content review before merging.

Avoid committing directly to `main`, even if you have write access.

## Commit messages

Use a short imperative summary, for example:

```text
Add model-bias teaching activity
Fix keyboard navigation in quiz
Document content review sources
```

## Content standards

Educational material should:

- state learning objectives;
- distinguish evidence from opinion or demonstration;
- cite authoritative, stable sources where possible;
- record a review date and reviewer role;
- identify limitations, uncertainty, and foreseeable misuse;
- avoid patient-specific recommendations.

## Code standards

Once an application stack is added, document formatting, linting, testing, and supported versions in this file. New code should include proportionate tests and accessible user interfaces.

## Pull-request review

At least one maintainer review is expected. A second qualified reviewer is recommended for changes involving clinical facts, privacy, security, assessment scoring, or learner-facing AI output.

