---
title: Topic Summary - ADTs Stacks Queues
...

# Vocab Review

There are 4 new terms that we defined in this unit which we will be using throughout the course:

- Abstract Data Type (ADT)
- Data Structure
- Implementation (of a data structure)
- Algorithm

Let's start by looking at some examples of each, then we'll settle on a definition.

Examples of ADTs:

1. List
1. Set
1. Queue

For each ADT, here are some data structures that we discussed either in this course, or that you saw in a previous course:

1. List:
    - Array List
    - Linked List
1. Set:
    - Binary Search Tree
1. Queue:
    - Linked Nodes Queue
    - Circular Array Queue

From here, we can start making a distinction between the notion of an ADT and a data structure. For starters, an ADT is a more general idea. In particular, an ADT encapsulates how we would use a particular data type. 

For example, as experienced programmers we immediately understand some of the ways that we might interact with a list. We know lists may contain duplicate elements, that elements are maintained in some sequence, and that there are certian operations we can do on the list (e.g. add, remove, indexing).

For this class, **defining an ADT requires providing two things**:
1. The notion of what the ADT represents
1. The operations that are able to do with the data

We can then define ADTs for list, set, and queue as follows (note: the list of operations given is not intended to be exhaustive, but should just give an idea of what makes each ADT distinct from the others on this list):

1. List:
    - Notion: an ordered collection of elements
    - Operations:
        - add: inserts a new element at a given index
        - remove: deletes the element at a given index
        - indexing: returns the element at a given index
1. Set:
    - Notion: an unordered collection of distinct elements (i.e. no duplicates allowed)
    - Operations:
        - add: inserts the given element if not already present
        - remove: deletes the given element
1. Queue:
    - Notion: a collection of elements in which we can only access/remove the element which has been in the collection the longest. In other words, we can only access items in first-in-first-out (FIFO) order.
    - Operations:
        - enqueue: inserts the given element into the queue
        - dequeue: removes the oldest element from the queue
        - peek: returns the oldest element in the queue

**A data structure is a strategy for satisfying an ADT.** For each of our data structures we will describe how we will represent the contents, and we will describe the algorithms we will use for each operation. The algorithms we design for each operation should correctly update the representation to match the behavior outlined in the ADT.

For example: 
- A linked list data structure stores its elements in node objects, then maintains the sequence of elements by adding a reference from each node to the next one in sequence. 
- An array list data structure stores its elements in an array. The sequence is maintained by the order of storage in the array itself. Because the add operation's functionality does not depend on the size of the list, we will copy elements into a larger array if we ever need to add an element when the array is full.

Between lists and queues we have seen two different designs for data structure design:
1. Linked Nodes - Data is stored in node objects, each of which has a reference to another node object
    - List: the linked lists data structure
    - Queue: the linked nodes queue data structure
1. Resizing Array - Data is stored in an array, where contents must be copied into a new larger array if it ever becomes full
    - List: the array list data structure
    - Queue: the circular array data structure

<blockquote style="background-color:#FFD700; font-size:100%">Challenge Question: Which of these two designs does a binary search tree most resemble? Can you think of a way to represent trees that resembles the other design?</blockquote>

The final vocabulary term we presented was an **implementation of a data structure**, which is specifically **computer code which puts a data structure into effect**.

# Review of Queue Data Structures

We'll now provide an illustration of each of the queue data structures presented in class. In exercise 0 you will build stacks which behave similarly to the queue data structures.

## Linked Nodes Queue


Below we have some slides stepping through the behavior of the enqueue and dequeue algorithms for a linked nodes queue. You may download the source pptx by clicking [this link](files/linked_nodes_queue.pptx).

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vRvO7uNIbHZCXEmIe4PvTCN_jpe2g6kwjXVN3x71tCIPec1FOzo2SVEACWvxbG3YQ/pubembed?start=false&loop=false&delayms=3000" frameborder="0" width="500" height="294" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" title="An embedding of the slide deck linked to above"></iframe>

## Circular Array Queue

Below we have some slides stepping through the behavior of the enqueue and dequeue algorithms for a circular array queue. You may download the source pptx by clicking [this link](files/circular_array_queue.pptx). Note that this does not demonstrate resizing, as this is a challenge we've reserved for exercise 0.

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQT_ZBGJSmRZYFv3vQQg7H_GB8POpZkFF8oL8TdZhd6t3CbcJdcD10R8Qf8JAUwwA/pubembed?start=false&loop=false&delayms=3000" frameborder="0" width="500" height="294" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" title="An embedding of the slide deck linked to above"></iframe>