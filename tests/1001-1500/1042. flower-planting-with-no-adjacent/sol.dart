class Solution {
  List<int> gardenNoAdj(int n, List<List<int>> paths) {
    Map<int, List<int>> graph = {};
    
    for (var path in paths) {
      int u = path[0];
      int v = path[1];
      graph.putIfAbsent(u, () => []);
      graph.putIfAbsent(v, () => []);
      graph[u]!.add(v);
      graph[v]!.add(u);
    }
    
    for (int node = 1; node <= n; node++) {
      graph.putIfAbsent(node, () => []);
    }
    
    List<int> answer = List.filled(n + 1, 0);
    
    for (int i = 1; i <= n; i++) {
      Set<int> used = {};
      for (var nei in graph[i]!) {
        used.add(answer[nei]);
      }
      
      for (int flower = 1; flower <= 4; flower++) {
        if (!used.contains(flower)) {
          answer[i] = flower;
          break;
        }
      }
    }
    
    return answer.sublist(1);
  }
}
