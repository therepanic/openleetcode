class Solution {
  int minTrioDegree(int n, List<List<int>> edges) {
    List<List<int>> adj = List.generate(n+1, (_) => List.filled(n+1, 0));
    List<int> deg = List.filled(n+1, 0);
    for (var e in edges) {
      adj[e[0]][e[1]] = 1;
      adj[e[1]][e[0]] = 1;
      deg[e[0]]++;
      deg[e[1]]++;
    }
    int ans = 1 << 30;
    for (var e in edges) {
      int u = e[0], v = e[1];
      for (int w = 1; w <= n; w++) {
        if (adj[u][w] == 1 && adj[v][w] == 1) {
          int val = deg[u] + deg[v] + deg[w] - 6;
          if (val < ans) ans = val;
        }
      }
    }
    return ans == (1 << 30) ? -1 : ans;
  }
}
