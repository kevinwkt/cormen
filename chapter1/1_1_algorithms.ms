.TL
1.1 Algorithms
.AU
Kevin Woo
.AI
Desperate college kid wanting to understand shit.

.SH
What are algorithms?
.LP
Algorithm is any 
.B well-defined
computational procedure that takes some value, or set of values as 
.B input
and produces some values or a set of values, as
.B output.

.SH
Example algorithm:

.LP
*Sorting Problem*

.B Input:
A sequence of
.I n
numbers
.I "<a1, a2, a3, ..., a4>."

.B Output:
A permutation (reordering)
.I "<a'1, a'2, ..., a'n>"
of the input sequence such that 
.I "<a'1 <= a'2 <= ... <= a'n>."

.SH
Correctness of an algorithm
.LP
It is very simple to see if an algorithm is said to be correct.
.B "A correct algorithm, for every input instance, halts with the correct output."
There are examples of algorithms with a controllable error rate especially when finding prime numbers.

.SH
TLDR; Algorithms solve a lot of problems.

.SH
Exercises

.LP
.B "1.1-1 Give a real-world example that requires sorting or a real-world example that requires computing a convex hull."
For Google I had to use a topological sort in order to show a dependency graph given a DAG of a scheduling event.
An example of a convex hull could be used in image processing and detection.

.B "1.1-2 Other than speed, what other measures of efficiency might one use in a real-world setting?"
Memory is also an efficiency that is widely used in a real-world setting.

.B "1.1-3 Select a data structure that you have seen previously, and discuss its strengths and limitations."
A vector is used widely in C++. It's limitation is when you want to insert and delete elements within the vector. It would take O(n).

.B "1.1-4 How are the shortest-path and traveling-salesman problems given above similar? How are they different?"
Shortest path and traveling-salesman are different in the sense that Shortest-path is P since it can be solved in polynomial time but traveling-salesman is an NP. However, they are similiar in the sense that there are graph algorithms available to try to solve these problems.

.B "1.1-5 Come up with a real-world problem in which only the best solution will do. Then come up with one in which a solution that is “approximately” the best is good enough."
A problem in which only the best solution will do can be any voting system or financial algorithms which require precision. However, an example where "approximately" will HAVE TO DO would be anything involving pseudo-random numbers (RNG).
