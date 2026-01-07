---
title: Tasks
...




# Exercises

All exercises will be submitted and graded on this [Gradescope for exercises and exams](https://www.gradescope.com/courses/1208996).

Some exercises may require submitting to multiple gradescope assignments (e.g. if there is a programming component as well as a written component). The assignment instructions will make it clear when this is the case.


## Exercise 0

The objectives of this exercise are to: 

- Set up your Java environment
- Refresh our Java programming skills
- Gain experience implementing data structures from an ADT
- Use Java generics
- Use benchmarking to study the running time of algorithms

This assignment has three main parts. The first involves setting up your java programming environment. The second involves implementing some data structures. The third involves analyzing the running times of your implementations using benchmarking. There is no deliverable for part 1. Parts 2 and 3 each have a separate Gradescope submission, which will combine together to count as your exercise 0 grade.

For this exercise, you will need:

- [cse332 VSCode Profile](files/exercises/cse332-Java.code-profile) - Our recommended configuration profile for VSCode. This disables gen-AI tools for you.
- [Starter Code](/files/exercises/ex0.zip) - which contains various classes that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/e/2PACX-1vREnpEvlsTQpkNX5wwHHIpAvwnPKN7sG-GQFsek39qXZj4QOng2ZxMhfJOZRec3jw/pub) - which contains all instructions for what to do for this assignment.
- [Benchmarking Worksheet](https://docs.google.com/document/d/1nBTfQBIy1YrpR3_JnO3-ef3afEGemt3G/edit?usp=sharing&ouid=100283603951565118803&rtpof=true&sd=true) - which you will copy and complete for the benchmarking portion of the assignment.

<!--
## Exercise 1

The objectives of this exercise are to:

- Gain experience identifying running times of given code
- Use the formal definitions of big-Oh, big-Omega, and big-Theta
- See examples of what changes to function do/don't change their asymptotic behavior

Instructions for this exercise appear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).



## Exercise 2

The objectives of this exercise are to:

- Gain experience with solving recurrence relations using the tree method
- See examples of how different changes to recurrence relations do/don't change their asymptotic behavior

Instructions for this exercise appear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).


## Exercise 3

The objectives of this exercise are to:

- Understand the binary heap data structure by implementing it
- See how to modify the binary heap data structure to add new operations efficiently
- Apply the binary heap data structure to create a new data structure

This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission. 

For this exercise, you will need:

- [Starter Code](/files/exercises/ex3.zip) - which contains various classes that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/1SbbdYO2JoFF0dbpY7hD6ufnpCCRUhN6I/edit?usp=sharing&ouid=100283603951565118803&rtpof=true&sd=true) - which contains all instructions for what to do for this assignment.

## Exercise 4

The objectives of this exercise are to:

- Identify the relationships between binary search trees and AVL trees by implementing AVL trees as a subclass of binary search trees (and thereby inheriting methods whenever possible).
- Develop familiarity with the AVLTree data structure by implementing it. In particular: understanding what information needs to be maintained in order to preserve the structure property (height of subtrees differs by 0 or 1), using that information to correctly identify to perform rotation operations.
- Highlight the advantages of using an ordered dictionary data structure (like a binary search tree) by using one to implement a new data structure


This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission. 

For this exercise, you will need:

- [Starter Code](/files/exercises/ex4.zip) - which contains various classes that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/1KtUWudDpbsfZzelucVnVnGlsUzpQ4Z0_7vWeSMpPNiU/edit?usp=sharing) - which contains all instructions for what to do for this assignment.

## Exercise 5

The objectives of this exercise are: 

- Understand the mechanics of an efficient chaining hash table by implementing one of your own
- See how to write a good hash function for a new data structure
- Apply the advantages of a hash table by using it as part of an algorithm that involves a large number of inserts and finds of a large dictionary.


This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission. 

For this exercise, you will need:

- [Starter Code](/files/exercises/ex5.zip) - which contains various classes that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/11a4RJYJ2gCcA2xYayoMeKQWAJpGMLp5AhAjYJwxLAhA/edit?usp=sharing) - which contains all instructions for what to do for this assignment.

## Exercise 6

The objectives of this exercise are:

- Recognize the need for various sorting algorithm properties in applications in order to select the best-fit algorithm
- Demonstrate how to determine whether or not an algorithm possess the property of being a stable sort
- Apply the insights utilized from studying sorting algorithms to develop a new algorithm 

Instructions for this exercise appear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).

## Exercise 7

The objectives of this exercise are: 

- Interpret a non-graph problem into a graph problem
- Implement a graph using an adjacency list representation
- Adapt a standard graph algorithm (depth-first search) to solve a new problem

This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission. 

For this exercise, you will need:

- [Starter Code](/files/exercises/ex7.zip) - which contains various classes and testing files that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/1wHwMQourvr6EJmAGESCk_nCdth_Y_lyRZKijswEndjc/edit?usp=sharing) - which contains all instructions for what to do for this assignment.

## Exercise 8

The objectives of this exercise are:

- Identify graphs for which Dijkstra's algorithm gives a different answer from a BFS
- Show why Disjkstra's algorithm requires the assumption that no edge weights are negative
- Show that a reasonable idea for how to deal with negative edge weights does not correctly address the problem.

Instructions for this exercise apear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).

## Exercise 9

The objectives of thie exercise are:

- Use the Java ForkJoin framework to write a parallel implementation of dot product.
- Use the Java ForkJoin framework to write a parallel implementation of matrix multiplication.
- Use the Java ForkJoin framework to write a parallel implementation of a filter operation (which will filter out empty strings from a given array of strings).


This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission. 

For this exercise, you will need:

- [Starter Code](/files/exercises/ex9.zip) - which contains various classes and testing files that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/1eXkr40yGh7NaQxVTEJRIw_OFW8MKOS_k7X5I86BnuMo/edit?usp=sharing) - which contains all instructions for what to do for this assignment

## Exercise 10 

The objectives of this exercise are:

- Identify potential concurrency inssues in code
- Specify the circumstances where those occur
- Correct those errors

Instructions for this exercise appear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).


## Exercise 11

The objectives of thie exercise are:

- Implement a minimum-spanning-tree algorithm
- Use minimum spanning trees combined with breadth-first-search to solve a clustering problem

This is a programming exercise which you will submit to gradescope. There is no written component to this exercise, your code is your only submission.

For this exercise, you will need:

- [Starter Code](/files/exercises/ex11.zip) - which contains various classes and testing files that will be needed for this assignment.
- [Specification](https://docs.google.com/document/d/1_JcwNodKM59FZFTIcgfYK2w6GW5_mSyPPDtYi0wexvY/edit?usp=sharing) - which contains all instructions for what to do for this assignment.


## Exercise 12

The objectives of this exercise are:

- Articulate carefullly the definitions of P and NP
- Explore the relationships between complexity classes
- Express how reductions help to result the P=NP question.

Instructions for this exercise apear in Gradescope. To submit you will provide your answers there (either as a fill-in-the-blank or by uploading your work as an image or pdf).

-->

# Concept Checks

All concept checks will be submitted and graded on this [Gradescope for concept checks](https://www.gradescope.com/courses/1210525).

Concept checks are submitted on Gradescope. Each is autograded, with feedback provided instantaneously. You also have unlimited submissions. This means you can, and should, continuously reattempt each concept check until you receive full credit.

It will be a viable strategy to simply "guess and check" solutions until you receive full credit, but we recommend making earnest attempts at all concept checks to maximize their usefulness helping you to self-assess your understanding. If you are ever unsure why any answer is marked correct/incorrect, we encourage you to reach out on Ed, in office hours, or in section!

We do not intend for these to be time-consuming, but instead hope that they will result in a net savings of time since they will offer some confidence in your understanding of course materials before you're called upon to apply them in an exercise or exam.

<!--
	CC0 Getting to know you

    CC1 Running Time

    CC2 Heaps

    CC3 Recurrences

    CC4 AVL Trees

    CC5 Hash Tables

    CC6 Sorting

    CC8 Graph Definitions and Data Structures

    CC9 Graph Traversals

    CC10 Shortest Paths

    CC11 Fork Join

    CC12 Race Conditions and Mutual Exclusion

    CC13 Parallel Prefix

    CC14 Race Conditions and Mutual Exclusion

    CC15 Work, Span, and Ahmdal's law

    CC16 Deadlock

    CC17 Minimum Spanning Trees
-->


# Exams

The course staff will scann, upload and grade exams on this [Gradescope for exercises and exams](https://www.gradescope.com/courses/1208996).

## Exam 1

The Midterm Exam will be held on Wednesday February 11 during our normal lecture session.
<!--

Here are [sample solutions](files/cse332_midterm_au24_soln.pdf) for the midterm.


### Policies

In case you're the type who likes to read the instructions before walking in on exam day, here is the actual [exam cover page](files/cse332_midterm_au24_cover.pdf)!

1. Closed book, closed notes except for a 1-page 2-sided reference sheet of your own creation.
1. No calculators, cell phones, or other electronic devices allowed.
1. No writing after time is called, make sure you put your name on your paper first.
1. You will be provided a [reference sheet](files/midterm_reference.pdf) (tentative) during the exam.

### Content

The exam will cover all material from the beginning of the quarter up through AVL Trees. This includes:

- Abstract Data Types and Data structures:
	- Their Definitions and Differences
	- Examples
- Stacks and Queues:
	- Array and Linked List implementations and running times
	- ADT Operations
- Asymptotic Complexity:
	- Definition of big-oh, big-omega, big-theta
	- Identifying whether f(n) belongs to O(g(n)) (or big-omega, big-theta)
	- Finding constants c and n0 to demonstrate this
	- Identifying running times (best case and worst case) of example code
- Recurrence Relations:
	- Given a recurrence relation, solve it to closed form
- Priority Queues:
	- ADT operations (insert, findMin, deleteMin, increaseKey, decreaseKey, remove)
	- The Heap data structure (including the heap property, complete tree, and buildHeap)
- Trees:
	- Definitions of height, branching factor
	- Preorder, Inorder, Postorder traversals of binary trees
- Dictionaries:
	- ADT operations
	- Binary Search Trees: Definition, algorithms and running times of dictionary operations
	- AVL Trees: Definition, algorithms and running times of dictionary operations (including the definition of rotations and when to do them). The delete operation will NOT be covered.
- Hash Tables:
	- Principles of good hash function design
	- Insert/Delete/Find using these collision resolution strategies:
		- Separate Chaining
		- Linear Probing
		- Quadratic Probing
		- Double Hashing
	- Strengths and weaknesses of each collision resolution strategy
	- Load Factor, including how to calculate it and how it interacts with collision resolution
	- Rehashing


### Past Exams


Below I have several quarters' midterm exams. Be advised that the question style, length, difficulty, and content may differ among quarters. Most notably, prior quarters covered two data structures that have been omitted from the course this quarter - Tries and B-Trees. In lieue of those, the autumn 2024 exam will cover hash tables and hashing. Questions relating to hashing can be found within the sample final exams below.

~~In addition, approximately 1 week before the exam I will post one custom-created practice exam that accounts for the content differences compared to previous quarters. This exam will be constructed by selecting questions from among the past midterms and finals already provided on this page.~~

I have created a [sample midterm exam](files/cse332-frankenmidterm-24au.pdf) (with [solutions](files/cse332-frankenmidterm-24au-soln.pdf)) for your reference. This exam was generated by omitting some questions from the 24 summer midterm, and adding in hashing questions from the 24 summer final. 

Overall, here is how I would recommend that you use these sample exams to prepare. 

- First, study on your own without using any of the provided sample exams. To do this, review the exercises, lecture slides, and section materials. If there are things included in these that you find confusing or do not recall, seek clarification. This can be done by reviewing lecture recordings, talking with classmates, or attending office hours.
- Next, use the past exams below to evaluate your preparedness. Attempt some problems, then compare your answer against the solution provided. If they differ, try to diagnose whether your answer is equally valid, or else where you may have a misconception (you're welcome to come to office hours for help!). 
- Once you are confident with your ability to answer questions in the past exams, take the practice exam above as a simulation of the actual exam (so create your reference sheet and then set aside a 50 minute block of time to take the exam from start to finish). Then trade exams with a friend so that they can compare your solutions to the answer key and give you feedback.
- Use this feedback to decide where to review.

Past Exams:

- [CSE 332 24su Midterm](files/cse332-midterm-24su.pdf), [Solution](files/cse332-midterm-24su-soln.pdf) - Note, this exam was used to create the practice exam posted above, and so it is nearly identical.
- [CSE 332 23au Midterm](files/cse332-midterm-23au.pdf), [Solution](files/cse332-midterm-23au-soln.pdf)
- [CSE 332 23sp Midterm](files/cse332-midterm-23sp.pdf), [Solution](files/cse332-midterm-23sp-soln.pdf)
- [CSE 332 23wi Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-23wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-23wi-soln.pdf)
- [CSE 332 22su Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-22su.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-22su-soln.pdf)
- [CSE 332 19au Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-19au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-19au-soln.pdf)
- [CSE 332 19wi Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-19wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-19wi-soln.pdf)
- [CSE 332 18au Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-18au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-18au-soln.pdf)
- [CSE 332 18wi Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-18wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-18wi-soln.pdf)
- [CSE 332 17au Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-17au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-17au-soln.pdf)
- [CSE 332 16au Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-16au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-16au-soln.pdf)
- [CSE 332 15wi Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-15wi-A.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-15wi-A-soln.pdf)
- [CSE 332 14sp Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-14sp.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-14sp-soln.pdf)
- [CSE 332 13au Midterm](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-13au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-midterm-13au-soln.pdf)
-->

## Exam 2

The Final Exam will be held at 12:30pm-2:20pm on March 19. The location is TBD

<!--

### Policies

In case you're the type who likes to read the instructions before walking in on exam day, here is the actual [exam cover page](files/final_cover.pdf)!

1. Closed book, closed notes except for a 1-page 2-sided reference sheet of your own creation.
1. No calculators, cell phones, or other electronic devices allowed.
1. No writing after time is called, make sure you put your name on your paper first.
1. You will be provided a [reference sheet](files/cse332_final_wi24_reference.pdf) (tentative) during the exam.

### Content

The final exam will cover:

- Midterm exam material listed above.
- Sorting
	- Definitions, procedures, running times, and other properties of these algorithms:
		- Selection Sort
		- Insertion Sort
		- Heap Sort
		- Merge Sort
		- Quick Sort
		- Bucket Sort
		- Radix Sort
- Graphs
	- The definitions of the many terms presented in the graphs section, including: 
		- node/vertex
		- edge, edge weight
		- directed/undirected graph
		- (in/out) degree
		- complete graph
		- simple graph
		- path, simple path, and cycle
		- connected graph
		- DAG
		- tree
		- Any other definitions presented in the slides
	- Graph data structures (adjacency list, adjacency matrix) and the advantages and disadvantages of each.
	- Graph Traversals (breadth-first search and depth-first search)
	- Dijkstra's Algorithm
	- Prim's algorithm and Kruskal's Algorithm
	- Topological Sort
- Parallelism:
	- ForkJoin Parallelism
	- Efficiency analysis (including work, span, perfect linear speedup, and Amdahl's Law)
	- ForkJoin applications:
		- Reduce: Parallel sum, max, find, etc.
		- Map: vector addition, function application, etc.
	- Parallel Prefix Sum
	- Parallel Filter
- Concurrency
	- Race Conditions:
		- Data Races
		- Bad Interleavings
	- Code Synchronization:
		- Locks, reentrant locks
		- Java's Synchronized statement
		- Lock scheme granularity (coarse vs. fine)
		- Critical section size
		- Deadlock

Note: You will likely be asked to write java code using ForkJoin and/or threads. We will not require your syntax to be perfectly correct, but it should be correct enough that we can verify the code's would be correct if syntax issues were fixed. That is, we expect edge cases and other considerations of an algorithm to be correct, but don't necessarily expect all keywords or semicolons to be perfect.

### Past Exams

I have created a [sample final exam](files/cse332-frankenfinal-24au.pdf) (with [solutions](files/cse332-frankenfinal-24au-soln.pdf)) for your reference. This exam was generated by: 1) removing the section on hashing from 24 summer final (since that was midterm material this quarter), adding in the cumulative questions from the winter 2024 final, then adding couple more questions to pre-existing sections to compensate the length fro the removal of the hashing section (including a hashing question that was added to the cumulative section).

We have provided links to past exams below. Be advised that in other quarters the final exam has included P/NP content. Your final exam for this quarter will not include that material. Additionally, in previous quarters Hashing was not covered on the midterm, and so expect to have that material constitute a much smaller portion of your final compared to those below. I recommend that you mostly use these exams to evaluate your preparedness rather than as a study guide.


- [CSE332 24su](files/cse332_final_su24.pdf), [Solution](files/cse332_final_su24_soln.pdf)
- [CSE332 24wi](files/cse332_final_wi24.pdf), [Solution](files/cse332_final_wi24_soln.pdf)
- [CSE 332 23au](files/cse332-final-23au.pdf), [Solution](files/cse332-final-23au-soln.pdf)
- [CSE 332 23wi](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-23wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-23wi-soln.pdf)
- [CSE 332 19au](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-19au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-19au-soln.pdf)
- [CSE 332 19wi](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-19wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-19wi-soln.pdf)
- [CSE 332 18au](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-18au.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-18au-soln.pdf)
- [CSE 332 18wi](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-18wi.pdf), [Solution](https://courses.cs.washington.edu/courses/cse332/23sp/exams/oldExams/cse332-final-18wi-soln.pdf)
-->
