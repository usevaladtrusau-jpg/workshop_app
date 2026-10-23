# Commit Convention

Commit messages must start with a type prefix, followed by a colon and a short description:

```text
<type>: <description>
```

Reference: [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)

## Types

| Type       | When to use                                                | Example                                           |
|------------|------------------------------------------------------------|---------------------------------------------------|
| `fix`      | Bug fix                                                    | `fix: update authorization scopes`                |
| `feat`     | New functionality                                          | `feat: add cron-job for updating order statuses`  |
| `docs`     | Changes in documentation files (`.docs`, `.doc`, `.md`)    | `docs: add documentation for new endpoints`       |
| `refactor` | Code changes without changing behavior (move, rename)      | `refactor: replace files from ... to ...`         |

More `refactor` examples:

- `refactor: rename file, class ...`
- `refactor: replace files from ... to ...`

## Rules

- The prefix is lowercase and always followed by `: `.
- The description is short, in the imperative mood (`add`, `update`, `rename`), without a trailing period.
