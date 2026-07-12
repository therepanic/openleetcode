class Solution {
  List<int> shortestAlternatingPaths(int n, List<List<int>> redEdges, List<List<int>> blueEdges) {
    List<int> ans = List.filled(n, -1);
    List<List<List<int>>> graph = List.generate(n, (_) => []);
    
    for (var edge in redEdges) {
      graph[edge[0]].add([edge[1], 1]); // 1-red
    }
    for (var edge in blueEdges) {
      graph[edge[0]].add([edge[1], 2]); // 2-blue
    }
    
    List<List<int>> q = [[0, 0]]; // [node, prevColor]
    int step = 0;
    
    while (q.isNotEmpty) {
      int size = q.length;
      for (int i = 0; i < size; i++) {
        var cur = q.removeAt(0);
        int u = cur[0], prevColor = cur[1];
        if (ans[u] == -1) {
          ans[u] = step;
        }
        var neighbors = graph[u];
        for (int j = 0; j < neighbors.length; j++) {
          int v = neighbors[j][0], edgeColor = neighbors[j][1];
          if (v == -1 || edgeColor == prevColor) continue;
          q.add([v, edgeColor]);
          neighbors[j][0] = -1;
        }
      }
      step++;
    }
    return ans;
  }
}
