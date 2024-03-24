# "serves the website with drafts enabled"
.PHONY: serve
serve:
	hugo serve -D

# "new content in 'content/posts/date-<title>'.md"
.PHONY: post
post:
	hugo new -k post content/posts/$(date -u +%Y-%m-%d)-$1.md

# "new content in 'content/posts/date-<title>/index.md' with a folder template to add external resources"
.PHONY: post_folder
post_folder:
	hugo new -k post content/posts/$(date -u +%Y-%m-%d)-$1/index.md

# "new content in 'content/posts/date-<title>.md' with the math template"
.PHONY: math_post
math_post:
	hugo new -k post_math content/posts/$(date -u +%Y-%m-%d)-$1.md

# "new content in 'content/posts/date-<title>/index.md' with the math template and folder template to add external resources"
.PHONY: math_post_folder
math_post_folder:
	hugo new -k post_math content/posts/$(date -u +%Y-%m-%d)-$1/index.md

