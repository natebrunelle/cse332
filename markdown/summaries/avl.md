---
title: Topic Summary - AVL Trees
...

# Dictionary ADT

In this section we introduced a new ADT called a **dictionary**. A dictionary should hold a collection of key-value pairs. The idea is that keys are used to refer to values in this collection similar to how variables refer to values in a program. In the dictionary we can use a key to obtain its associated value, update a key so that it is associated with a new value. Depending on the programming language this ADT may have a different name. In python it's referred to as a dictionary, in Java it's called a map, in php it's called an associative array, and in JavaScript it's simply called an "Object".


Here's how we'll define the dictionary ADT:

- Notion: A collection of key-value pairs
- Operations:
    - insert: Given a key-value pair, if there is already a key-value pair corresponding to the given key, update the dictionary so that the key is associated with the given value. Otherwise add the new given key-value pair.
    - find: Given a key, return the value it is already associated with, if there is one. If there is no key-value pair for that key then return a default value (e.g. null).
    - delete: given a key, remove that key-value pair from the collection.

For our first dictionary data structure we will assume that keys can be compared. That is, there is some way that we can compare two keys to determine which is "larger". For example, in Java we would need the type of the keys to implement the Comparable interface so that we could use the compareTo method to determine which is larger. Our next dictionary data structure will not have this requirement.

## Dictionaries Using Lists

Similar to what we saw with priority queues, we can first explore how we might attempt to design a data structure for the dictionary ADT using a form of sequential storage like an array or a chain of linked nodes (like a linked list).

Suppose we plan to store all of our key-value pairs in an **ordered array**. When doing this, we may have the following algorithms for the ADT operations:

- insert: Perform a binary search for the given key. If it is present then update the value. Otherwise insert the key at the appropriate index. The binary search can be done in $\Theta(\log n)$ time, but adding a new key-value pair may require $\Theta(n)$ time in the worst case to shift all the element in the array to make room.
- find: Perform a binary search for the given key. If it is found then return it, otherwise return the default value. This requires $\Theta(\log n)$ time in the worst case.
- delete: Perform a binary search for the given key. If it is found the remove the key-value pair from the array by shifting all elements to overwrite it. This requires $\Theta(n)$ time in the worst case.

Suppose we instead use an **unordered array**:

- insert: Do a lineary search through the array for the given key. If it is present the update its value. Otherwise add the new key-value pair at the end of the array. This requires $\Theta(n)$ time  in the worst case. because of the need to search for if the key is already present.
- find: Do a linear search through the array for the given key. If found return its value, otherwise return the default value. This requires $\Theta(n)$ time  in the worst case.
- delete: Do a linear search through the array for the given key. If it is found the remove the key-value pair from the array by shifting all elements to overwrite it. This requires $\Theta(n)$ time in the worst case.

Suppose we use **ordered linked nodes**:

- insert: Do a linear search through the array for the given key. If you come across the key then update its value. If you come across a key larger than the key then add a new node before it for the new key-value pair. If you come to the end of the chain then add the new key-value pair to the end (it must be the largest key). This requires $\Theta(n)$ time in the worst case.
- find: Do a linear search through the array for the given key. If you come across the key then return its value. If you come across a key larger than the key or you come to the end of the chain then return the default value. This requires $\Theta(n)$ time in the worst case.
- delete: Do a linear search through the array for the given key. If you come across the key then remove that node. If you come across a key larger than the key or you come to the end of the chain then the key was not present so return without making a change. This requires $\Theta(n)$ time in the worst case.

Finally, suppose we use **unordered linked nodes**:

- insert: Do a linear search through the array for the given key. If you come across the key then update its value. If you come to the end of the chain then add the new key-value pair to the end. This requies $\Theta(n)$ time in the worst case.
- find: Do a linear search through the array for the given key. If you come across the key then return its value. If you come to the end of the chain then return the default value. This requires $\Theta(n)$ time in the worst case.
- delete: Do a linear search through the array for the given key. If you come across the key then remove that node. If you come to the end of the chain then the key was not present so return without making a change. This requires $\Theta(n)$ time in the worst case.

Notice that all of the approaches above require $\Theta(n)$ time for all operations, with the exception of the find operation for an ordered array which requires $\Theta(\log n)$ time. 

## Dictionaries Using a Heap

Since we now know of this nifty new heap data structure for priority queues, let's consider whether we can apply it as a dictionary data structure as well. We'll suppose we're using a min heap, but we could make a parallel argument for max heaps.

The first thing to note is that the running times of insert and delete must be *at least* that of find. This is because both of insert and delete have different behavior depending on whether or not the given key is already present, and so they must do a find somewhere as a subroutine. For this reason, we will first consider the find operation for heaps.

At first, heaps may seem promising as a dictionar data structure. If the key we want to find is $\leq$ the smallest key used so far, then we can do our insert in $\Theta(\log n)$ time (constant if it is equal to the smallest key, logarithmic if we need to insert a new node that will become the root). Let's consider, though, what happens if we want to do an insert operation where the key is $\geq$ the largest key currently present. The heap property guarantees every node is smaller than (or equal to) its children. This property allows for the largest item to appear as *any* leaf in the tree. Since there are $\frac{n}{2}$ leaves in a heap, our find algoritm must check at least $\frac{n}{2}$ locations to ensure the key is not already present. This means our worst case running time for find must be $\Omega(n)$, and so heaps do no better than any of the list-based options above.

## Dictionaries Using Binary Search Trees

We saw above that efficient finds are a prerequisite for efficient inserts and deletes, and that ordering (in our sorted array) helped to make find more efficient. Next let's consider a data structure that maintains ordering to help keep finds efficient, but potentially addresses the challenge of sorted arrays (the need to shift elements when inserting/deleting). For this we'll use a **binary search tree*. The binary search tree should make find efficient because we will only need to explore one branch per node. Because we represent the tree using linked nodes, it should also make inserting/deleting a node more efficient since this largely involves updating references rather that shifting around contents.

So first, let's look at what a find algorithm would look like:

1. If the current node is null then the key does not exist in the dictionary, so return the default value.
1. If the key is equal to the current node, return the associated value.
1. If the key is less than the current node, return the result of recursively searching the left subtree
1. Otherwise the key is greater than the current node, return the result of recursively searching on the right subtree

We could then define an insert algorithm as follows:

1. If the current node is null then the key does not exist in the dictionary, so create a new node with the given key-value pair at the current location.
1. If the key is equal to the current node, update the associated value.
1. If the key is less than the current node, recursively insert the key-value pair into the left subtree
1. Otherwise the key is greater than the current node, recursively insert the key-value pair into the right subtree

Notice that since we only create new nodes when we reach an empty location of the tree, every new node will be a leaf. 

Finally we could define a delete algorithm as follows:

1. If the current node is null then the key does not exist in the dictionary, return without making any changes.
1. If the key is equal to the current node then delete the current node.:
    1. If the current node is a leaf then set its parent reference to null
    1. If the current node has one child then set its parent reference to its child
    1. If the current node has two children then first delete the largest (i.e. right-most) key from the left subtree, then update the current node's key-value pair to become the key-value pair just deleted. (Note that because the largest key from the left subtree must not have a right child it either has 0 or 1 child, and so we can use one of the first two cases above to delete that node.)
1. If the key is less than the current node, recursively delete the key-value pair from the left subtree
1. Otherwise the key is greater than the current node, recursively delete the key-value pair from the right subtree


For each of the algorithms, we must do only a constant number of operations per level of the tree. This means that the running time should be linear in terms of the tree's height. The problem is, in the worst case the height of the tree might be linear in the number of nodes. Overall, this means our worst-case running time is $\Theta(n)$ just like all of the other data structure options above.

That being said, just a minor modification of binary search trees will allow us to achive $\Theta(\log n)$ running times for all operations. Since the binary search tree operations are all linear in the tree's height, if can modify our insert and delete algorithms in order to *guarantee* that the height of the tree is logarithmic in its size, then suddenly all running times will be $\Theta(\log n)$.
