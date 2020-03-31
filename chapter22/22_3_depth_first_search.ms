.TL
Depth-first search
.AU
Kevin Woo
.AI
On the same day, nice!

.EQ
delim $$
.EN

.SH
Introduction
.LP
Deph first-search looks "deeper" into the graph whenever possible.
Once all of $v$'s edges have been explored, the search "backtracks" to explore edges leaving the vertex from which $v$ was discovered.

.LP
Using aggregate analysis, we can see that DFS complexity is also $O(V+E)$ where even if we go to each node $V$ times as we recurse, for each one we must check the $E$ edges just like in a BFS.

We will refer to funciton $DFS(G)$ to the initial function that iterates through vertices $V$, while $DFS-VISIT(G, u)$ is the helper function which recursively iterates through edges of $u$.

.SH
Properties of a depth-first search
.LP
Just like in a BFS, we can use the notation $pi$ to denote it's calling parent.
Therefore, $u=v.{pi}$ iff $DFS-VISIT(G,v)$ was called during $u$'s adjacency list.
However, we will also denote $u.d$ as discovery time and $u.f$ as finishing time of the step-through of the vertex $u$.

.LP
This leads us to the
.B "parenthesis theorem"
that merely shows that once we enter a specific node, we keep on recursing through it's children, but it will always come back to the initial node to finilize.
When visualizing the step-in of the vertices, we can see something like the following for figure 22.5 B (pg.607):

.EQ
(s (z (y (x x) y) (w w) z) s) (t (v v) (u u) t)
.EN

.SH
Classification of edges
.LP
We can analyze the graph $G=(V,E)$ by classifying edges.
An example of this can be to see if a directed graph is acyclic iff DFS yields no "back" edges.

.IP 1
.B "Tree edges"
are edges in the depth-first forest $G sub pi$. Edge $(u,v)$ is a tree edge if $v$ was first discovered by exploring edge $(u,v)$.
.IP 2
.B "Back edges"
are those edges $(u,v)$ connecting a vertex $u$ to an ancestor $v$ in a depth-first tree. We consider self-loops, which may occur in directed graphs, to be back edges.
.IP 3
.B "Forward edges"
are those nontree edges $(u,v)$ connecting a vertex $u$ to a descendant $v$ in a depth-first tree.
.IP 4
.B "Cross edges"
are all other edges. They can go between vertices in teh same depth-first tree, as long as one vertex is not an ancestor of the other, or they can go between vertices in different depth-first trees.

.SH
Exercises
.LP
.B "22.3-1 Make a 3-by-3 chart with row and column labels WHITE, GRAY, and BLACK. In each cell $(i,j)$, indicate whethe, at any point during a depth-first search of a directed graph, there can be an edge from a vertex of color $i$ to a vertex of color $j$. For each possible edge, indicate what edge types it can be. Make a second such chart for depth-first search of an undirected graph."

Directed graph:
.TS
tab(;) allbox;
c c c c .
from/to;BLACK;GRAY;WHITE
BLACK;"all kinds";"back";-
GRAY;"forward, cross, tree";"forward, back, tree";"tree, forward"
WHITE;"forward, cross, tree";"cross, back";"all kinds"
.TE

Undirected graph:
.TS
tab(;) allbox;
c c c c .
from/to;BLACK;GRAY;WHITE
BLACK;"all kinds";"all kinds";"all kinds"
GRAY;-;"forward, back, tree";"all kinds"
WHITE;-;-;"all kinds"
.TE

.B "22.3-2 Show how depth first search works on the graph of Figure 22.6.. Assume that the for loop of lines 5-7 of the DFS procedure considers the vertices in alphabetical order, and assume that each adjacency list is ordered alphabetically. Show the discovery and finishing times for each vertex, and show the classification of each edge."

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

.B "22.3-3 Show the parenthesis structure of the depth-first search of Figure 22.4"

(u (v (y (x x) y) v) u) (w (z z) w)

.B "22.3-4 Show that using a single bit to store each vertex color suffices by arguing that the DFS procedure would produce the same result if line 3 of DFS-VISIT was removed."

Through the use of basic DFS, all we have to know is whether or not the vertex has been visited or not to satisfy the underlying condition for DFS.
This can be represented as 0/1 depending on whether or not we have visited the vertex or not.

.B "22.3-5 Show that edge $(u,v)" is"$"

.B "a. a tree edge or forward edge iff $u.d < v.d < v.f< u.f$"

.B "b. a back edge if $v.d <= u.d < u.f <= v.f$"

.B "c. a cross edge if and only if $v.d < v.f < u.d < u.f$"

.IP a
Given the lemma that says $u.d < v.d < v.f< u.f$ iff $v$ is a descendant of $u$, we have to check whether all the possibilities of an edge $(u,v)$ can be achieved.
By definition we can see that given these conditions, "tree edges" and "forward edges" are the only ones that satisfy this condition.

.IP b
Given the inverse lemma of the previous, we can conclude that they have to be of the same $G sub pi$ which means that the "back edge" is the only possibility.

.IP c
Given that this means that $(u,v)$, $u$ and $v$ are not part of the same $G sub pi$ (depth-forest). Therefore it must only be a "cross edge".

.B "22.3-6 Show that in an undirected graph, classifying an edge $(u,v)$ as a tree edge or a backedge according to whether $(u,v)$ or $(v,u)$ is encountered first during the depth-first search is equivalent to classifying it according to the ordering of the four types in the classification scheme."

In the undirected graph, given that $(u,v)$ or $(v,u)$ we can create a tree edge using $v$ or $u$ respectively depending whether or not we have arrived at those vertices.
The arrival of these vertices are directly correlatable to the first 2 of the 4 types of the classification scheme which if turned around can alter the result.

.B "22.3-7 Rewrite the procedure DFS, using a stack to eliminate recursion."

This can be seen in the code 3_7_DFS_stack.cpp

.B "22.3-8 Give a counterexample to the conjecture that if a directed graph G contains a path from $u$ to $v$, and if $u.d < v.d$ in a depth-first search of $G$, then $v$ is a descendant of $u$ in the depth-first forest produced."

If $E=(u,v)$ is a cross-edge, $v$ can never be a descendant of $u$.

.B "22.3-9 Give a counterexample to the conjecture that if a directed graph $G$ contains a path from $u$ to $v$, then any depth-first search must result in $v.d<=u.f$."

Given $V = \[lC] x, u, v \[rC]$ and $E = \[lC] (x,u), (x,v), (u,v) \[rC]$...

If we were to traverse $v$ before $u$, we would reach a contradiction.

.B "22.3-10 Modify the pseudocode for depth-first search so that it prints out every edge in the directed graph $G$, together with its type. Show what modifications, if any, you need to make if $G$ is undirected."

The answer to this problem is within  3_10_DFS_edge_type.cpp

.B "22.3-11 Explain how a vertex $u$ of a directed graph can end up in a depth-first tree containing only $u$, even though $u$ has both incoming and outgoing edges in $G$."

This could happend if $u$'s outgoing edge has already been visited and is in another "depth-forest" and we must start a new "depth-forest" using $u$.

.B "22.3-12 Show that we can use a depth-first search of an undirected graph $G$ to identify the connected components of $G$, and that the depth-first forest contains as many trees as $G$ has connected components. More precisely, show how to modify depth-first search so that it assigns to each vertex $v$ an integer label $v.cc$ between $1$ and $k$, where $k$ is the number of connected components of $G$, such that $u.cc = v.cc$ if and only if $u$ and $v$ are in the same connected component."

This is very simple.
Within the main function $DFS(G)$ which starts a new "depth-tree" we only need to increase k and pass it down to the helper function.

.B "22.3-13 A directed graph $G=(V,E)$ is singly connected if $u \[->] v$ implies that $G$ contains at most one simple path from $u$ to $v$ for all vertices $u,v \[mo] V$. Give an efficient algorithm to determine whether or not a directed graph is singly connected."

TODO(kevinwkt)

