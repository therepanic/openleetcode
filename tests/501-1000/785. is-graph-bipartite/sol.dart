class Solution {
  bool isBipartite(List<List<int>> graph) {
    int N = graph.length;
    List<int> colors = List.filled(N, -1);
    
    bool checkBipartite(int u, int currColor) {
      colors[u] = currColor;
      for (int v in graph[u]) {
        if (colors[v] == -1) {
          if (!checkBipartite(v, 1 - currColor)) {
            return false;
          }
        } else {
          if (colors[v] == currColor) {
            return false;
          }
        }
      }
      return true;
    }
    
    for (int u = 0; u < N; u++) {
      if (colors[u] == -1) {
        if (!checkBipartite(u, 0)) {
          return false;
        }
      }
    }
    return true;
  }
}
