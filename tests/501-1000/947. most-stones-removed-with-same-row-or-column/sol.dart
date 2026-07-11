class Solution {
  int removeStones(List<List<int>> stones) {
    int n = stones.length;
    List<List<int>> matrix = List.generate(n, (_) => []);
    
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if (stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]) {
          matrix[i].add(j);
          matrix[j].add(i);
        }
      }
    }
    
    List<bool> visited = List.filled(n, false);
    int components = 0;
    
    void dfs(int idx) {
      visited[idx] = true;
      for (int nei in matrix[idx]) {
        if (!visited[nei]) {
          dfs(nei);
        }
      }
    }
    
    for (int i = 0; i < n; i++) {
      if (!visited[i]) {
        components++;
        dfs(i);
      }
    }
    
    return n - components;
  }
}
