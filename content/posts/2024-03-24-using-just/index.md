+++
title = "Using just"
date = "2024-03-24T11:23:03Z"
draft = false
tags = ["rust", "tools"]
javascript = false
math = false
mermaid = false
+++

{{< figure src="meme_makefile_just.png#center" alt="Makefile stops being best friend" title="Makefile stops being best friend" width="800" >}}

When your old friend *Makefile* leaves you hanging...enter `just`.

## What is just

[just](https://github.com/casey/just) is *just* a command runner with a syntax inspired by *make* that helps you, well, run commands. That's it.

## Why

I am used to using *Makefile* in my personal projects and I really like it. It has a simple syntax and works well whenever we don't want
to keep writing the same command over and over again. It also helps you create the *recipes* that make the whole process of, for example,
running a project that needs to be tested and built before, a piece of cake.

But, as fate has a sense of humour, while creating this repository to post some notes about life and tech, I stumbled upon the problem of
using *Makefile* to automatise the creation of my posts.

I wanna be able to run a command, at that time something like `make post post_name` and it would create a post template file for me, with the
timestamp and the name defined. The problem is that I can't do it in this way, I would have to write `make post NAME=post_name` in order for it
to work. And I did not want it. Too bloated for my likings.

Another obstacle was to get the current timestamp. Doing `$(date -u +%Y-%m-%d)` would not work in a *Makefile* and I did not do my research to find
out how (if) to do that.

My *Makefile* was looking like this:

```Makefile
# "new content in 'content/posts/date-<title>'.md"
.PHONY: post
post:
 hugo new -k post content/posts/$(date -u +%Y-%m-%d)-$1.md
```

Don't get me wrong, it would work *just* (😁) fine if I would pass the post name as an environment argument:

```Makefile
# "new content in 'content/posts/date-<title>'.md"
.PHONY: post
post:
 hugo new -k post content/posts/$(date -u +%Y-%m-%d)-$(NAME).md
```

but with the date I was not sure (and did not want to do that research).

## Perks of just

Well, I've only used it now and only the basic stuff, but it already got my heart.

Using as an example the Makefile above, we can write it in just - using a `.justfile` - like this:

```justfile
# new content in 'content/posts/date-<title>'.md
post NAME:
  hugo new -k post "content/posts/$(date -u +%Y-%m-%d)-{{NAME}}.md"
```

And run it with `just post post_name`.

> Wonderful, right?

And, if you run `just --list`, it gives you a summary of all available *recipes*, along with their comments.

```bash
$ just --list
Available recipes:
    post NAME   # new content in 'content/posts/date-<title>'.md
```

If you don't want to run `just --list` every time, you can add to the *.justfile* as the first recipe:

```justfile
default:
  just --list
```

And now, every time you run `just`, it will print all available recipes.

> The first recipe of the *justfile* will be run when you use `just` without arguments.

Another great thing is that you can simplify your recipe namings by using aliases:

```justfile
alias p := post
```

If you ran `just p post_name` it will have the same effect as `just post post_name`.

## Conclusions

Give it a try. I think it's worth it.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
