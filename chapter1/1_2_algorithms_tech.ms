.TL
1.2 Algorithms as a technology
.AU
Kevin Woo
.AI
Desperate college kid who keeps on trying.

.SH
Introduction
.LP
Computer resources are limited. There are sufficient reasons to make things faster/more efficient.

.SH
Efficiency
.LP
Efficiency is measured with big O notation mostly. For example, we will see in Chapter 2 
.B "insertion sort"
which has a complexity as follows along with 
.B "merge sort."

.EQ
"Insertion Sort" = { c sub 1 }{ n sup 2}
.EN
.EQ
"Merge Sort" = { c sub 2 }n"lg(n)" ", where lg"=log sub 2
.EN

.SH
Example:
.LP
Given a
.B faster
computer "A" running
.B "insertion sort"
and a
.B slower
computer "B" running
.B "merge sort,"
assume they have to sort an array of 10 million numbers.

Supposing that "A" executes 10 billion instructions per second and "B" executes 10 million instructions per second,
(basically "A" is 1000x faster than "B").
We will also assume that the programmer of each algorithm made the insertion sort to have a constant of 2 and the merge sort to have a constant of 50.
.B "Who will sort faster?"

.B "Computer A"
.EQ
{2 * { ( 10 sup 7 ) } sup 2 "instructions" } over { 10 sup 10 "instructions/second" } = 20,000 " seconds (more than 5.5 hours)"
.EN

.B "Computer B"
.EQ
{ 50 * 10 sup 7 "lg" 10 sup 7 "instructions" } over 10 sup 7 "instructions/second" = 1163 " seconds (less than 20 minutes)"
.EN

Through this we can see that despite having a worse constant and computer, because of the algorithm, we managed to reduce the execution time.

.SH
Algorithms and other technologies
.LP
.B "TLDR;"
Algorithms in real life is an important part despite the use of different programming paradigm such as OOP, GUIS, UI/UX, arichitectures, and networking/infrastructure.

.SH
Exercises
.LP
.B "1.2-1 Give an example of an application that requires algorithmic content at the application level, and discuss the function of the algorithms involved"
An example of an application that requires algorithmice content at the application level could be any front end component-based framework such as Angular or React where component tree has to be made. This component tree could be traversed, prioritized and rendered depending on the underlying algorithm.

.B "1.2-2 Suppose we are comparing implementations of insertion sort and merge sort on the same machine. For inputs of size n, insertion sort runs in 8n2 steps, while merge sort runs in 64n lg n steps. For which values of n does insertion sort beat merge sort?"
.EQ
8 n sup 2 = 64 n "lg(n)"
.EN
.EQ
n sup 2 = 8 n "lg(n)"
.EN
.EQ
{ n sup 2 } over { n "lg(n)" } = 8
.EN
.EQ
n over "lg(n)" = 8
.EN
.EQ
n = 43.5593"..."
.EN

.B "1.2-3 What is the smallest value of n such that an algorithm whose running time is 100n2 runs faster than an algorithm whose running time is 2n on the same machine?"
.EQ
100 n sup 2 = 2 sup n = 14.3
.EN
We would then need 15 elements as n.
