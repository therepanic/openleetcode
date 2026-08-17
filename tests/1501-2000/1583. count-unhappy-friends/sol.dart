class Solution {
  int unhappyFriends(int n, List<List<int>> preferences, List<List<int>> pairs) {
    List<int> graph = List.filled(n, 0);
    for (var p in pairs) {
      graph[p[0]] = p[1];
      graph[p[1]] = p[0];
    }

    List<List<int>> rank = List.generate(n, (_) => List.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < preferences[i].length; j++) {
        rank[i][preferences[i][j]] = j;
      }
    }

    int ans = 0;
    for (int u = 0; u < n; u++) {
      int v = graph[u];
      bool unhappy = false;
      for (int a in preferences[u]) {
        if (a == v) break;
        int av = graph[a];
        if (rank[a][u] < rank[a][av]) {
          unhappy = true;
          break;
        }
      }
      if (unhappy) ans++;
    }
    return ans;
  }
}
