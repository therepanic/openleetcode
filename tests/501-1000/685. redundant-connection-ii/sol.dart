class Solution {
  int _find(List<int> parent, int u) {
    if (parent[u] != u) {
      parent[u] = _find(parent, parent[u]);
    }
    return parent[u];
  }
  
  bool _union(List<int> parent, List<int> rank, int u, int v) {
    int pu = _find(parent, u);
    int pv = _find(parent, v);
    if (pu == pv) return false;
    if (rank[pu] < rank[pv]) {
      parent[pu] = pv;
    } else if (rank[pv] < rank[pu]) {
      parent[pv] = pu;
    } else {
      parent[pu] = pv;
      rank[pv]++;
    }
    return true;
  }
  
  List<int> findRedundantDirectedConnection(List<List<int>> edges) {
    int n = edges.length;
    List<int> ufParent = List.generate(n + 1, (i) => i);
    List<int> rank = List.filled(n + 1, 0);
    List<int> parentArr = List.filled(n + 1, 0);
    
    List<int>? candidate1;
    List<int>? candidate2;
    
    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      if (parentArr[v] != 0) {
        candidate1 = [parentArr[v], v];
        candidate2 = [u, v];
        break;
      }
      parentArr[v] = u;
    }
    
    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      if (candidate2 != null && u == candidate2[0] && v == candidate2[1]) {
        continue;
      }
      if (!_union(ufParent, rank, u, v)) {
        return candidate1 ?? [u, v];
      }
    }
    
    return candidate2!;
  }
}
