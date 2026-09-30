alias s := serve

default:
  just --list

# serves the website with drafts enabled
serve:
  hugo serve -D

# new content in 'content/posts/date-<title>'.md
post NAME:
  hugo new -k post "content/posts/$(date -u +%Y-%m-%d)-{{NAME}}.md"

# new content in 'content/posts/date-<title>/index.md' with a folder template to add external resources
folder NAME:
  hugo new -k post content/posts/$(date -u +%Y-%m-%d)-{{NAME}}/index.md

# new content in 'content/posts/date-<title>/index.md' with the math template and folder template to add external resources
math NAME:
  hugo new -k post_math content/posts/$(date -u +%Y-%m-%d)-{{NAME}}/index.md

# Checks for typos
typos:
  typos
# Usage: just tag 1.0.0
#        just tag 1.0.0 "Adds the AI buddy post."
# Tag and push a release — triggers the typos and GitHub Pages workflows
tag version $notes="":
  #!/usr/bin/env bash
  set -euo pipefail
  ver="{{version}}"
  if ! [[ "$ver" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "✗ version must look like 1.0.0 (got '$ver')" >&2; exit 1
  fi
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "✗ working tree not clean — commit or stash first." >&2; exit 1
  fi
  if git rev-parse "v$ver" >/dev/null 2>&1; then
    echo "✗ tag v$ver already exists." >&2; exit 1
  fi
  # Pre-flight: catch typos and build errors before anything is tagged or pushed.
  typos
  hugo --gc --minify -d "$(mktemp -d)" >/dev/null
  # `notes` arrives as an environment variable (the `$` on the parameter), so
  # quotes, backticks, and newlines in it pass through untouched.
  if [[ -n "${notes//[[:space:]]/}" ]]; then
    git tag -a "v$ver" --cleanup=verbatim -m "$notes"
  else
    git tag "v$ver"
  fi
  git push origin HEAD
  git push origin "v$ver"
  echo "✓ Pushed v$ver — CI will check typos and deploy to GitHub Pages."
