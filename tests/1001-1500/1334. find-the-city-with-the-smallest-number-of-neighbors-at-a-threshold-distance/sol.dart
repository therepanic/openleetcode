class Solution {
  int findTheCity(int n, List<List<int>> edges, int distanceThreshold) {
    const int INF = 1 << 30;
    List<List<int>> matrix = List.generate(n, (_) => List.filled(n, INF));
    
    for (int i = 0; i < n; i++) {
      matrix[i][i] = 0;
    }
    
    for (var edge in edges) {
      int u = edge[0], v = edge[1], w = edge[2];
      matrix[u][v] = w;
      matrix[v][u] = w;
    }
    
    for (int via = 0; via < n; via++) {
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          if (matrix[i][via] + matrix[via][j] < matrix[i][j]) {
            matrix[i][j] = matrix[i][via] + matrix[via][j];
          }
        }
      }
    }
    
    int minReachable = n;
    int ans = -1;
    
    for (int i = 0; i < n; i++) {
      int count = 0;
      for (int j = 0; j < n; j++) {
        if (matrix[i][j] <= distanceThreshold) {
          count++;
        }
      }
      if (count <= minReachable) {
        minReachable = count;
        ans = i;
      }
    }
    
    return ans;
  }
}
