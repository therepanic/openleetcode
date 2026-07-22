class Solution {
  int minTime(int n, List<List<int>> edges, List<bool> hasApple) {
    List<List<int>> adj = List.generate(n, (_) => []);
    List<int> degree = List.filled(n, 0);

    for (var e in edges) {
      int u = e[0], v = e[1];
      adj[u].add(v);
      adj[v].add(u);
      degree[u]++;
      degree[v]++;
    }

    List<int> q = [];
    for (int i = 1; i < n; i++) {
      if (degree[i] == 1 && !hasApple[i]) {
        q.add(i);
      }
    }

    List<bool> keep = List.filled(n, true);

    while (q.isNotEmpty) {
      int u = q.removeAt(0);
      keep[u] = false;

      for (int v in adj[u]) {
        degree[v]--;
        if (v != 0 && keep[v] && !hasApple[v] && degree[v] == 1) {
          q.add(v);
        }
      }
    }

    int activeNodes = keep.where((k) => k).length;
    return (activeNodes - 1) * 2 > 0 ? (activeNodes - 1) * 2 : 0;
  }
}
