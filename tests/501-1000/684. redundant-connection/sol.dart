class Solution {
  List<int> findRedundantConnection(List<List<int>> edges) {
    int n = edges.length;
    List<List<int>> matrix = List.generate(n + 1, (_) => []);
    for (var edge in edges) {
      int a = edge[0], b = edge[1];
      matrix[a].add(b);
      matrix[b].add(a);
    }

    Set<int> visited = {};
    Set<int> path = {};
    int cycleStart = -1;

    bool dfs(int i, int parent) {
      if (visited.contains(i)) return false;
      visited.add(i);
      for (int node in matrix[i]) {
        if (!visited.contains(node)) {
          if (dfs(node, i)) {
            if (cycleStart != -1) {
              path.add(node);
            }
            if (node == cycleStart) {
              cycleStart = -1;
            }
            return true;
          }
        } else if (node != parent) {
          path.add(node);
          cycleStart = node;
          return true;
        }
      }
      return false;
    }

    for (int i = n; i >= 1; i--) {
      if (dfs(i, -1)) break;
    }

    for (int k = n - 1; k >= 0; k--) {
      int a = edges[k][0], b = edges[k][1];
      if (path.contains(a) && path.contains(b)) {
        return [a, b];
      }
    }
    return [];
  }
}
