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

From these two examples it appears that there's a tradeoff in our data structure design: stricter ordering makes insert harder and extract easier, more relaxed ordering makes insert easier and extract harder. This provides the motivate for the binary heap data structure that we will soon introduce for priority queues. In a binary heap we will store our elements in an array, but they will be only *somewhat* ordered so that we can have sublinear running time for *both* insert and extract. Specifically, we will achieve running times of $\Theta(\log n)$ for both insert and extract.

# Binary Heap Data Structure

In impelementation, our binary heap data structure will store elements in an array, but manipulate the positions of elements as if they were stored in a binary tree. In other words, it will be representing a tree using an array. To describe this data structure we will first describe it as a tree, then later describe how we represent the tree using an array.

## The Shape of the Tree

Binary heaps have *very* strict requirements on the structure of the tree that stores the elements. Specifically, the *structure property* of a heap requires:

- Every level of the tree be *completely full* before any items may be included on the next level
- If the last level is only partially full, the items *must* be filled in from left to right (so for example the left child of the left-most node of the second from last level must be the first to be filled in).

There are two motives for this:

1. This shape will help us to achieve the $\Theta(\log n)$ worst case running times for insert and extract
1. This shape will help us to represent the tree using an array

To help understand the requirements, here are a few *valid* tree shapes:

TODO!

Here are a few trees that are *not* a valid shape:

TODO!

## Somewhat Ordering the Array

In addition to requiring a particular shape to the tree, heaps also require restrictions on where certain values may appear. For a min heap (i.e. one where the most important element has the lowest priority value) the following property must be true of every node in the tree:

**Min Heap Property**: For every node in the tree, the priority value of that node must be less than or equal to that of its children.

This heap property ensures that for every node, the priority of the value held there is the smallest of all nodes in its subtree. This is because if there was any node within a subtree with a smaller priority value then that node or one of its ancestors must violate the heap property with its parent. Since this applies to all nodes, that implies that the overall root of the heap *must* contain the element with the smallest priority. Therefore this heap property gives us one of the advantages of a sorted array in that we know exactly where to find the most important item.

The heap property also doesn't require our array to be *too* sorted. Note that the heap property only enforces a priority relationship between a node and any values in its subtree. It does not have any restrictions on how a node's priority value might relate to those of nodes in different branches of the tree (e.g. "cousin" nodes or "aunt/uncle" nodes). The result here will be that it does not require too much effort to maintain the heap property when adding/removing items from the heap (at least, it requires much less effort than maintaining a total ordering). Namely, since the heap property can be checked by just checking how parents relat to children, the heap property ensures that we need to do only a constant number of operations per level of the tree to restore the heap property after any insert/extract operation. The shape property then guarantees that the tree will not have many levels. The combination of these two rules therefore enables our fast ($\Theta(\log n)$) running time for each operation.

## The Tree Representation Using an Array

Now let's discuss  how we can represent our heap using an array. When you learned about binary trees in your prerequisite course, you likely used nodes where each stored the value it contains  and then had a reference to two other nodes representing its left and right children. For heaps we will store our values in an array, and then identify a node's left and right children by doing arithmetic on array indices.

To represent our heap as an array we will leverage the heap structure property. The structure property is so strict that all trees of the same size *must* have the same shape. This is because there is a unique position that must be added to accommodate that new node. To represent our tree using an array, we will designate that the position added when adding the $i$th node will be stored at index $i$. In summary, we can identify each node's index by "counting off" one level at a time, and then left-to-right within a level. The structure property insures that this assignment will never skip nodes and will never skip array indices. We will always start the "counting off" from the root. We could decide to start that count with the number $0$ (thereby putting the root at index $0$ of the array), however the arithmetic we'll need to apply to the array indices in order to navigate the tree is a bit easier if we start of with $1$ instead (thereyby not using index $0$ of the array at all).

Here's an example of how we can store a heap using an array:

TODO

For a node at index $i$, here's how we can calculate the index of the following other nodes in relation to $i$:

- Its left child: $2i$
- Its right child: $2i+1$
- Its parent $$\lfloor \frac{i}{2}\rfloor$$
- Its left sibling: $i-1$ (this requires that $i$ is itself a right child)
- Its right sibling: $i+1$ (this requires that $i$ is itself a left child)


## Insert and Extract Algorithms

Since we've fully described how we're representing our data, let's discuss our algorithms for the priority queue ADT operations. 

### Insert

When inserting an element, the structure property of heaps designates a unique position that must be created in the heap. Namely, if the last level of the heap is not full then after adding a new item the new position must be the leftmost available slot of that last level. If the last level of the heap is full, then the new position must be the leftmost on the next level.

While the structure property designates a specific new position, we cannot necessarily just put the new item there. The heap property requires each node's priority be less than or equal to its children. It could be that the newly-added item has a priority smaller than the parent of the new position we were required to create. In this case, we must rearrange values of the heap in order to maintain the heap property.

The idea of our algorithm is as follows:
1. Place the new item at the position dictated by the structure property
1. Compare that item's priority with that of it's parent. If the new item has a lower priority than its parent then swap the new item's position with that of its parent.
1. Repeat the previous step (comare the new item with its parent, swap less than) until either the new item's priority value is greater than or equal to its parent, or the new item becomes the new root.

Keeping in mind that the tree itself is represented using an array, this results in the following near-Java code:

```
public void insert(T item){
    if(this.size() == arr.length){
        resize();  // replace with a larger array, copy over the contents
    }
    arr[size+1] = item; // we're 1-indexing so we need to use size+1
    size++;
    int currIndex = size; // tindex currently holding the new item
    while(currIndex//2 > 0 && arr[currIndex].priority < arr[currIndex//2]){ // until the new item is either the root or its priority is larger than its parent's
        T oldParent = arr[currIndex//2]; // save the parent
        arr[currIndex//2]= arr[currIndex]; // move item to the parent's position
        arr[currIndex] = oldParent; // move the parent to item's former position
        currIndex = currIndex // 2; // update the index of item
    }
}
```

### Extract

When extracting, the priority queue ADT requires that the item in the root of the heap be the one removed. However, the structure property of the heap requires that the position that be removed from the tree is the right-most node on the bottom-most level. In order to reconcile this, we will take a similar approach to what we saw with insert -- we will first make a change to satisfy the structure property, and then we'll rearrange values to satisfy the heap property. So what we'll the take the right-most item of the last level (i.e. the item in the position that must be eliminated), move that to become the new root (eliminating the item at the root, so that the tree contains all the correct elements), and then swap the item we just moved with its children until we've restored the heap property. 

Here are the overall steps:

1. Save the value of the current root
2. Move the item in the last index of the array to index 1 (overwriting and taking the place of the old root)
3. Compare the new roots priority with that of its children. If any child has a smaller priority than the parent, swap the parent with the smaller child.
4. Repeat the previous step (if smaller than either child, swap with smaller child) until either the value we're moving is smaller than both of its children, or until it becomes a leaf in the tree.


### Percolate Up and Down


### Running time analysis

### Increase/Decrease Key

# Floyd's Build Heap Method

