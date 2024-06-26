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