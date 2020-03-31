.TL
Breadth-first search
.AU
Kevin Woo
.AI
I guess I am stuck.

.EQ
delim $$
.EN

.SH
Introduction
.LP
Breadth-frist search is used for example in 
.B "Prim's minimum spanning tree, Dijkstra's single-source shortest-paths"
and etc.

.LP
The idea is that given a graph $G=(V,E)$ and a source vertex $s$, bfs explores G to "discover" every vertex that is reachable from $s$.
It computes the distance (where each edge has a weight of 1), from s to each reachable vertex.
It is also caled breadth-first because it expands the frontier between discoevered and undiscovered vertices uniformly through a vertex.
This algorithm discovers all vertices at distance $k$ from $s$ before discovering any vertices at distance $k+1$.

.SH
Analysis
.LP
Using aggregate analysis, we can see that each vertex is enqueued at most once, and hence dequeued at most once where these operations take $O(1)$ of time making this $O(V)$ so far.
Because this procedure scans the adjacency listof each vertex to enqueue and dequeue, it would take ${Omega}(E)$.
Therefore the final complexity would be $O(V+E)$.

.SH
Shortest paths
.LP
I believe the explainations and conclusions derived from lemmas and axions within the book is pretty straightforward and necessary to understand or use the algorithms.
Please refer to page 597-601.

.SH
Exercises
.LP
.B "22.2-1 Show the $d$ and $pie$ values that result from running breadth-first search on the directed graph of Figure 22.2(a), using vertex 3 as the source."

$"V d {pi}"$

1 $\[if]$ NIL

2 3 4

3 0 NIL

4 2 5

5 1 3

6 1 3

.B "22.2-2 Show the d and $pi$ values that result from running breadth-first search on the undirected graph of Figure 22.3, using vertex $u$ as the source."

$V d {pi}$

r 4 s

s 3 w

t 1 u

u 0 NIL

v 5 r

w 2 t

x 1 u

y 1 u

.B "22.2-3 Show that using a single bit to store each vertex color suffices by arguing that the BFS procedure would produce the same result if lines 5 and 14 were removed."

Given that the "Gray representation" is always equivalent to the vertices "marked" in gray, we can assume that we don't have to explicitly mark the node as "gray" since we are using the queue.
Then, it means we can use a bit 0,1 to mark White and Black.

.B "22.2-4 What is the running time of BFS if we represent its input graph by an adjacency matrix and modify the algorithm to handle this form of input?"

The running time would then be $O(V sup 2)$ given that in the worst case scenario we would have to traverse all the reachable vertex (in $O(V)$) for V verteces.

.B "22.2-5 Argue that in a breadth-first search, the value $u.d$ assigned to a vertex $u$ is independent of the order in which the vertices appear in each adjacency list. Using Figure 22.3 as an example, show that the breadth-first tree computed by BFS can depend on the ordering within adjacency lists."

For example, given Figure 22.3, once we are at the vertex $u$, depending on who we queue first between $t$, $x$ and $y$ would be dependent on how we have it saved within the adjacency list.
This would affect the $pi$ of the vertex $w$, since when recursing, we could reach the same value for $u.d$ whereas $d$ of $w$ could be any of $t$, $x$ or $y$.

.B "22.2-6 Give an example of a directed graph $G=(V, E)$, a source vertex $s \[mo] V$, and a set of tree edges ${E sub pi} \[ib] E$ such that for each vertex $v \[mo] V$, the unique simple path in the graph $(V,{E sub pi})$ from s to  is a shortest path in $G$, yet the set of edges $E sub pi$ cannot be produced by running BFS on $G$, no matter how the vertices are ordered in each adjacency list."

If given source $s$ and an edge $(u,v)$, if $(s,v) = NIL$, despite how you arrange the adjacency list, $(s,u)$ and then $(u,v)$ is inevitable no matter how you re-arrange the adjacency list. This would happen anytime there's a strongly connected vertex.

.B "22.2-7 There are two types of professional wrestlers: 'babyfaces' ('good guys') and 'heels' ('bad guys'). Between any pair of professional wrestlers, there may or may not be a rivalry. Suppose we have $n$ professional wrestlers and we have a list of $r$ pairs of wrestlers for which there are rivalries. Give an $O(n+r)$ time algorithm that determines whether it is possible to designate some of the wrestlers as babyfaces and the remainder as heels such that each rivalry is between a babyface and a heel. If it is possible to perform such a designation, your algorithm should produce it."

This is the two-coloring problem (https://www8.cs.umu.se/kurser/TDBAfl/VT06/algorithms/BOOK/BOOK2/NODE69.HTM).
We can use BFS to match 'heels' with 'babyfaces' and check for the conditions r in the end.
Complexity for BFS would be $O(n+r)$ while the check would be $O(r)$.

.B "22.2-8 The diameter of a tree $T = (V,E)$ is defined as ${"max" sub {u,v \[mo] V}}{delta}"(u,v)"$, that is, the largest of all shortest path distances in the tree. Give an efficient algorithm to compute the diameter of a tree, and analyze the running time of your algorithm."

We could run the BFS but not completely if we know when to stop.
The stopping condition would be when we are sure that there can not be a vertex with out-degree possible with the unvisited nodes.
We would then stop if visited >= unvisited and we would be calculating max until that point.
Therefore this would be $O(V/2+E)$

.B "22.2-9 Let $G=(V,E)$ be a connected, undirected graph. Give an $O(V+E)$ time algorithm to compute a path in $G$ that traverses each edge in $E$ exactly once in each direction. Describe how you can find your way out of a maze if you are given a large supply of pennies."

We would simply use the BFS to traverse checking whether given an edge $(u,v)$, $v$ is the end of the maze.
In order to stop and edge from being traversed twice, we would add $v$ to visited once edge $(u,v)$ has been traversed while we check for that condition when handling an edge. 
This is the same as Prim's algorithm.
