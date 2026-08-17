class Solution {
  bool validPath(int n, List<List<int>> edges, int source, int destination) {
    if (source == destination) return true;
    Map<int, List<int>> graph = {};
    for (var edge in edges) {
      graph.putIfAbsent(edge[0], () => []).add(edge[1]);
      graph.putIfAbsent(edge[1], () => []).add(edge[0]);
    }
    Queue<int> queue = Queue();
    Set<int> visited = {};
    queue.add(source);
    visited.add(source);
    while (queue.isNotEmpty) {
      int node = queue.removeFirst();
      if (node == destination) return true;
      for (int neighbor in graph[node] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
    return false;
  }
}
