---
title: Topic Summary - Asymptotic Notation
...

# Introduction

In our [last topic summary](summaries/runningtime.md) we discussed why and how we represent running times as a function and gave high level descriptions of the tools we could use to compare those functions. To give a brief refresher:

- If we want to say that some function $f(n)$ is "less than or equal to" another function $g(n)$, we'll write $f(n)\in O(g(n))$ or $f(n)=O(g(n))$ (the former is notationally more correct, but the latter is more commonly used). This is read as "$f(n)$ is big-oh of $g(n)$".
- If we want to say that some function $f(n)$ is "greater than or equal to" another function $g(n)$, we'll write $f(n)\in \Omega(g(n))$ or $f(n)=\Omega(g(n))$ . This is read as "$f(n)$ is big-omega of $g(n)$".
- If we want to say that some function $f(n)$ is "asymptotically equal to" another function $g(n)$, we'll write $f(n)\in \Theta(g(n))$ or $f(n)=\Theta(g(n))$ . This is read as "$f(n)$ is big-theta of $g(n)$".

In all of these cases, we want to be comparing functions in the way we saw them in our prior courses (cse 123, cse 143, or equivalent). That is, we want our definitions to allow us to compare functions by dropping non-dominant terms, ignoring constants, and then looking only at long-term behavior. This means we would compare $f(n)=11n^2-20n+8$ with $g(n)=\frac{n^3}{10} - 50$ by simplifying $f(n)$ to be $f(n)\approx n^2$ and simplifying $g(n)$ to be $g(n)\approx n^3$, thus concluding that $f(n)=O(g(n))$ or $g(n)=\Omega(f(n))$.

This is the process we want to end up with, but we need definitions that formalize this. This is because we want to be able to use this process even when the functions are not so easy to compare. For example, this process still makes it unclear how we would compare $f(n) = (\log n)^2$ with $g(n)=\sqrt n$.

# O, $\Omega$, $\Theta$

We now will present the formal definitions of $O$, $\Omega$, and $\Theta$, and discuss why they result in the comparison process above.

Firstly, let's talk about what *type* of thing $O$, $\Omega$, and $\Theta$ are. When we look $O(n)$, $\Omega(n)$, and $\Theta(n)$, thes each are actually a *set of functions*, specifically: 

- **$O(n)$ is the set of all functions which are asymptotically upper bounded by $g(n)=n$**. 

    - Some examples of functions that belong to this set are $n$, $2n$, $0.5\cdot n$, $\sqrt n$, $1$, $\log n$, etc.

- **$\Omega(n)$ is the set of all functions which are asymptotically lower bounded by $g(n)=n$**. 

    -  Some examples of functions that belong to this set are $n$, $2n$, $0.5 \cdot n$, $n^2$, $n \log n$, $2^n$, etc.

- **$\Theta(n)$ is the set of all functions which are asymptotically tight bounded by $g(n)=n$**.

    - Some examples of functions that belong to this set are $n$, $2n$, $0.5 \cdot n$, $n-5$, etc.

(Totally optional aside if you want to geek out about math notation with me for a bit. The formal type of $O$, $\Omega$, $\Theta$ themselves is something like "functions mapping functions to sets of functions", and we could write their type as $(\mathbb{N} \rightarrow \mathbb{N}) \rightarrow \mathcal{P}(\mathbb{N} \rightarrow \mathbb{N})$ which would read something like "a function whose domain is functions mapping natural numbers to natural numbers and whose co-domain is the powerset of functions mapping natural numbers to natural numbers".)

## Formal Definitions

Here we present the formal definitions of $O$, $\Omega$, and $\Theta$:

- We define $f(n) \in O(g(n))$ provided that $\exists c>0$ and $\exists n_0\in \mathbb{N}$ such that $\forall n \geq n_0$ it is true that $f(n)\leq c \cdot g(n)$.
- We define $f(n) \in \Omega(g(n))$ provided that $\exists c>0$ and $\exists n_0\in \mathbb{N}$ such that $\forall n \geq n_0$ it is true that $f(n)\geq c \cdot g(n)$.
- We define $f(n) \in \Theta(g(n))$ provided that $f(n)\in O(g(n))$ and $f(n)\in \Omega(g(n))$.

## Intuition

Let's now discuss the inuition for how these definitions give us some of the properties we've mentioned to be desireable.

### Achieving greater than, less than, and equal to

We mentioned that $f(n)\in O(g(n))$ acts like "$f(n) \leq g(n)$", $f(n)\in \Omega(g(n))$ acts like "$f(n) \geq g(n)$", and $f(n)\in \Theta(g(n))$ acts like "$f(n) \approx g(n)$". Here's where we can see these relationships in the formal definitions:

- **$O$**: Ignoring all of the quatifiers for now, we see that the definition of $O$ concludes with $f(n)\leq c \cdot g(n)$. We are therefore checking that the value of $f(n)$ is less than or equal to $g(n)$, directly corresponding to that intuitive notion.
- **$\Omega$**: Ignoring all of the quatifiers for now, we see that the definition of $\Omega$ concludes with $f(n)\geq c \cdot g(n)$. We are therefore checking that the value of $f(n)$ is greater than or equal to $g(n)$, directly corresponding to that intuitive notion.
- **$\Theta$**: we say that $f(n)\in \Theta(g(n))$ provided it is both $O(g(n))$ and $\Omega(g(n))$. Mapping back to the intuitions of $O$ and $\Omega$ this means "$f(n) \leq g(n)$" and "$f(n) \geq g(n)$" respectively. Similar to when we're comparing numbers, the only way that something can be both $\leq$ and $\geq$ another thing is if they are equal. *(Important, because of the way we're comparing, we're not saying that $f(n)$ and $g(n)$ give the same output, just that in the long term their outputs are of similar magnitude.)*


### Ignoring Small Inputs

Another property we mentioned that these definitions should have is that they ignore small inputs. This was important because we might have an algorithm which is very fast for small inputs, but then scales poorly as the input size grows. In such a situation we would likely prefer the algorithm which scales better, so we hope to ignore these little input sizes.

All three of these definitions enable this in the same way. Each definition has the requirement that $\exists n_0\in \mathbb{N}$. We can interpret this $n_0$ (pronounced "n sub zero" or "n naught") as the size where we stop ignoring. In other words, we're going to ignore all input sizes smaller than this chosen value $n_0$. The definitions enforce this ignoring by conditioning $f(n)\leq c \cdot g(n)$ and $f(n)\geq c \cdot g(n)$ on $n \geq n_0$. In other words, the definitions only need the target inequality to hold for values of $n$ that are larger than $n_0$, all the smaller values are ignored.

### Dropping Constants and Non-Dominant Terms

We want our definitions ot have the property that constant coefficients and non-dominant terms have no impact on the asymptotic growth. In other words, we want a function like $\frac{1}{5}n^2-13n-8$ to be considered asymptotically the same as $20n^2 + 100n + 500$. This behavior is accomplished using the constant value $c$ in the definition.

Let's first look at how $c$ allows us to ignore constant coefficients. Suppose we want to compare $f(n)=5n^3$ to $g(n)=2n^3$. Because our definition of $O$ allows us to multiply $g(n)$ by a $c$, we could pick $c=3$ to conclude $f(n)\leq c \cdot g(n)$, since we would have $5 n^3 \leq 3 \cdot 2 n^3$ and so $f(n)=O(g(n))$. Using the choice of $c=1$ we could show $f(n)= \Omega(g(n))$ since we would have $5n^3 \geq 2n^3$. Together, this means that $f(n)=\Theta(g(n))$. From these examples, we can see that two functions that differ only by a constant coefficient can be shown to grow at the same asymptotic rate using the constant $c$ in the definition. For this reason, we are able to ignore constant coefficients in asymptotic analysis.

Next let's see how $c$ allows us to ignore non-dominant terms. Intuitively, what we'll see is that adding a non-dominant term makes *less* of a difference asymptotically than changing a constant coefficient on the dominant term. Therefore, since we understand that we can ignore constant coefficients, we can also ignore non-dominant terms. 

Let's see an example of this. Suppose we want to compare $f(n)=2n^2 + 8n + 3$ with $g(n)=n^2$. Let's start by showing that $f(n)=O(g(n))$. To do this we need $f(n)\leq c \cdot g(n)$. To help ourselves out, we'll first identify a new function $f'(n)$ such that $f(n)\leq f'(n)$ and $f'(n)$ differs from $g(n)$ by only a constant coefficient. Let's start with $f(n)=2n^2 + 8n + 3$. For any value of $n \geq 1$ $n^2 \geq n$ and $n^2 \geq 1$ so $2n^2 + 8n + 3 \geq 2n^2 + 8n^2 + 3n^2$ and so $f(n)\leq 13n^2. We can now use $f'(n)=13n^2$, and since that differs from $g(n)$ by only a constant factor, we can conclude $f(n)=O(g(n))$.

Let's now show $f(n)=\Omega(g(n))$ for $f(n)=2n^2 + 8n + 3$ and $g(n)=n^2$. In this case we need $f(n) \geq g(n)$, so for our choice of $f'(n)$ we want $f(n)\geq f'(n)$ and we want $f'(n)$ to differ from $g(n)$ by only a constant factor. In this case we can select $f'(n)=2n^2$ by just dropping the non-dominant terms since they only could increase the value.



# Example Proofs

Now that we've seen how our definitions operate, let's see some example proofs of $O$, $\Omega$ and $\Theta$. The definitions of $O$ and $\Omega$ require showing that there exists values $c$ and $n_0$ which cause the statements $\forall n \geq n_0 . f(n)\leq c \cdot g(n)$ (for $O$) or $\forall n \geq n_0 . f(n)\geq c \cdot g(n)$ (for $\Omega$) to be true. Therefore a complete proof only needs to prove any one choice of $c$ paired with $n_0$, then demonstrate the target inequality holds for every value of $n$ that's at least $n_0$. The important thing to note is that you do not need to justify how or why you selected your $c$ and $n_0$ pair, you just need to defend that they work. In the examples below we'll show you how I (Nathan) would go about identifying the pair, then I'll show you how I would prove that my choice works.

## Big-Oh Proofs

For each of these we'll show $f(n)=O(g(n))$ for different choices of $f(n)$ and $g(n)$.

### $f(n)=4n^2 + 8n + 10$, $g(n)=\frac{1}{4} n^3$

> **Nathan's scratch paper**
> Because we're showing $O$, we want $f(n)\leq c \cdot g(n)$. Comparing the two functions, $g(n)$ seems to have the larger dominant term, so my strategy will be to identify a function $f'(n)$ where it's clear that $f(n) \leq f'(n)$ and $f'(n)\leq g(n)$. Specifically, I will pick $f'(n)$ to have the form $k n^2$ so that it will be easy to compare $f(n)$ with $f'(n)$ and easy to compare $f'(n)$ with $g(n)$. Because for any value of $n\geq 1$ we have $n^2\geq n$ and $n^2 \geq 1$ I can pick $f'(n)=22n^2$, because it's clear that $4n^2 + 8n + 10 < 22n^2$ (by subsituting $8n^2$ for $8n$ and $10n^2$ for $10$). 
> 
>Now we need to get $f'(n)\leq c\cdot g(n)$. We could take two strategies to do this. We could either try to select an $n_0$ so that $c\cdot g(n)$ "overtakes" $f'(n)$, or we could select a value of $c$ so that this becomes true for all choices of $n$ (or we could mix these). To me, it seems easier to select $c$, so I'll go with that. Since the coefficient within $f'(n)$ is $22$ and the coefficient in $g(n)$ is $\frac{1}{4}$, I'll pick $c=88$ so that $c\cdot g(n)=22n^3$, making it clearly larger that $f'(n)$ and therefore larger than $f(n)$.

Now we have our selection of $n_0=1$ and $c=88$. Let's use those to show $f(n)= O(g(n))$.

> **Proof**:


# Common Misconceptions