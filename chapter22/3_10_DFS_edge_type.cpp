#include <stdio.h>
#include <vector>
#include <unordered_set>
#include <list>

using namespace std;

class Graph
{
	int V;
	list<int> *adj;

public:
	Graph(int V);
	void addEdge(int u, int v);
	void DFSUtil(int v, unordered_set<int> &depth_tree, vector<int> &visited, int level);
	void DFS(int v);
};

Graph::Graph(int V)
{
	this->V = V;
	this->adj = new list<int>[V];
}

void Graph::addEdge(int u, int v)
{
	adj[u].push_back(v);
}

void Graph::DFSUtil(int v, unordered_set<int> &depth_tree, vector<int> &visited, int level)
{
	visited[v] = level;
	depth_tree.insert(v);

	list<int>::iterator i;
	for (i = adj[v].begin(); i != adj[v].end(); ++i)
	{
		if (visited[*i] == -1)
		{
			printf("Tree edge (%d, %d)\n", v, *i);
			DFSUtil(*i, depth_tree, visited, level + 1);
		}
		else
		{
			if (depth_tree.find(*i) == depth_tree.end())
			{
				// Case where it's in another depth_tree.
				printf("Cross edge (%d, %d)\n", v, *i);
			}
			else if (visited[v] > visited[*i])
			{
				// Case where current is deeper level than target edge.
				printf("Backward edge (%d, %d)\n", v, *i);
			}
			else
			{
				printf("Forward edge (%d, %d)\n", v, *i);
			}
		}
	}
}

void Graph::DFS(int v)
{
	vector<int> visited(V, -1);

	unordered_set<int> initial_depth_tree;
	DFSUtil(v, initial_depth_tree, visited, 0);

	for (int i = 0; i < V; ++i)
	{
		if (visited[i] == -1)
		{
			unordered_set<int> depth_tree;
			DFSUtil(i, depth_tree, visited, 0);
		}
	}
}

int main()
{
	Graph g(10);
	g.addEdge(0, 2);
	g.addEdge(0, 6);
	g.addEdge(6, 2);
	g.addEdge(5, 6);
	g.addEdge(2, 5);
	g.addEdge(0, 3);
	g.addEdge(8, 0);
	g.addEdge(3, 8);
	g.addEdge(3, 7);
	g.addEdge(7, 9);
	g.addEdge(9, 7);
	g.addEdge(1, 4);
	g.addEdge(4, 8);
	g.addEdge(1, 8);

	g.DFS(0);
}
