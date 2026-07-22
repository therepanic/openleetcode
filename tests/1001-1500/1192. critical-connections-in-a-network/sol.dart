class Solution {
  List<List<int>> criticalConnections(int n, List<List<int>> connections) {
    List<List<int>> graph = List.generate(n, (_) => []);
    for (var edge in connections) {
      int u = edge[0], v = edge[1];
      graph[u].add(v);
      graph[v].add(u);
    }
    
    List<int> disc = List.filled(n, -1);
    List<int> low = List.filled(n, 0);
    int timer = 0;
    List<List<int>> bridges = [];
    List<int> iterIdx = List.filled(n, 0);
    
    for (int start = 0; start < n; start++) {
      if (disc[start] != -1) continue;
      
      List<List<int>> stack = [];
      disc[start] = timer;
      low[start] = timer;
      timer++;
      stack.add([start, -1]);
      
      while (stack.isNotEmpty) {
        var top = stack.last;
        int node = top[0], parent = top[1];
        var neighbors = graph[node];
        
        if (iterIdx[node] < neighbors.length) {
          int nb = neighbors[iterIdx[node]];
          iterIdx[node]++;
          if (nb == parent) continue;
          
          if (disc[nb] == -1) {
            disc[nb] = timer;
            low[nb] = timer;
            timer++;
            stack.add([nb, node]);
          } else {
            low[node] = low[node] < disc[nb] ? low[node] : disc[nb];
          }
        } else {
          stack.removeLast();
          if (stack.isNotEmpty) {
            int par = stack.last[0];
            low[par] = low[par] < low[node] ? low[par] : low[node];
            if (low[node] > disc[par]) {
              bridges.add([par, node]);
            }
          }
        }
      }
    }
    
    return bridges;
  }
}
