+++
title = "AI Buddy"
date = "2026-09-30T18:01:37+01:00"
draft = true
tags = ["ai", "agents"]
categories = []
javascript = false
math = false
mermaid = false
+++

As many of you are, I've always been super into programming, since the first time I typed `algoritmo "ola-mundo"` - and yes, my first contact with programming was with [Portugol](https://pt.wikipedia.org/wiki/Portugol), a structured pseudocode language in which you can code in portuguese.

It was instant love, love at first sight. I still remember the feeling of amazement, magic, excitement. I couldn't stop just learning more and more about it. I would go home and just want to keep doing it. It just felt right.

And that has been my feeling for the +12y since it happened and +8y working with it professionally.

Then came AI.

## The start

When the concept of AI first appeared as ChatGPT around ending of 2022, I didn't give much importance to it. Even circa 2023/2024 (GPT 4/4o) I still didn't. Not only I didn't, but I was firmly against using it for anything programming/coding-wise. Not even helping formatting or editing JSONs files. No autocomplete besides the intellisense that "comes" with my text editor (nvim, btw).

The thought of something coding for me, getting in my way, robbing me of my supply of happiness/sadness/excitement/dreadfulness rollercoaster was unthinkable. I could not. Never. Not only that, I would internally look at people relying on those tools as "less" - or perhaps "not a true engineer".

This feeling stayed with me until very recently (~2 to 3 months ago).

## What changed

As everyone in the field (and other fields as well) noticed, things really started changing and gaining traction late November/2025 (the infamous [Claude Opus 4.5 release](https://www.anthropic.com/news/claude-opus-4-5)). From that moment on, everything went up(down)hill.

Somewhere last year (2025) I was in a burnout phase: it wasn't a happy place to be. Things that I really liked it, really loved it, I couldn't find the amazement anymore. It was dragging. It look me around 6-8 months to try and get back to be close to how things were before.

Then the November AI wave hit.

Once again my motivation and future perspectives started dropping more and more for every and each news of how AI would make everything obsolete. _"What's the point of learning anything nowadays?"_ - this is what would cross my mind everyday, almost the whole day.

I'd try to talk to people and see how they were feeling about it. I was able to talk to people that felt different things: some really LOVED IT and were SUPER EXCITED about everything; others were DREADING the new tech as I was. I felt hopeless. I felt confused. I felt boxed.

There were so many voices inside my head:

> _"Am I just being a 'old-man-yelling-at-clouds'?"_

> _"Am I just afraid of losing my job, or is it because I'm holding onto the effort that I've put my whole professional life and that now it seems it's being taken from me at a rapid pace?"_

> _"Am I correct to feel this way? Should I be thinking the other way? Should I be seeing things 'cup half-filled'?"_

> _"No, I'm correct. This is slop machine. People are delusional. I'm on the right side."_

> _"Am I just being the guy that still held onto its horse and negated cars?"_

The list kept going on and on. It seemed that it had no end to it and I couldn't even reach the bottom to then understand and make an argument, think of a good answer, make a decision.

The more I didn't want to be in pair with this new technology, I was afraid of being left behind so I would from time to time use it a bit for some random things, or do a feature by hand and then see how AI would implement it, but still I was super against it (_as you can see in [this comment](https://github.com/Guilospanck/pqc/pull/8) from one AI generated PR for a feature in one of my repos_). Even though I could see the use of it - and how many times it could be better than me - I would still despise it. It was a mix of being afraid of being replaced with "but you have to trust yourself" with "but I see so much AI slop everywhere" with "but I also see such great engineers that I look up to using it in such a wonderful way" (one of them being [Fabio Akita](https://github.com/akitaonrails)).

I was divided. I was afraid. I was confused. I was scared. I was excited. I felt betrayed. I felt worthless. I felt hopeless. I felt incredible. All of those things at the same time. 

> Everything. Everywhere. All at once.

Then I started becoming more critic of what I was consuming. I started to reflect more. I started to consume ideas also from people that I didn't agree with at the time. I started seeing the changes in some people that were like me. I started to see good and strong projects made with AI, not only the sloppy ones.

Then I started using AI more and more, but all the while being careful on the way I was using it. I didn't want to use it just as a "fix this, make no mistakes" (although sometimes I do), but as a powerful coding/documentation/architect on steroids.

Slowly starting to get to know how AI code is written, the trade-offs, the paths that some models will mostly always take, adding better guardrails, dabbing with different skills, using more than one model (adversarial reviews) and of course the natural evolution of each model (which looks like a brand new JS framework every week, the difference is that these are usually good).

So... do I still code by hand?
Absolutely, although I tend to do that for the things that I really want to learn and usually on my hobby projects, where I have don't have any of the cons of professional environment, like pressure and timelines.

I still code by hand, but it's been harder...much harder than before. It takes time for the brain to get used to the "slowness" of how artisanal code is built.

## How I use AI

I use mostly [Claude Code](https://claude.com/product/claude-code) in the CLI as a coding agent, [codex](https://openai.com/codex/) as adversarial reviewer and a mix of [ChatGPT](https://chatgpt.com/) and [Claude Desktop](https://claude.com/download) as Google for things usually either outside of coding or outside of what I'm building at the moment. I also love using [Claude Artifacts](https://claude.ai/artifacts). For me it's the best way of learning new things.

### AI as a coding partner - a "buddy"

This is my current workflow on working with AI nowadays. The basic idea is:

1. Get AI to do something via [prompting](#prompting);
2. [Manually test](#manual-testing) it to make sure that we will spend time on at least a working feature;
3. Run the [automated tests](#automated-tests);
4. Run an [adversarial review](#adversarial-review);
5. If something meaningful was found, ask it to fix it and basically run from step 1 again. If it's either a false positives or something that I deen not necessary to do it now, then proceed;
6. [Check manually](#manual-code-review) most of the code that was generated. If not happy, go back starting from step 1 again. If happy, then wait for the PR process.

> 👉 Steps 2 and 3 don't necessarily need to follow this order. You could choose to run 3 before 2.

Each and every one of the steps above only move forwards if they succeed in whatever metric I judge necessary.

Notice that every and each time some part of the code has changed, you need to re-test it again to make sure that you're not validating it with past assumptions. Remember that even the simplest changes can break everything.

This is the way I've found to produce code at high speeds all the while keeping it as close as possible to working software and improving my understanding of whatever is happening.

### Prompting

There are two ways that I prompt AI to do something and it depends on my level of understanding of what I want:

#### I know exactly what I want

If that happens to be the case, then it's pretty much straightforward. Just prompt it what I want and that's it:

> _"I want section X to have abc and section Y to be like this"_.

For simpler tasks this is usually the case, but for more complex tasks, there's the next topic.

#### I don't know _exactly_ what I want

In this case it will depend on how little I know. 

If I happen to know enough and I just need more input about something else, I ask promptly:

> _"Hey, I want to build X. For that, making this and this and this seems to be the correct way. Do you see any contradictions/problems on this approach? Why?"_


There are times that I might know what I want mostly on a superficial level - maybe it's a complex usecase; maybe I'm still fiddling around. In those occasions, I will use it as a smarter google: 

> _"I want to build system **"X"**. It needs to have this and this and this. I'm not sure still what I'll be using and what's the best way to build it. I want it to have configuration **"Y"**", security **"Z"**, work **"W"** way, and I'm okay with not being perfect on **"V"**. Do a deep research and give me my options for each one of them with their pros and cons, and which ones are your recommendations and why"_.

After the AI does that, I will go through a long planning process (depending on how big the system is can take days), in which we will design the system together from ground up, freeing any roadblocks along the way that could block us in the future.

Although it might seem slower in the beginning, once you have a detailed plan of every part of the system, the actual implementation will be very fast and mostly autonomous (given you gave AI the correct guardrails for each one of the systems/features).

### Manual testing

This is straightforward most of the times. If you're building a system, you usually know how it's supposed to work. The idea here is to use it as if you were a user. See if it fits your expectations of the system/feature.

If it's a web app and you're building a form to save user's information, then you just go there manually to the web form, fill in some information and see if it saves correctly. You become your QA - as you should've always been.

Using this as the first line of "defense against very dumb errors" is pretty good because it can also lead you to have more input on the next phases and you feel what a possible user would feel if that happens to not work the way we would expect it to work.

### Automated tests

Here lies your unit, integration and e2e tests. But also, your linting, formatting, typechecks.

Even more: I like to have here also the same environment as my CI process would run, including a differentiation - if needed - of the steps that are REQUIRED to pass so we can merge the branch and the ones that are OPTIONAL.

Waiting for a CI to run on the cloud (I mean GitHub/Forgejo/Gitlab actions) is usually MUCH slower than what you could have by running them locally first.

The idea is that, instead of waiting for that long time once you think everything is ready and then finding out that some REQUIRED step hasn't passed and you can't merge it [🤬](./frustrated-jim-carrey.gif), you do it faster locally and push an already good-to-go PR code.

That saves cloud computing, but most importantly: saves your headspace.

### Adversarial review

LLMs are statistical machines, you can never blindly trust them 100%. The good thing is that - allegedly - different models were trained differently, and that leads to different outcomes to same questions. 

That's both good and bad. The bad is the trusting issues. The good is that you can use that to make them ["fight each other"](./mj_laugh.png) and then you have different points of view and can, therefore, make a better decision (allegedly).




## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
