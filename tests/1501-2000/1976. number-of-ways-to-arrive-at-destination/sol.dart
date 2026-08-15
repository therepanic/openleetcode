import 'dart:collection';

class Solution {
  int countPaths(int n, List<List<int>> roads) {
    List<List<List<int>>> graph = List.generate(n, (_) => []);
    for (var road in roads) {
      int u = road[0], v = road[1], time = road[2];
      graph[u].add([v, time]);
      graph[v].add([u, time]);
    }
    
    List<int> dist = List.filled(n, 1 << 60);
    List<int> ways = List.filled(n, 0);
    dist[0] = 0;
    ways[0] = 1;
    
    var pq = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    pq.add([0, 0]);
    
    int MOD = 1000000007;
    
    while (pq.isNotEmpty) {
      var curr = pq.removeFirst();
      int d = curr[0], node = curr[1];
      
      if (d > dist[node]) continue;
      
      for (var edge in graph[node]) {
        int neighbor = edge[0], time = edge[1];
        
        if (dist[node] + time < dist[neighbor]) {
          dist[neighbor] = dist[node] + time;
          ways[neighbor] = ways[node];
          pq.add([dist[neighbor], neighbor]);
        } else if (dist[node] + time == dist[neighbor]) {
          ways[neighbor] = (ways[neighbor] + ways[node]) % MOD;
        }
      }
    }
    
    return ways[n-1];
  }
}
