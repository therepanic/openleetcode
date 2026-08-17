class Solution {
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    List<int> parent = List.generate(n, (i) => i);
    List<int> rank = List.filled(n, 0);
    
    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }
    
    void union(int x, int y) {
      int xroot = find(x);
      int yroot = find(y);
      if (xroot == yroot) return;
      if (rank[xroot] < rank[yroot]) {
        parent[xroot] = yroot;
      } else if (rank[xroot] > rank[yroot]) {
        parent[yroot] = xroot;
      } else {
        parent[yroot] = xroot;
        rank[xroot]++;
      }
    }
    
    // add index to queries
    List<List<int>> queriesWithIdx = [];
    for (int i = 0; i < queries.length; i++) {
      queriesWithIdx.add([queries[i][0], queries[i][1], queries[i][2], i]);
    }
    
    queriesWithIdx.sort((a, b) => a[2].compareTo(b[2]));
    edgeList.sort((a, b) => a[2].compareTo(b[2]));
    
    int idx = 0;
    List<bool> res = List.filled(queries.length, false);
    for (var q in queriesWithIdx) {
      while (idx < edgeList.length && edgeList[idx][2] < q[2]) {
        union(edgeList[idx][0], edgeList[idx][1]);
        idx++;
      }
      if (find(q[0]) == find(q[1])) {
        res[q[3]] = true;
      }
    }
    return res;
  }
}
