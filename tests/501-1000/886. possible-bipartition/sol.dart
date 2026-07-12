class Solution {
  bool possibleBipartition(int n, List<List<int>> dislikes) {
    Map<int, List<int>> graph = {};
    for (var edge in dislikes) {
      int u = edge[0], v = edge[1];
      graph.putIfAbsent(u, () => []);
      graph.putIfAbsent(v, () => []);
      graph[u]!.add(v);
      graph[v]!.add(u);
    }
    
    List<int> color = List.filled(n + 1, 0);
    
    for (int node = 1; node <= n; node++) {
      if (color[node] != 0 || !graph.containsKey(node)) {
        continue;
      }
      
      List<int> queue = [node];
      color[node] = 1;
      
      while (queue.isNotEmpty) {
        int curr = queue.removeAt(0);
        
        for (int neighbor in graph[curr]!) {
          if (color[neighbor] == color[curr]) {
            return false;
          }
          
          if (color[neighbor] == 0) {
            color[neighbor] = -color[curr];
            queue.add(neighbor);
          }
        }
      }
    }
    
    return true;
  }
}
