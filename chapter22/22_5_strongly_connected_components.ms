.TL
Strongly connected components
.AU
Kevin Woo
.AI
Stil doing this...

.EQ
delim $$
.EN

.SH
Introduction
.LP
A classic example of a DFS is 
.B decomposing
a
.B "directed graph"
into
.B "strongly connected components."


It is important to also know the formal definition of a strongly connected component which is the following:
.EQ
"Given graph " G=(V,E),
.EN
.EQ
"Strongly connected component is a set of vertices " C \[ib] V
.EN
.EQ
"Such that for every pair of vertices " u " and " v " in " C
.EN
.EQ
"we have both " u \[->] v " and " v \[->] u;
.EN
.EQ
"that is, vertices " u " and " v " are reachable from each other."
.EN

.SH
Algorithm
.LP
The algorithm for finding strongly connected componetns of a graph $G=(V,E)$ uses the transpose of G, which was defined previously was equivalent to ${G sup T}=(V,{E sup T})$, where ${E sup T}="{"(u,v):(v,u) \[mo] E"}"$.

This also means that $E sup T$ consists of the edges of G with their directions reversed. With an adjacency list, we can create the transpose in $O(V+E)$.

The steps are as follows:
.IP 1
Call DFS(G) to compute the finishing times for $u.f$ for each vertex $u$
.IP 2
Compute $G sup T$
.IP 3
Call DFS($G sup T$), but in the main loop of DFS, considering the vertices in order of decreasing $u.f$.
.IP 4
Output the vertices of each tree in the depth-first forest as a separate strongly connected component

.SH
Proofs
.LP
For the rest of the proofs, it is important to understand and the content within the book is very straight forward to lead up to the proof of SCC.
Please refer to pages 617-620.

.SH
Exercises
.LP
.B "22.5-1 How can the number of strongly connected components of a graph change if a new edge is added?"

If a new edge is added, either it could remain the same or we could have N-1 SCC where N is the total SCC.

.B "22.5-2 Show how the procedure STRONGLY-CONNECTED-COMPONENTS works on the graph of Figure 22.6. Specifically, show the finishing times computed in line 1 and the forest produced in line 3. Assume that the loop of lines 5-7 of DFS considers vertices in alphabetical order and that the adjacency lists are in alphabetical order."

Recalling that the graph gave the following:

.TS
tab(;) allbox;
c c c .
vertex;discovered;finished;
q;1;16
r;17;20
s;2;7
t;8;15
u;18;19
v;3;6
w;4;5
x;9;12
y;13;14
z;10;11
.TE

We can start with $r$ first giving: $r$

Then we would start with $u$ giving: $u$

Then we start with $q$ giving: $q-y-t$

Then we start with $x$ giving: $x-z$

Finally we start with $s$ giving: $s-w-v$

.B "22.5-3 Professor Bacon claims that the algorithm for strongly connected components would be simpler if it used the original (instead of the transpose) graph in the second depth-first search and scanned the vertices in order of increasing finishing times. Does this simpler algorithm always produce correct results?"

This algorithm doesn't work out given that it does not satisfy the check for whether $(v,u)$ is a possible edge given $(u,v)$ to satisfy the definition of SCC.


.B "22.5-4 Prove that for any directed graph $G$, we have $({(G sup {T}) sup "SCC"}) sup T = G sup "SCC"$. That is, the transpose of the component graph of $G sup T$ is the same as the component graph of $G$."

Firstly we must recognize that ${G sup "SCC"} = {G sup T} sup SCC$.
Therefore, we have to prove now that $({G sup "SCC"}) sup T = G sup "SCC"$.
Given ${G sup "SCC"} sup T$ is equal to $({G sup T}) sup SCC$, we have an equality.
${G sup "SCC"} = ({G sup T}) sup "SCC"$.

.B "22.5-5 Give an $O(V+E)$ time algorithm to compute the component graph of a directed graph $G=(V,E)$. Make sure that there is at most one edge between two vertices in the component graph your algorithm produces."

This is trivial since we know how to find the SCC.
Once we get SCC, all we have to do is iterate through the SCCs in order to find edges to other SCCs and append them to a new graph.

.B "22.5-6 Given a directed graph $G=(V,E)$, explain how to create another graph ${G opprime}=(V, {E opprime})$ such that (a) $G opprime$ has the same strongly connected components as $G$, (b) $G opprime$ has the same component graph as $G$, and (c) $E opprime$ is as small as possible. Describe a fast algorithm to compute $G opprime$"

This can be divided into 3 steps:
.IP 1
Run SCC and get the different components.
.IP 2
Get rid of unnecessary edges within the same components and create a component graph.
.IP 3
Re-expand the components using minimal edges by creating a cycle.
If a component has n vertices, then we will also have n edges.

This would give a complexity of $O(V+E)$.

.LP
.B "22.5-7 A directed graph $G = (V,E)$ is semiconnected if, for all pairs of vertices $u,v \[mo] V$, we have $u \[->] v$ or $v \[->] u$. Give an efficient algorithm to determine whether or not G is semiconnected. Prove that your algorithm is correct, and analyze its running time."

TODO(kevinwkt)
