+++
title = "Debugging Python tests"
date = "2024-03-25T05:47:43Z"
draft = false
tags = ["python", "debugger", "vscode"]
categories = []
javascript = false
math = false
mermaid = false
+++

## Debugging?

Debugging is part of our every day lives as software developers - or it should be. Understanding why an error is happening is not always easy. In fact, most of the times it isn't.

A great tool we all have are debuggers. As the name suggests, they __remove__ ("de-") bugs.

One part of the software development process that they are needed but we usually don't think too much about it, is in the tests.

Then comes the question: __how do I do that?__

## Python vscode extension

There's a really easy way of dealing with that in Python and vscode: using the [official Python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python).

After you install it, run the command (using `CMD-Shift-P on MacOS`, or `Control-Shift-P` elsewhere) `> Python: Configure Tests`.

{{< figure src="configure_tests.png#center" alt="Python Configure Tests command" title="Python Configure Tests command" width="800" >}}

Once you follow the steps asked, you are all setup up.

You can either run the tests using the *Testing* space on the sidebar of vscode or, inside the test file, clicking on the *Play* icon.

{{< figure src="test_explorer.png#center" alt="Running tests using the sidebar Testing option" title="Running tests using the sidebar Testing option" width="800" >}}

{{< figure src="test_side.png#center" alt="Running tests using the Play icon" title="Running tests using the Play icon" width="800" >}}

## Conclusions

Although many people think that using only CLI is THE thing and experienced developers should *only* use it, the GUI can help a lot with our productivity and it doesn't diminish who you are.

Don't let things define what you do. Be you.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
