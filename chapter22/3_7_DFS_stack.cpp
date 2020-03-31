#include <stdio.h>
#include <vector>
#include <stack>

using namespace std;

// Assume we receive an adjacency matrix.
void DFS(int start, vector<vector<int> > matrix) {
	vector<bool> visited(matrix.size(), false);
	stack<int> s;
	s.push(start);

	while(s.size()) {
		int vertex = s.top();
	  s.pop();	

		if(!visited[vertex]) {
			printf("traversing %d\n", vertex);
			visited[vertex] = true;
		}
		
		for(auto i = 0; i < matrix.size(); ++i) {
			if(!visited[i])
				s.push(i);
		}
	}
	
}
