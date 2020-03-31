.TL
Topological sort
.AU
Kevin Woo
.AI
Someone who don't know how to count

.EQ
delim $$
.EN

.SH
Introduction
.LP
.B "Topological sort"
is usually done to a directed acyclic graph (dag)/
A topological sort of a dag $G=(V,E)$ is a linear ordering of all its vertices that if $G$ contains an edge $(u,v)$, then $u$ appears before $v$ in the ordering.
(I did this in Google in order to show a dependency graph for asynchronous workflows).

.SH
Algorithm
.LP
Topological sort is basically a complexity of $O(V+E)$ given that we can do it within 1 pass of a DFS.
As we "finish" a vertex (find $u.f$), we append to the front of a linked-list.
It is basically the vertices sorted in descending order by $u.f$ for every vertex $u$.

.SH
Exercises
.LP
.B "22.4-1 Show the ordering of vertices produced by TOPOLOGICAL-SORT when it is run on the dag of Figure 22.8, under the assumption of Exercise 22.3-2."

.TS
tab(;) allbox;
c c c .
vertex;discovered;finished;
m;1;20
n;21;26
o;22;25
p;27;28
q;2;5
r;6;19
s;23;24
t;3;4
u;7;8
v;10;17
w;11;14
x;15;16
y;9;18
z;12;13
.TE

.B "22.4-2 Give a linear-time algorithm that takes as input a directed acyclic graph $G=(V,E)$ and two vertices s and t, and returns the number of simple paths from s to t in G. For example, the directed acyclic graph of Figure 22.8 contains exactly four simple paths from vertex p to vertex : po, pory, posry, and psry. (Your algorithm needs only to count the simple paths, not list them.)"

TODO(kevinwkt) DP

.B "22.4-3 Give an algorithm that determines whether or not a given undirected graph $G=(V,E)$ contains a cycle. Your algorithm should run in $O(V)$ time, independent of $|E|$."

The algorithm would be a simple DFS where given for each vertex, we check all edges which gives a new edge, and the moment we reach a visited edge, we don't traverse...
We then check if the already visited edge is a back edge and fail fast.
This way we would do at most O(V) of constant checks for each vertex, making this $O(V)$.

.B "22.4-4 Prove or disprove: If a directed graph $G$ contains cycles, then TOPOLOGICALSORT($G$) produces a vertex ordering that minimizes the number of “bad” edges that are inconsistent with the ordering produced."

The topological sort with a non-dag always can produce different results depending on where you start and the adjacency list. Because of this we can not say that it always minimizes the number of "bad edges".

.B "22.4-5 Another way to perform topological sorting on a directed acyclic graph $G=(V,E)$ is to repeatedly find a vertex of in-degree 0, output it, and remove it and all of its outgoing edges from the graph. Explain how to implement this idea so that it runs in time $O(V+E)$. What happens to this algorithm if G has cycles?"

TODO(kevinwkt)
