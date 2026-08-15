class Solution {
  int countRestrictedPaths(int n, List<List<int>> edges) {
    const mod = 1000000007;
    List<List<List<int>>> graph = List.generate(n + 1, (_) => []);
    for (var e in edges) {
      graph[e[0]].add([e[1], e[2]]);
      graph[e[1]].add([e[0], e[2]]);
    }

    List<int> dist = List.filled(n + 1, 1 << 60);
    dist[n] = 0;
    var heap = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    heap.add([0, n]);
    while (heap.isNotEmpty) {
      var cur = heap.removeFirst();
      int d = cur[0], node = cur[1];
      if (d > dist[node]) continue;
      for (var nb in graph[node]) {
        int next = nb[0], w = nb[1];
        int nd = d + w;
        if (nd < dist[next]) {
          dist[next] = nd;
          heap.add([nd, next]);
        }
      }
    }

    List<int> dp = List.filled(n + 1, 0);
    dp[n] = 1;
    List<int> nodes = List.generate(n, (i) => i + 1);
    nodes.sort((a, b) => dist[a] - dist[b]);
    for (int u in nodes) {
      for (var nb in graph[u]) {
        int v = nb[0];
        if (dist[u] > dist[v]) {
          dp[u] = (dp[u] + dp[v]) % mod;
        }
      }
    }
    return dp[1];
  }
}
