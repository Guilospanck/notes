+++
title = "Diffie-Hellman (Blind) Key Exchange"
date = "2024-03-30T17:06:59Z"
draft = false
tags = ["diffie-hellman", "ecash", "chaumian"]
categories = []
javascript = true
math = true
mermaid = false
+++

## Key Exchange

The Diffie-Hellman (DH) Key Exchange is a way of two parties exchanging their secret in a secure manner over a public network. Here is a diagram showing how they do it:

{{< figure src="diffie-hellman.png#center" alt="Diffie-Hellman Key Exchange" title="Diffie-Hellman Key Exchange" width="800" >}}

So, basically an asymmetric cryptography is used to generate a pair or private and public keys for each party. Then, each party shares their public keys over a public space (like the internet). This is secure because the public keys are supposed to be public.

Then, the real _"magic"_ is that, using those shared public keys, each party can then calculate the secret by themselves and that secret will be the same for both of them, even though they are calculating in different ways.

After this point, both can send data to each other using their now symmetric key.

### DH key exchange shared secret proofs

Proving that the shared secrets are the same on a DH key exchange.

For $S_1$:
$$ S_1 = B^a \space mod \space p $$
$$ = aB $$
Then, using the fact that $B = g^b = bG$:
$$ S_1= abG $$

For $S_2$:
$$ S_2 = A^b \space mod \space p $$
$$ = bA $$
Then, using the fact that $A = g^a = aG$:
$$ S_2= abG $$

Therefore:
$$ S_1 = abG = S_2 $$

## Chaumian Ecash DH Blind Key Exchange

{{< figure src="blind_dh.png#center" alt="Chaumian Ecash Diffie-Hellman Blind Key Exchange" title="Chaumian Ecash Diffie-Hellman Blind Key Exchange" width="800" >}}

[Chaumian Ecash](https://cypherpunks.venona.com/date/1996/03/msg01848.html) can use DH for a process of blindly key exchanging. The goal is for `Alice` (wallet) to get `Bob` (mint) to perform a DH key exchange blindly, such that when the unblinded value is returned, `Bob` recognises it as his own, but can't distinguish it from others.

It does the same key exchange as above, the difference is that before sending what would be the `Public Key` from `Alice` to `Bob`, it _blinds_ it with a random `blinding secret (r)`.

By doing that, we are actually sending a "closed envelope" (a `blinded message`, also called an `output`) to the mint, which will sign it, and return to the wallet a `blind signature`, also called a `promise`.

From the `blind signature` returned, the wallet computes the unblinded value (`C`). Now we have a token defined by `(x, C)` in the digital cash system.

Once a wallet user sends this to the mint, it will verify that it belongs to it, without knowing from which places did that token come, as `x` was never known to the mint. This is the beauty of it! 🔐

## Conclusions

Diffie-Hellman Key Exchange is a powerful method to exchange keys in a secure way via a public interface and can be used in many different situations.

Humans are so smart.

## License

This post is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
