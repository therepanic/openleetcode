class Solution {
  int shortestPathLength(List<List<int>> graph) {
    int n = graph.length;
    if (n == 1) return 0;
    
    int FULL = (1 << n) - 1;
    List<List<bool>> visited = List.generate(n, (_) => List.filled(1 << n, false));
    var q = <List<int>>[];
    
    for (int i = 0; i < n; i++) {
      int mask = 1 << i;
      q.add([i, mask, 0]);
      visited[i][mask] = true;
    }
    
    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      int node = cur[0], mask = cur[1], dist = cur[2];
      
      if (mask == FULL) return dist;
      
      for (int nei in graph[node]) {
        int newMask = mask | (1 << nei);
        
        if (!visited[nei][newMask]) {
          visited[nei][newMask] = true;
          q.add([nei, newMask, dist + 1]);
        }
      }
    }
    
    return -1;
  }
}
