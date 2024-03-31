+++
title = "Elliptic Curve Cryptography (ECC) - ELI5 "
date = "2024-03-31T17:32:10+01:00"
draft = false
tags = ["ecc", "cryptography", "elliptic curve", "mod"]
categories = []
javascript = true
math = true
mermaid = false
+++

## ELI5

ECC is a widespread way of dealing with the public key cryptography keys generation.

{{< figure src="ecc.png#center" alt="Elliptic Curve Cryptography" title="Elliptic Curve Cryptography" width="800" >}}

The figure above illustrate how to get the point `8G` starting from an origin point `G`.

It works as:

- Pick a generator point (`G`) that belongs to the curve;
- To get `2G`, which is in fact the sum of `G` to itself, you draw the tangent of the `G` point and then find the point that it hits the elliptic curve. This point will be `-2G`;
- Reflect this point over the `x-axis` to find the `2G`;
- Now to find the `4G`, find the tangent of `2G` and do the same process above. Once you find it, do the same to find `8G`.

> You could also do it in a different way:
> after finding `2G`, you could add `2G` + `G` to find `3G` by drawing a line defined by `2G` and `G`, finding the intersection with the curve and then reflecting over `x-axis`.

So, from the example above, we did all this math to find `8G` coming from an origin generator point `G`.

This could be defined as:

$$ K = kG $$

where:

- $K$: also known as public key. It is a point on the curve $(x,y)$;
- $k$: also known as private key. It is a scalar value. It defines how many times we _"jump"_ on the ECC, starting from point `G`;
- $G$: the generator point. It is our starting point. This is shared between parts that want to use the same ECC curve.

## Modulo operation

{{< figure src="circle_rep.png#center" alt="Circle representation of integers mod N" title="Circle representation of integers $mod$ N" width="800" >}}

The modulo ($mod$) is a mathematical operation also known as the `remainder` of a division. It is widely used in mathematical operations to limit the output of an expression.

As shown in the figure above, it basically works like a clock: once it reaches the final value, it _begins_ again from the start.

No matter how long the number ($x$), the maximum value of $x \space mod \space y$ will be $y-1$.

For example:

$$ 14 \space mod \space 3 = 2 $$

Because $14/3$ results in 4 with a remainder of 2.

Some `mod` of 3:

| n | n mod 3 |
| - | ------- |
| 1 |    1    |
| 2 |    2    |
| 3 |    0    |
| 4 |    1    |
| 5 |    2    |
| 6 |    0    |
| 7 |    1    |
| 8 |    2    |
| 9 |    0    |

## ECC and mod

You can also think of ECC, roughly, as a plugin replacement for $mod$. In other words, If the points are on the curve, they are limited by the curve as they would for a $mod$.

## Misc

Usually in cryptography we use $mod$ of a large prime number for two reasons:

1) Being a prime, the distribution will be more uniform that any other number, as primes are only divisible by themselves and 1. Other number may have biases towards some certain values which can make a encryption less secure;

2) The prime number is large because it will take more time (more iterations) for it to cycle back, having less repetition than a smaller one. Repetitions can also incur in less security.

> Warning: This post has [KaTeX](https://katex.org/) enabled,
> so if you want to view the rendered math formulas,
> you'll have to unfortunately enable JavaScript.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
