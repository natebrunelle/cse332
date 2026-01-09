---
title: Topic Summary - Asymptotic Notation
...

# Introduction

In our [last topic summary](summaries/runningtime.md) we discussed why and how we represent running times as a function and gave high level descriptions of the tools we could use to compare those functions. To give a brief refresher:

- If we want to say that some function $f(n)$ is "less than or equal to" another function $g(n)$, we'll write $f(n)\in O(g(n))$ or $f(n)=O(g(n))$ (the former is notationally more correct, but the latter is more commonly used). This is read as "$f(n)$ is big-oh of $g(n)$".
- If we want to say that some function $f(n)$ is "greater than or equal to" another function $g(n)$, we'll write $f(n)\in \Omega(g(n))$ or $f(n)=\Omega(g(n))$ . This is read as "$f(n)$ is big-omega of $g(n)$".
- If we want to say that some function $f(n)$ is "asymptotically equal to" another function $g(n)$, we'll write $f(n)\in \Theta(g(n))$ or $f(n)=\Theta(g(n))$ . This is read as "$f(n)$ is big-theta of $g(n)$".

In all of these cases, we want to be comparing functions in the way we saw them in our prior courses (cse 123, cse 143, or equivalent). That is, we want our definitions to allow us to compare functions by dropping non-dominant terms, ignoring constants, and then looking only at long-term behavior. This means we would compare $f(n)=11n^2-20n+8$ with $g(n)=\frac{n^3}{10} - 50$ by simplifying $f(n)$ to be $f(n)\approx n^2$ and simplifying $g(n)$ to be $g(n)\approx n^3$, thus concluding that $f(n)=O(g(n))$ or $g(n)=\Omega(f(n))$.

This is the process we want to end up with, but we need definitions that formalize this. This is because we want to be able to use this process even when the functions are not so easy to compare. For example, this process still makes it unclear how we would compare $f(n) = (\log n)^2$ with $g(n)=\sqrt(n)$.

# Formal Definitions

We now will present the formal definitions of $O$, $\Omega$, and $\Theta$, and discuss why they result in the comparison process above.

Firstly, let's talk about what *type* of thing $O$, $\Omega$, and $\Theta$ are. When we look $O(n)$, $\Omega(n)$, and $\Theta(n)$, thes each are actually a *set of functions*, specifically: 

- **$O(n)$ is the set of all functions which are asymptotically upper bounded by $g(n)=n$**. 

    - Some examples of functions that belong to this set are $n$, $2n$, $0.5\cdot n$, $\sqrt(n)$, $1$, $\log n$, etc.

- **$\Omega(n)$ is the set of all functions which are asymptotically lower bounded by $g(n)=n$**. 

    -  Some examples of functions that belong to this set are $n$, $2n$, $0.5 \cdot n$, $n^2$, $n \log n$, $2^n$, etc.

- **$\Theta(n)$ is the set of all functions which are asymptotically tight bounded by $g(n)=n$**.
 
    - Some examples of functions that belong to this set are $n$, $2n$, $0.5 \cdot n$, $n-5$, etc.

(Totally optional aside if you want to geek out about math notation with me for a bit. The formal type of $O$, $\Omega$, $\Theta$ themselves is something like "functions mapping functions to sets of functions", and we could write their type as $(\mathbb{N} \rightarrow \mathbb{N}) \rightarrow \mathcal{P}(\mathbb{N} \rightarrow \mathbb{N})$ which would read something like "a function whose domain is functions mapping natural numbers to natural numbers and whose co-domain is the powerset of functions mapping natural numbers to natural numbers".)