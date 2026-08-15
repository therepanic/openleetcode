class Solution {
  int maxNumEdgesToRemove(int n, List<List<int>> edges) {
    edges.sort((a, b) => b[0].compareTo(a[0]));
    List<int> parentA = List.generate(n + 1, (i) => i);
    List<int> parentB = List.generate(n + 1, (i) => i);
    List<int> rankA = List.filled(n + 1, 0);
    List<int> rankB = List.filled(n + 1, 0);

    int find(List<int> parent, int x) {
      if (parent[x] != x) {
        parent[x] = find(parent, parent[x]);
      }
      return parent[x];
    }

    bool union(List<int> parent, List<int> rank, int x, int y) {
      int rootX = find(parent, x);
      int rootY = find(parent, y);
      if (rootX == rootY) return false;
      if (rank[rootX] < rank[rootY]) {
        parent[rootX] = rootY;
      } else if (rank[rootX] > rank[rootY]) {
        parent[rootY] = rootX;
      } else {
        parent[rootX] = rootY;
        rank[rootY]++;
      }
      return true;
    }

    int removed = 0;
    int aliceEdges = 0;
    int bobEdges = 0;
    for (var e in edges) {
      if (e[0] == 3) {
        if (union(parentA, rankA, e[1], e[2])) {
          union(parentB, rankB, e[1], e[2]);
          aliceEdges++;
          bobEdges++;
        } else {
          removed++;
        }
      } else if (e[0] == 2) {
        if (union(parentB, rankB, e[1], e[2])) {
          bobEdges++;
        } else {
          removed++;
        }
      } else {
        if (union(parentA, rankA, e[1], e[2])) {
          aliceEdges++;
        } else {
          removed++;
        }
      }
    }
    return (bobEdges == n - 1 && aliceEdges == n - 1) ? removed : -1;
  }
}
