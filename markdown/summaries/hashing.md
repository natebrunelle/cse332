---
title: Topic Summary - Hash Tables
...

Hash tables are the second data structure we'll discuss for the dictionary ADT. With AVL trees we required that the keys are comparable, meaning we are able to perform > and < comparisons. We typically refer to a dictionary requiring this assumption as an *ordered dictionary*. Our hash tables will not require such an assumption, and therefore we call this type of dictionary an *unordered dictionary*.



# Big Array Dictionary Data Structure

The overall idea of a hash table is to build a dictionary data structure that behaves like one really big array, but in reality is a relatively small array. If we have no regard for the amount of memory we can use for our data structures, the following would be a dictionary data structure that could perform all dictionary operations in constant time.

We will store all of our key-value pairs in a an array. Because all computer data can be represented using 1s and 0s, and sequences of 1s and 0s can represent numbers, we can represent each key as a number. Our array will therefore have enough indices such that every possible key is an index in this array. Our dictionary operations can then be defined as follows:

- insert: Considering the given key as an index in the array, set the value at that index to be the one given. In code, this would be something like `arr[(int) key] = value`.
- find: Considering the given key as an index in the array, return the value found at that index. In code, `return arr[(int) key]`.
- delete: Considering the given key as an index in the array, set the value at that index to be null. In code, `arr[(int) key] = null`.

Now let's see exactly how big our array would need to be in order to implement this data structure. To do this, we'll assume that our keys and values both can be represented using one 64-bit word (the word size for most modern processors). This means that the length of our array will need to be $2^{64}$ indices of 64 bits each, or $64\cdot 2^{64}= 2^6\cdot 2^{64}=2^{70}$ bits, which $2^{67}$ bytes or 128 exabytes of storage.  To put this into perseptive, 1 exabyte in approximately the total amount of data that has been collected cumulatively by the Large Hadron Collider for its entire existance (as of 2025, so 17 years). Clearly, this is just too much to be reasonable.

The goal of a hash table is to mimic the behavior of this gigantic array, but have it use substantially less data. Hash tables will be similar to the big array data structure in the following ways:

- We will store key-value pairs in an array
- We will somehow convert keys into numbers to be used to select an index of the array

But importantly, here's how it will be different:

- The size of the big array depended on the number of *possible keys*, the size of the array in a hash table will depend on the number of keys *actually used*. 
- We will map keys to indices using something called a *hash function*, which should behave as if we're using the key to select an index of the array at random.
- The number of keys will be greater than the number of indices in the array, and therefore we may have multiple key-value pairs mapping to the same index (due to the pigeonhole principle), so we'll need to have a strategy to account for this.

# Hash Table 