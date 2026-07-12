class Solution {
  List<int> sumOfDistancesInTree(int n, List<List<int>> edges) {
    List<List<int>> adj = List.generate(n, (_) => []);
    for (var e in edges) {
      int u = e[0], v = e[1];
      adj[u].add(v);
      adj[v].add(u);
    }
    
    List<int> count = List.filled(n, 1);
    List<int> ans = List.filled(n, 0);
    
    void dfsIn(int node, int parent) {
      for (int child in adj[node]) {
        if (child != parent) {
          dfsIn(child, node);
          count[node] += count[child];
          ans[node] += ans[child] + count[child];
        }
      }
    }
    
    void dfsOut(int node, int parent) {
      for (int child in adj[node]) {
        if (child != parent) {
          ans[child] = ans[node] - count[child] + (n - count[child]);
          dfsOut(child, node);
        }
      }
    }
    
    dfsIn(0, -1);
    dfsOut(0, -1);
    return ans;
  }
}
