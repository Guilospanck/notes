+++
title = "The Beauty of the Simple"
date = "2024-05-30T16:16:41+01:00"
draft = false
tags = ["mandelbrot", "julia", "game of life"]
categories = []
javascript = false
math = false
mermaid = false
+++

## Life started simple

We look everywhere. Everything seems so complex, so magical, so beautiful. For sure there must be some intelligent mind behind all of this.

_Maybe there is, maybe there isn't. Who knows?_

Let's assume for a moment that there isn't.

All of this complexity sprung from a simple thing, a single condensed point and then, after many iterations known as years, we arrived at what we have today.

_Seems impossible, doesn't it?_

When we think about these subjects we grow compassion for the early societies that attributed everything that they didn't know to the gods. It sure does look like it was made by them (_maybe it was_).

What we know with some level of sureness is that we all came from _basic_ enough substances and here we are.

_All of us. All of everything._

If you keep looking down and down and down we are all made of the same construction elements. Basic things.

I love this video. It shows how everything goes from a simple thing up to the whole Universe.

{{< figure src="cosmic_eye.png#center" alt="Universe Size Comparison | Cosmic Eye" title="Universe Size Comparison | Cosmic Eye" width="800" link="<https://www.youtube.com/watch?v=8Are9dDbW24>" target="_blank" >}}

Nature teaches us humility.
Nature shows us how everything works.
We just have to learn how to look.

## Mathematical beauties

We evolved and with that our understanding of the Universe (_there are controversies_). There are some beautiful mathematical equations that show us exactly what this "from simple to complex" really means.

### Game of Life

>"Can something with really simple rules and an initial state become something very complex just by _letting it rip_?".

The answer is yes and we can see it in action by checking _Conway's Game of Life_.

It has simple rules:

- Any live cell with fewer than two live neighbors dies, as if by underpopulation;
- Any live cell with two or three live neighbors lives on to the next generation;
- Any live cell with more than three live neighbors dies, as if by overpopulation;
- Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

With these rules and a random initial state it can turn into complex and beautiful patterns, most of them  looking very lively.

_It is as if we were actually observing a **real** (🔵🐇🔴) Universe running._

You can play with it at [my Conway's Game of Life implementation](https://guilospanck.github.io/Conway-Game-Of-Life-React/).

Some pictures of some patterns:

{{< figure src="giant_cross_initial.png#center" alt="Giant Cross initial state" title="Giant Cross initial state" width="800" >}}

{{< figure src="giant_cross_after.png#center" alt="Giant Cross after some iterations" title="Giant Cross after some iterations" width="800" >}}

Take this, for example. It is a simple random initial state. At this point, it is static - meaning it is not moving, it's stale, the population is not growing nor dying, even after _infinity_ iterations.

{{< figure src="random_initial_state.png#center" alt="Random initial state" title="Random initial state" width="800" >}}

Then, after adding just ONE alive cell in a random place and waiting for some iterations, look where it led us.

{{< figure src="random_after.png#center" alt="Random after some iterations" title="Random after some iterations" width="800" >}}

Look at the scale. Look at how far away those cells on the bottom are from the "source". One simple alive cell did it. That's entropy, that's _"butterfly wings in Brazil creating hurricanes in Florida"_ effect in action.

_And it keeps going when you hit play._

It will keep moving _forevermore_, creating more and more outliers in the process, in all directions, just like probes going into the unknown space searching for meaning; searching for something, anything.

The sad thing is that, in this little Universe, I am the Architect and I know there's nothing out there because I didn't put it.

> How sadder would it be if we found out that this is exactly what the Architect of our Universe would say looking at us exploring space.

{{< figure src="architect.png#center" alt="Hello, Neo" title="Hello, Neo" width="800" >}}

### Mandelbrot and Julia sets

You probably heard about fractals once in your life. Those beautiful abstract images that keep repeating the same pattern wherever you look into the image.

{{< figure src="mandelbrot.png#center" alt="Mandelbrot set" title="Mandelbrot set" width="800" >}}
{{< figure src="julia.png#center" alt="Julia set" title="Julia set" width="800" >}}

Mandelbrot and Julia sets are yet another example of a simple thing converting into a complex structure.

The _"rules"_ are simple:

- Start with an initial state: `z` for Mandelbrot, `c` for Julia, both complex numbers (`a + bi`);
- If `|z|` or `|c|` is greater than 2, it is not part of the sets;
- Respect this equation: `z = z^2 + c` for each iteration while the value of `|z|` is not greater than 2;
- Based on the information of how many iterations it took to break out of the bounds of the set, attribute a color.

So, the basic difference between both sets is that Mandelbrot fixes the initial `z` and Julia fixes the `c` value while iterating the loop.

You can check a simple implementation of these sets in [this repository](https://github.com/Guilospanck/mandelbrot-julia-sets).

## This is the End

> _"My only friend, the end"_.

They use to say that people around the world that have had psychedelic experiences tend to experience fractal patterns. What does that teach us?

Well, for a starter, it shows that we are all part of the same being, we are all connected in some way and that we all function in very similar ways.

Another thing that you could take from the statement is that we may be experiencing what the world really is. Maybe we are all inside one of those sets. A simulated reality. Although frightening, it doesn't change anything as that's the only universe we know of, even if it is simulated.

The conclusions I take from this is that there are a lot of things that we still don't know and we are basically trying to mimic nature in some ways, hoping that we may one day find out. It's a great direction and a great start, but we're still in embryonic phase.

One day we will get there, maybe.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
