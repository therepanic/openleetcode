class Solution {
  int minReorder(int n, List<List<int>> connections) {
    Set<String> roads = {};
    List<List<int>> graph = List.generate(n, (_) => []);
    for (var conn in connections) {
      int x = conn[0], y = conn[1];
      graph[x].add(y);
      graph[y].add(x);
      roads.add('$x,$y');
    }
    
    List<bool> seen = List.filled(n, false);
    seen[0] = true;
    
    int dfs(int node) {
      int ans = 0;
      for (int neighbor in graph[node]) {
        if (!seen[neighbor]) {
          if (roads.contains('$node,$neighbor')) {
            ans++;
          }
          seen[neighbor] = true;
          ans += dfs(neighbor);
        }
      }
      return ans;
    }
    
    return dfs(0);
  }
}
