.TL
22.1 Representation of graphs
.AU
Kevin Woo
.AI
Bored and tired college kid

.EQ
delim $$
.EN

.SH
Introduction
.LP
There are two main ways to represent a graph $G = (V,E); where " V = vertices && E = edges"$; Using a
.B "collection of adjacency lists"
or a
.B "adjancency matrix."

In both representations, we can show directed and undirected graphs.

.LP
In
.B "sparse graphs,"
$|E|$ is much less than $|E| sup 2$. Therefore, when $|E| < |V| sup 2$ we use adjacency lists.

.LP
In 
.B "dense graphs,"
$|E|$ is close to $|V| sup 2$. In these cases we use adjacency matrices.

.LP
In
.B "adjacency-list representation,"
of $G=(V,E)$, it consists of an
.B "array"
$Adj$ where $"|Adj| = |V|"$.
For each $u \[mo] V$, the adjacency list $"Adj[u]"$ contains all veritces $v$ such that there is an edge $"(u,v) \[mo] E"$.
In other words,
.B "$Adj[u]$ consists of all the vertices adjacent to $u$ in $G$."

A potential
.B disadvantage
of an adjacency-list representation would be that to determine whether an edge $"(u,v)"$ is present in the graph, we must search all of $Adj[u]$ in order to check.

.LP
In
.B "adjacency-matrix representation,"
of a graph $G=(V, E)$, we assume that the vertices are numbered $"0,...|V|-1"$ in some arbitrary manner.
This would also mean that graph $G$ consists of $|V|*|V|$ matrix where given $(a sub "ij")$, $(a sub "ij" = 1 " if (i,j) \[mo] E, else 0")$.


.SH
Exercises
.LP
.B "22.1-1 Given an adjacency-list representation of a directed graph, how long does it take to compute the out-degree of every vertex? How long does it take to compute the in-degrees?"

Out-degrees would take $|Adj[u]|$ given that we only have to check edges starting from $u$.
In-degrees would take $O(V+E)$ given that we would have to check the whole adjacency-list.


.B "22.1-2 Give an adjacency-list representation for a complete binary tree on 7 vertices. Give an equivalent adjacency-matrix representation. Assume that vertices are numbered from 1 to 7 as in a binary heap."

Adjacency-list:

  1: 2 3
  2: 1 4 5
  3: 1 6 7
  4: 2
  5: 2
  6: 3
  7: 3

Adjacency-matrix:

[ 0 1 1 0 0 0 0
  1 0 0 1 1 0 0
  1 0 0 0 0 1 1
  0 1 0 0 0 0 0
  0 1 0 0 0 0 0
  0 0 1 0 0 0 0
  0 0 1 0 0 0 0
]

.B "22.1-3 The transpose of a directed graph $G=(V,E)$ is the graph ${G sup T} = (V, {E sup T})$, where ${E sup T}="{"(v,u) \[mo]E"}"$. Thus, $G sup T$ is G with all its edges reversed. Describe efficient algorithms for computing $G sup T$ from G, for both the adjacency-list and adjacency-matrix representations of G. Analyze the running times of your algorithms."

For adjancey-lists, we would pretend the adjacency list is a matrix, and reflect diagonally using the (triangle) side that is being occupied. This would be $O(V sup 2)$.

For matrices, we could only iterate through the (triangle) constructing an adjancency-list which would lead to a complexity of $O(V+E)$.

.B "22.1-4 Given an adjacency-list representation of a multigraph $G=(V,E)$, describe an $"O(V+E)"$-time algorithm to compute the adjaceny-list representation of the 'equivalent' undirected graph ${G opprime}=(V,{E opprime})$, where $E opprime$ consists of the edges in $E$ with all multiple edges between two vertices replaced by a single edge and with all self-loops removed."

We create a triangular (half-matrix) getting rid of the possible loops in linear $O(V+E)$ time.

.B "22.1-5 The square of a directed graph $G=(V,E)$ is the graph ${G sup 2} = (V,{E sup 2})$ such that $(u,v) \[mo] {E sup 2}$ if and only $G$ contains a path with at most two edges between $u$ and $v$. Describe efficient algorithms for computing G2 from G for both the adjacencylist and adjacency-matrix representations of G. Analyze the running times of your algorithms."

TODO(kevinwkt)

.B "22.1-6 Most graph algorithms that take an adjacency-matrix representation as input re-quire time ${Omega}({V sup 2})$, but there are some exceptions. Show how to determine whether a directed graph G contains a universal sink a vertex with in degree $"|V|-1"$ and out-degree 0 in time $"O(V)"$, given an adjacency matrix for $G$."

There are 2 conditions that must be met.
The first is that given $(i,j)$, where $i$ is the universal sink vertex, the row $i$ must be full of $0s$ and the column $i$ must be full of 1s.
Starting at the left top most index of the matrix, $(0,0)$, if $1$, we try with $(i+1, j)$ else $(i, j+1)$ to find this condition. 

.B "22.1-7 The incidence matrix of a directed graph $G=(V,E)$ with no self-loops is a $"|V|*|E|"$ matrix $B=(b sub "ij")$ such that ${b sub "ij"}= {"-1 if edge j leaves vertex i, 1 if edge j enters vertex i, 0 otherwise"}$."

TODO(kevinwkt)

.B "22.1-8 Suppose that instead of a linked list, each array entry $"Adj[u]"$ is a hash table containing the vertices $v$ for which $(u,v) \[mo] E$. If all edge lookups are equally likely, what is the expected time to determine whether an edge is in the graph? What disadvantages does this scheme have? Suggest an alternate data structure for each edge list that solves these problems. Does your alternative have disadvantages compared to the hash table?"

Supposing that $Adj[u]$ is a hashtable, checking if edge $(u,v)$ is in $Adj$ would be $O(1)$.
The disadvantage of this would be that depending on the hash or the find method, it could becomine $O(V)$.
An alternative would be to a map instead of unordered_map which keeps the keys sorted and could find keys within $O(lgV)$.
However, insertion and lookup would also be $O(lgV)$.
