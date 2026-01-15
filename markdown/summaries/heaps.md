---
title: Topic Summary - Priority Queues and Heaps
...

# Priority Queue ADT

In this section we introduced a new ADT called a *priority queue*. As a reminder, the queue ADT allows for insertion and removal where the only item that may be removed is the least frequently added (yielding the "first in first out" behavior). In this way, a queue operates like a checkout line at a store where each shopper joins the line behind the person who arrived before them so that the one who had been there the longest is the next to be served.

For a priority queue, instead of removing the least frequently added item, we will remove the most important item. We can think of this as a line where more important people are allowed to cut in front of less important people. For example, in an emergency room someone with an urgent need would see a doctor before someone with a less serious condition. In this case the urgency of the patient's condition would determine the order that we service those waiting.

With this motivation, here's how we'll define the priority queue ADT:

    - Notion: A collection of items along with their priority levels
    - Operations:
        - insert: adds a new element into the priority queue along with a given priority value
        - extract: deletes and returns the most important element according to its priority value
        - increaseKey: changes the priority value of the given element to make it larger
        - decreaseKey: changes the priority value of the given element to make it smaller

**Convention**: By convention for priority queues we understand the item with the *smallest* priority value to be the "most important", and it is therefore what gets returned by the extract operation. This comes from the idea that priorities are communicated as rankings in the English language, and so saying "you're my number one priority" is saying "you're the most important to me". We can also define priority queues so that the item with the largest priority value is the most important with only trivial changes. Because of this convention, though, all the examples below consider the smaller priority values more important.

## Priority Queues Using Lists

Next we can look at some examples of data structures for priority queues. With the queue ADT, we were able to effectively use list-like approaches for designing out data structures, so let's try that same thing here. This can give us to better understand the challenges of creating a priority queue data structure, and help us to see what we might need to do to improve upon some relatively more straight forward approaches.

### Unsorted Array Priority Queue
First, let's look at what we might do if we just store the elements (and priorities) in an unsorted array. In this case we might have a field that we could call *back* to indicate the index of the last item in the array. From here we could use the following algorithms for the priority queue ADT operations insert and extract:

- insert: add the item and its priority into the array at the index referenced by *back*, resizing if necessary. Then increment *back*.
- extract: iterating from index 0 of the array up through index *back*, save the index and priority of the item with the smallest priority seen so far. Return the corresponding item, and remove it from the array by shifting all elements after it over by 1 index.

Because we do not care to impose any kind of ordering of the elements in our array, our insert algorithm runs in constant time. However, because we have no indication for where we might find the item with smallest priority, the extract operation requires linear time.

### Sortest Array Priority Queue

Because priority queues require removing items in a sorted order, perhaps we could improve our data structure by requiring the items be stored in descending order (largest priority value at index 0, smallest at index $n-1$). In this data structure we will also have the field *back* that indicates the index of the last item in the array (in this case this will be the one with the smallest priority value). Here's what insert and extract might look like in this case:

- insert: starting from index 0, check to see if the new item has higher priority than the one at that current index, if not then check the next index, repeat until we reach an item with lower priority or until we reach *back*. Next insert the new item at the current index by shifting all items after that index over by one position. Increment back. Resize if necessary.
- extract: because we sorted in descending order, the index *back* has the minimum priority. Decrement the value of *back* and retun the value at the index *back*.

Because we need to keep our array sorted, we need to be very careful about where we add values into our array, and so the running time of insert is linear time. On the other hand, extract requires only constant time because we know exactly where the element with minimum priority might be. 

### Lessons

From these two examples it appears that there's a tradeoff in our data structure design: stricter ordering makes insert harder and extract easier, more relaxed ordering makes insert easier and extract harder. This provides the motivate for the binary heap data structure that we will soon introduce for priority queues. In a binary heap we will store our elements in an array, but they will be only *somewhat* ordered so that we can have sublinear running time for *both* insert and extract.

# Binary Heap Data Structure

In impelementation, our binary heap data structure will store elements in an array, but manipulate the positions of elements as if they were stored in a binary tree. In other words, it will be representing a tree using an array. To describe this data structure we will first describe it as a tree, then later describe how we represent the tree using an array.

## The Shape of the Tree

Binary heaps have *very* strict requirements on the shape of the tree that stores the elements. Specifically, it requires that:

- Every level of the tree be *completely full* before any items may be included on the next level
- If the last level is only partiallly full, the items *must* be filled in from left to right (so for example the left child of the left-most node of the second from last level must be the first to be filled in).
