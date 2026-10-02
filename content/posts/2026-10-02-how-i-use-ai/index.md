+++
title = "How I Use AI"
date = "2026-10-02T14:37:01+01:00"
draft = false
tags = ["ai", "agents", "skills", "workflow", "llm"]
categories = ["ai", "programming"]
javascript = false
math = false
mermaid = false
+++

Currently I use AI as both a coding and a learning partner. How I got here is written in [another post]({{< relref "/posts/2026-09-30-an-engineer-mental-journey-through-the-ai-era" >}}); this one is about the practical side: the workflow I follow, the skills I use and how I learn new things with it.

## AI as a coding partner

This is my current workflow for working with AI. The basic idea is:

1. Get AI to do something via [prompting](#prompting);
2. [Manually test](#manual-testing) it to make sure that we will spend time on at least a working feature;
3. Run the [automated tests](#automated-tests);
4. Run an [adversarial review](#adversarial-review);
5. If something meaningful was found, ask it to fix it and go back to step 1. If it's either a false positive or something that I deem not necessary to do now, then proceed;
6. [Check manually](#manual-code-review) most of the code that was generated. If not happy, go back to step 1. If happy, then wait for the PR (Pull Request) process.

> 👉 Steps 2 and 3 don't necessarily need to follow this order. You could choose to run 3 before 2.

Each and every one of the steps above only moves forward if it succeeds in whatever metric I judge necessary.

Notice that each and every time some part of the code has changed, you need to re-test it to make sure that you're not validating it with past assumptions. Remember that even the simplest changes can break everything.

This is the way I've found to produce code at high speeds all the while keeping it as close as possible to working software and improving my understanding of whatever is happening.

### Prompting

There are two ways that I prompt AI to do something and it depends on my level of understanding of what I want:

#### I know exactly what I want

If that happens to be the case, then it's pretty much straightforward. I just tell it what I want and that's it:

> _"I want section X to have abc and section Y to be like this"_.

For simpler tasks this is usually the case, but for more complex tasks, there's the next topic.

#### I don't know _exactly_ what I want

In this case it will depend on how little I know.

If I happen to know enough and I just need more input about something else, I ask directly:

> _"Hey, I want to build X. For that, making this and this and this seems to be the correct way. Do you see any contradictions/problems with this approach? Why?"_

There are times that I might know what I want mostly on a superficial level - maybe it's a complex use case; maybe I'm still fiddling around. On those occasions, I will use it as a smarter Google:

> _"I want to build system **"X"**. It needs to have this and this and this. I'm still not sure what I'll be using and what's the best way to build it. I want it to have configuration **"Y"**, security **"Z"**, work **"W"** way, and I'm okay with not being perfect on **"V"**. Do a deep research and give me my options for each one of them with their pros and cons, and which ones are your recommendations and why"_.

After the AI does that, I will go through a long planning process (depending on how big the system is, it can take days), in which we will design the system together from the ground up, clearing any roadblocks that could stop us in the future.

Although it might seem slower in the beginning, once I have a detailed plan of every part of the system, the actual implementation will be very fast and mostly autonomous (given I gave AI the correct guardrails for each one of the systems/features).

### Manual testing

This is straightforward most of the time. If you're building a system, you usually know how it's supposed to work. The idea here is to use it as if you were a user. See if it fits your expectations of the system/feature.

If it's a web app and you're building a form to save a user's information, then you just go there manually to the web form, fill in some information and see if it saves correctly. You become your own QA (Quality Assurance) - as you should've always been.

Using this as the first line of "defense against very dumb errors" is pretty good because it can also lead you to have more input on the next phases and you feel what a possible user would feel if that happens to not work the way you would expect it to work.

### Automated tests

This is where your unit, integration and end-to-end tests live. But also, your linting, formatting, typechecks.

Even more: I like to have here also the same environment as my CI (Continuous Integration) process would run, including a differentiation - if needed - of the steps that are REQUIRED to pass so we can merge the branch and the ones that are OPTIONAL.

Waiting for CI to run on the cloud (I mean GitHub/Forgejo/GitLab Actions) is usually MUCH slower than what you could have by running it locally first.

The idea is that, instead of waiting for that long time once you think everything is ready and then finding out that some REQUIRED step hasn't passed and you can't merge it [🤬](./frustrated-jim-carrey.gif), you do it faster locally and push an already good-to-go PR code.

That saves cloud computing, but, most importantly, it saves your headspace.

### Adversarial review

LLMs (Large Language Models) - what I've been calling "AI" so far - are statistical machines; you can never blindly trust them 100%. The good thing is that different models were trained differently, and that leads to different answers to the same questions.

That's both good and bad. The bad is the trust issues. The good is that you can use that to make them ["fight each other"](./mj_laugh.png) and then you have different points of view and can, therefore, make a better decision (allegedly).

The way I do that is by using the `/consult-llm` skill (see more at [skills](#skills)), like `/consult-llm -m gpt-6.1-sol`. It will send the needed context to another model (gpt-6.1-sol in this case) and, with [this hook](https://github.com/Guilospanck/dotfiles/blob/main/claude/hooks/consult-llm-monitor.sh), it will also open to the side a monitor showing exactly what it is doing (otherwise you only see the final answer and not the exact process).

I've gotten many good reviews using this approach, but you still need to be in the loop and decide on whatever it says because LLMs tend to just spit out anything even when there is nothing to do.

### Manual code review

The last step of my workflow pipeline is to look at the final code by myself. I'm starting to do that less and less, given that the models and outcomes are getting better and better, but it is still needed for most of the real applications.

Sometimes, depending on the size or the complexity of a project, an LLM can get lost and generate things that either don't make sense, are totally wrong or are very ineffective.

It's also a good time for you to look for "empty" tests that are going to contribute to bloating the codebase and to simplify things like database migrations. On top of that, you get to know more about what was built and make sure that your assumptions are correct.

### Skills

The `/consult-llm` skill mentioned above is one of several that I rely on. My preferred ones at the moment:

- [superpowers](https://github.com/obra/superpowers): _"complete software development methodology"_
- [consult-llm](https://github.com/raine/consult-llm): _"get a second opinion from another AI model"_
- [caveman](https://github.com/juliusbrussee/caveman): _"cuts 65% of tokens by talking like a caveman"_
- [bro](https://github.com/Guilospanck/dotfiles/tree/main/claude/skills/bro): _simplifies the previous answer in a more human way_
- [workmux](https://github.com/raine/workmux#manual-setup): _teaches the AI how to use [workmux](https://github.com/raine/workmux), which is a "git worktrees + tmux windows for zero-friction parallel dev"_
- [pre-pr](https://github.com/Guilospanck/dotfiles/blob/main/claude/skills/pre-pr/SKILL.md): _my custom skill to run before you're ready to open a pull request_

> A full list of my Claude skills can be found [here](https://github.com/Guilospanck/dotfiles/tree/main/claude/skills).

## AI as a learning partner

Using AI as a coding partner in the way I describe in the previous section makes me learn about lots of different topics along the way, but there are times that I want to learn about something that I'm not actively working on yet.

For a lot of topics it suffices to ask an AI and you will learn about it. For example:

> _"Teach me about secure DNS"_

For the cases that you can't learn about it just with the answer it gave you or you would like to go deeper into it or require more of a "graphic" explanation, artifacts are your best friend. Here's an example from when I wanted to re-learn more about the event loop in JavaScript:

> _"Generate an artifact to me so I can understand how the JavaScript event loop works, with its microtasks and macrotasks, and specific Node queues. Make it so that I can step on a function definition line by line and see graphically what happens internally in the event loop: what is pushed/popped to queues and call stack, when, and a simple explanation of the 'rules' so I can understand and remember it better."_

Claude generated [this artifact](https://claude.ai/artifact/5nuRTLHGr69yWCDUMahj1H) for me, which I found awesome and a great resource for learning. Give artifacts a try for anything you've been wanting to (re)learn. It will surprise you.

## Final thoughts

None of this is set in stone. Models change every other week and my workflow changes with them. What stays is the idea behind it: let AI go fast, but never skip verifying what it produced and understanding what it did.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
