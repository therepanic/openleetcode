class Solution {
  int checkWays(List<List<int>> pairs) {
    Map<int, Set<int>> graph = {};
    for (var p in pairs) {
      graph.putIfAbsent(p[0], () => <int>{});
      graph.putIfAbsent(p[1], () => <int>{});
      graph[p[0]]!.add(p[1]);
      graph[p[1]]!.add(p[0]);
    }
    if (graph.isEmpty) return 0;
    int root = graph.keys.reduce((a, b) => graph[a]!.length > graph[b]!.length ? a : b);
    if (graph[root]!.length != graph.length - 1) return 0;

    int ans = 1;
    graph.forEach((node, neighbors) {
      if (node == root) return;
      var parents = neighbors.where((cand) => graph[cand]!.length >= neighbors.length).toList();
      if (parents.isEmpty) { ans = 0; return; }
      int parent = parents.reduce((a, b) => graph[a]!.length < graph[b]!.length ? a : b);
      var union = Set<int>.from(graph[parent]!);
      union.add(parent);
      if (!union.containsAll(neighbors)) { ans = 0; return; }
      if (neighbors.length == graph[parent]!.length) ans = 2;
    });
    return ans;
  }
}
