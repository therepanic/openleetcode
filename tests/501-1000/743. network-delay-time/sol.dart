class Solution {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    final graph = List.generate(n + 1, (_) => <List<int>>[]);
    for (final edge in times) {
      graph[edge[0]].add([edge[1], edge[2]]);
    }

    final dist = List.filled(n + 1, 1 << 30);
    final used = List.filled(n + 1, false);
    dist[k] = 0;

    for (int step = 0; step < n; step++) {
      int node = -1;
      for (int i = 1; i <= n; i++) {
        if (!used[i] && (node == -1 || dist[i] < dist[node])) {
          node = i;
        }
      }
      if (node == -1 || dist[node] == 1 << 30) break;
      used[node] = true;
      for (final next in graph[node]) {
        final v = next[0];
        final w = next[1];
        if (dist[node] + w < dist[v]) {
          dist[v] = dist[node] + w;
        }
      }
    }

    int ans = 0;
    for (int i = 1; i <= n; i++) {
      if (dist[i] == 1 << 30) return -1;
      if (dist[i] > ans) ans = dist[i];
    }
    return ans;
  }
}
