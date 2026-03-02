---
title: Topic Summary - Hash Tables
...

Hash tables are the second data structure we'll discuss for the dictionary ADT. With AVL trees we required that the keys are comparable, meaning we are able to perform > and < comparisons. We typically refer to a dictionary requiring this assumption as an *ordered dictionary*. Our hash tables will not require such an assumption, and therefore we call this type of dictionary an *unordered dictionary*.



# Big Array Dictionary Data Structure

The overall idea of a hash table is to build a dictionary data structure that behaves like one really big array, but in reality is a relatively small array. If we have no regard for the amount of memory we can use for our data structures, the following would be a dictionary data structure that could perform all dictionary operations in constant time.

We will store all of our key-value pairs in a an array. Because all computer data can be represented using 1s and 0s, and sequences of 1s and 0s can represent numbers, we can represent each key as a number. Our array will therefore have enough indices such that every possible key is an index in this array. Our dictionary operations can then be defined as follows:

- insert: Considering the given key as an index in the array, set the value at that index to be the one given. In code, this would be something like `arr[(int) key] = (key,value)`.
- find: Considering the given key as an index in the array, return the value found at that index. In code, `return arr[(int) key].value`.
- delete: Considering the given key as an index in the array, set the value at that index to be null. In code, `arr[(int) key] = null`.

Now let's see exactly how big our array would need to be in order to implement this data structure. To do this, we'll assume that our keys and values both can be represented using one 64-bit word (the word size for most modern processors). This means that the length of our array will need to be $2^{64}$ indices of 64 bits each, or $64\cdot 2^{64}= 2^6\cdot 2^{64}=2^{70}$ bits, which $2^{67}$ bytes or 128 exabytes of storage.  To put this into perseptive, 1 exabyte in approximately the total amount of data that has been collected cumulatively by the Large Hadron Collider for its entire existance (as of 2025, so 17 years). Clearly, this is just too much to be reasonable.

The goal of a hash table is to mimic the behavior of this gigantic array, but have it use substantially less data. Hash tables will be similar to the big array data structure in the following ways:

- We will store key-value pairs in an array
- We will somehow convert keys into numbers to be used to select an index of the array

But importantly, here's how it will be different:

- The size of the big array depended on the number of *possible keys*, the size of the array in a hash table will depend on the number of keys *actually used*. 
- We will map keys to integers using something called a *hash function*, which should behave as if we're using the key to select an integer at random.
- The integer we map to may not necessarily be a valid index of the array, so we will mod the selected integer by the array's length to obtain an index.
- The number of keys will be greater than the number of indices in the array, and therefore we may have multiple key-value pairs mapping to the same index (due to the pigeonhole principle), so we'll need to have a strategy to account for this.

# Hash Table Ideal

At this point, we'll discuss the overall idea for how a hash table will work. There are still plenty of details that we'll need to fill in, but it will be helpful to see the most basic intention for their behavior as a starting point. For this basic overview, we will ignore the possibility of collisions (multiple keys using the same index) in order to show the "ideal" behavior. All of these operations will need to change once we being accounting for collisions.

A hash table will store key-value pairs in an array. It assumes that we have a hash function, which serves to map keys to an integer. The dictionary operations will behave as follows:

- insert: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index, set the value at that index to be the one given. In code, this would be something like `arr[hash(key)$arr.length] = (key,value)`. If the size of the hash table reaches a fixed ratio with the length of the array, resize the array, and re-insert all key-value pairs.
- find: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index, return the value found at that index. In code, `return arr[hash(key)%arr.length]`.
- delete: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index, set the value at that index to be null. In code, `arr[hash(key)%arr.length] = null`.

This should hopefully appear to you to be quite similar to the opertions for the big array data structure, with the main changes being:

- We use the hash function to pick a number and then modulus to pick an index for our hash tables (as opposed to somehow directly using the key itself as an index). 
- We will occasionally need to resize the array as we add more key-value pairs. This is because the changes of a collision will go up as more indices of the array are occupied, and so we will resize to keep that probability low.

These small differences are incredibly important. In the big array we always need one index per potential key, regardless of how many keys we actually used. For hash tables we can accommodate any length of the array. The result is that we can use the number of keys *actually present* in the hash table to select whatever array length gives the best tradeoff for running time vs. memory usage.

# Designing Hash Functions

Whenever our hash table's behavior matches the "ideal" above, our performance should match that of the big array. That is, if we never have collisions then all operations run in constant time. For this reason, we must take care when designing our hash functions so that they minimize how frequently we have collisions. Remember, it is impossible for us to prevent collisions entirely (because the whole goal is to have fewer indices than keys), but we can take action to make collisions as unlikely as possible.

Because we're not going to know exactly what keys we might see when designing our hash function, the safest way to design our hash function to minimize the number of collisions is to make it look like `hash(key)%arr.length` selects an index of our array completely at random. We cannot literally select a random index, though, because we need to make sure we always select the same index for every key. Wwhen we insert a key-value pair at some index, we need to make sure look at the same index to find it later. If we simply use `Math.Random` to select an index, then the next time we need an index for the same key we will get a different random value.

With all of this in mind, we want a hash function to have all of the following properties:

- **Consistent**: Equal keys should hash to the same integer
    - To be consistent, it must also be deterministic
- **Uniform**: Should use every index of a fixed-sized array, and use each index at a roughly equal rate
- **Effective**: It should behave as if the selection of an integer was random. This can be achieved by satisfyig all of:
    - It is hard to find two unequal keys which hash to the same integer
    - Given a key, it is hard to find another unequal key which hashes to the same integer
    - The "avalanche effect": making even a small change to a key results in an arbitrary change to the integer it hashes to
- **Efficient**: The hash function itself should not take much time to run

## Good and Bad Examples

Let's look at some examples of potential hash functions for strings, and discuss which of these properties they do/do not have. We will assume that each string $s$ has $n$ characters, where $s_i$ is the ascii encoding of the $i$th character in the string.

To be a "good" hash function, the function must satisfy *all* of the properties above.

> **Option 0**: Use a random character
>
> For this hash function, we will use $h_0(s)=s_{random.nextInt(n)}$.
>
> - **Consistent?**: No! If we run the hash function twice we may get a different result each time. For example, the first time we run $h(\text{"silent"})$ we might randomly select the index $0$, and so the output would be $115$ (the ascii encoding of the character "s"). The next time we run it we may randomly select the index $3$, and so the output would be $101$ (the ascii encoding of the character "e"). Because running the hash function twice on the same key gave different results, it is not consistent. 
> - **Uniform?**: No! Some characters are more common than others, so we're more likely to hash to the ascii values of more common characters.
> - **Effective?**: No! All strings that are just the same character repeated multiple times will be different, but always hash to the same value. For example, the strings "a", "aa", and "aaaaaa" always hash to the same value, even though they are different strings. It's easy to find more examples (e.g. "b" with "bbbbb", etc.).
> - **Efficient?**: Yes! this will be a very fast operation.

> **Option 1**: Use the first character
>
> For this hash function, we will use $h_1(s)=s_i$.
>
> - **Consistent?**: Yes! If we apply the hash function to the same string over and over again, we will always get the same result
> - **Uniform?**: No! Some characters are more common than others, so we're more likely to hash to the ascii values of more common characters.
> - **Effective?**: No! Any two strings which start with the same character will hash to the same value. For example, the string "banana" hashes to the same value as the string "bagel".
> - **Efficient?**:  Yes! this will be a very fast operation.

> **Option 2**: Sum the characters
>
> For this hash function, we will use $h_2(s)=\sum_{i=0}^{n-1} s_i$.
>
> - **Consistent?**: Yes! If we apply the hash function to the same string over and over again, we will always get the same result
> - **Uniform?**: Probably not. This one is harder to see, but words formed by different combinations of common letter are more likely to appear.
> - **Effective?**: No! Any two strings which contain the same characters (i.e. anagrams) will hash to the same value. For example, the string "silent" hashes to the same value as the string "listen".
> - **Efficient?**: Yes! this will be a very fast operation.

> **Option 3**: Sum the characters multiplied by a power of a prime number
>
> For this hash function, we will use $h_3(s)=\sum_{i=0}^{n-1} s_i \cdot 31^i$.
>
> - **Consistent?**: Yes! If we apply the hash function to the same string over and over again, we will always get the same result
> - **Uniform?**: Yes! As long as the array's length is not exactly 31, we will use all indices, and in equal proportion.
> - **Effective?**: Yes! Changing any character at any index will change the value we hash to in an unpredictable way.
> - **Efficient?**: Yes! This is actually pretty efficient. It may not seem so at first due to the exponentiation of $31$, but this could be computed efficiently by repeatedly doing `sum = (sum+s[i])*31` for each character in the string.  

> **Option 4**: Sum the characters multiplied by a power of a prime number, double the result
>
> For this hash function, we will use $h_4(s)=2\cdot h_3(s)$.
>
> - **Consistent?**: Yes! For the same reason option 3 is.
> - **Uniform?**:  No! we never use odd indices.
> - **Effective?**: Yes! For the same reason option 3 is.
> - **Efficient?**: Yes! For the same reason option 3 is.

> **Option 5**: First alphabetize the characters, then apply option 3.
>
> For this hash function, we will sort the string by character, for example, the string "banana" would become "aaabnn", then we apply $h(3)$ to that.
>
> - **Consistent?**: Yes! For the same reason option 3 is.
> - **Uniform?**:  Yes! For the same reason option 3 is.
> - **Effective?**: No! Any two strings which contain the same characters (i.e. anagrams) will hash to the same value. For example, the string "silent" hashes to the same value as the string "listen".
> - **Efficient?**: Yes! For the same reason option 3 is.

## Design Considerations

When designing your hash functions, here are some things to keep in mind.

- To be consistent, you should never use aspects of your keys which are not relevant for determining equivalence. Because we need equal keys to give the same result, any aspect (e.g. field) of your key object which is not used in a `.equals` method should not be used in the hash function. Otherwise, this means we can make a change to the object which does not make it different according to `.equals`, but causes it to hash to a different value
- To be effective, you should use *all* aspects of the keys which *are* relevant for determining equivalence. If you exclude some aspect of your key which is used in a `.equals` method, then we can make a change to that aspect to change the key without changing the value that is hashes to.
- Use prime numbers. Because of number theoretic properties that we won't get into, prime numbers result in better uniformity of the values that we hash to.

# Collision Resolution

While a good has function will minimize the odds of a collision (i.e. two different keys mapping to the same index after applying the hash function), we will never be able to avoid collisions completely (unless we're using exabytes of data, I suppose). For this reason, we *must* have some strategy for resolving collisions. In general, there are two major approaches to this: Separate Chaining and Open Addressing.

## Separate Chaining

A separate chaining hash table accounts for collisions by using an array of linked lists rather than an array of key-value pairs. The idea is that instead of storing just one key-value pair at each index, it will store a list of key-value pairs at each index. This way if multiple keys map to the same index we can just store all of those keys at this index.

The operations for a separate chaining hash table would be as follows: 

- insert: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index. If the linked list at that index contains the key already, update the value. Otherwise, add the key-value pair to the linked list. If the size of the hash table reaches a fixed ratio with the length of the array, resize the array, and re-insert all key-value pairs.
- find: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index. Check for the key in the linked list at that index, and return the corresponding value if present.
- delete: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index, remove the key-value pair from the linked list at that index.

### Why Linked Lists?

We use a linked list data structure at each index of the array. Each of these linked list data structures is actually being used as if it were a dictionary data structure because the hash table insert involves an insert operation on the linked list, hash table find involves a find operation on the linked list, and hash table delete involves a delete operation on the linked list. In general, we could use any dictionary data structure at each index of the separate-chaining hash table (array list, binary search tree, AVL tree, another hash table etc.), so why a linked list? Recall that The goal of using a good hash function and occasionally resizing the array is to make collisions rare. This means that a linked list makes the most sense because:


- Very often our per-index data structures will be empty, so we want a data structure that does not use much excess space (this excludes array-based data structures like array lists or hash tables)
- When not empty, our per-index data structure should never contain a large number of elements, so we do not care about the asymptotic running time (so AVL trees or other complex but asymptotically efficient data structures are not helpful)

In summary, linked lists have the best combination of being memory efficient and time efficient for empty or small dictionaries, making them the best choice.


## Open Addressing

An open addressing hash table (also known as a probing hash table) stores key-value pairs directly in an array of key-value pairs, and accounts for collisions by using a strategy called "probing" to find an alternative index to store a key-value pair whenever the mapped-to index is occupied. To probe simply means to check sequence of alternative indices

The operations for an open-addressing hash table would work as follows: 

- insert: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index. If the hashed-to index is empty, put the key-value pair at that index. If the hashed-to index contains that key, update the value. If the index contains a key-value pair with a different key then begin probing to check alternative indices. For each index while probing:
    - If the index contains the given key, update the value and end the probe
    - If the index is empty, add the given key-value pair at that index and end the probe
    - Otherwise continue probing
- find: Use the hash function to map the key to an integer, mod that integer by the length of the array to get an index. If the hashed-to index contains the given key, return the value. If the index is empty, the key was not present. If the index contains a key-value pair with a different key then begin probing to check alternative indices. For each index while probing:
    - If the index contains the given key, return the value and end the probe
    - If the index is empty, the key was not present, end the probe
    - Otherwise continue probing
- delete: This one is a bit complicated, we'll discuss it below.

### Probing Patterns

A probing pattern refers to which sequence of indices to pick as the alternative. We get different performance behaviors for different choices of probing pattern.

#### Linear Probing

Linear probing is the simplest probing pattern. Suppose that we want to do a find/insert/delete operation for a given key `k`, and so we compute `h(k) % arr.length` to be index `i`. As long as we see collisions, we will follow the pattern: `i`, `i+1`, `i+2`, etc. This means that the $j$th index we check in the probe sequence is index `i`+$j$. In other words, we just check the very next index in the arr as we continue probing.

#### Quadratic Probing

Suppose that we want to do a find/insert/delete operation for a given key `k`, and so we compute `h(k) % arr.length` to be index `i`. As long as we see collisions, we will follow the pattern: `i`, `i+1*1`, `i+2*2`, `i+3*3`, `i+4*4`, etc.  This means that the $j$th index we check in the probe sequence is index `i`+$j^2$.

# Running Time Analysis

## Load Factor

## Rehashing

# Advice