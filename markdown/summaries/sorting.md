---
title: Topic Summary - Sorting Algorithms
...

# Defining Sorting

In this unity we will exercise our newly-formed algorithm analysis and data structure skills to study sorting algorithms. A sorting algorithm takes a list as input, and then rearranges the elements of that list so that they are in ascending or descending order. In order for sorting to make sense, we need to make some assumptions about the input to our algorithm:

1. The input data structure satisfies an ADT that allows for elements have a defined order (meaning we need notions such as "the first element", "the last element" and "the next element") and it must permit the elements to be in any arbitrary permutation (so, for example, a heap would not work here because not all orders of elements are allowed).
2. The input data structure must allow for indexing. That is, we must have operations which enable accessing or changing the value at any valid index of the data structure. 
3. The elements within the data structure must have a total ordering, meaning that for any pair of elements we can determine whether one is greater than, less than, or equal to the other.

While the above assumptions are necessary for defining sorting at all, we'll also add in the following assumptions for this course, which will be useful in writing and analyzing our algorithms:

- Our input data structure will be an array or array list
    - This satisfies assumptions 1 and 2 above, and futhermore, it allows for our indexing operations in 2 to run in constant time
- The elements of our list will implement the Java compareTo interface, or the equivalent to this if we consider another programming language.

At this point, we have everything we need to give a formal definition of sorting. 