# Notes

This is my [personal notes space website](https://guilospanck.github.io/notes).

It is built with [Hugo] and the theme is WonderMod by Wonderfall. WonderMod is a fork of an original theme called PaperMod. The search functionality needs JavaScript to be enabled. However, it doesn't break the user experience if JavaScript is disabled.

Deployment is done through a [GitHub Actions workflow]. It is built with [Hugo].

[Hugo]: https://gohugo.io/
[GitHub Actions workflow]: https://github.com/Guilospanck/notes/tree/main/.github/workflows

It is inspired in [this repo](https://github.com/storopoli/storopoli.github.io).

## JavaScript

By default, all JavaScript is disabled.
You can enable them in posts by setting the YAML front matter with:

```yaml
javascript: true
```

## Math Support

Math support can be enabled by setting the YAML front matter with:

```yaml
math: true
```

This will load [KaTeX](https://katex.org/) under the hood,
and anything between `$` and `$$` will be rendered as inline or equation math
using JavaScript.

Check all the supported functions in [KaTeX documentation](https://katex.org/docs/supported).

## Mermaid Support

[MermaidJS](https://mermaid.js.org/) support can be enabled by setting the YAML front matter with:

```yaml
mermaid: true
```

This will load MermaidJS under the hood,
and you can specify diagrams and charts with the shortcode:

```md
{{<mermaid>}}
---
title: My Flowchart
---

flowchart LR
a --> b & c --> d
{{</mermaid>}}
```

They will be rendered automatically using JavaScript.

## License

The code is [MIT](https://mit-license.org/)
and the content is [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
