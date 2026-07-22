class Solution {
  double frogPosition(int n, List<List<int>> edges, int t, int target) {
    Map<int, Set<int>> neighbors = {};
    for (int i = 1; i <= n; i++) {
      neighbors[i] = {};
    }
    for (var edge in edges) {
      int a = edge[0], b = edge[1];
      neighbors[a]!.add(b);
      neighbors[b]!.add(a);
    }
    
    Set<int> visited = {};
    double probability = 0.0;
    
    void dfs(int vertex, double chance, int elapsed) {
      if (elapsed == t) {
        if (vertex == target) {
          probability = chance;
        }
        return;
      }
      visited.add(vertex);
      Set<int> choices = Set.from(neighbors[vertex]!);
      choices.removeAll(visited);
      
      if (choices.isEmpty) {
        dfs(vertex, chance, elapsed + 1);
      } else {
        for (int child in choices) {
          dfs(child, chance / choices.length, elapsed + 1);
        }
      }
    }
    
    dfs(1, 1.0, 0);
    return probability;
  }
}
