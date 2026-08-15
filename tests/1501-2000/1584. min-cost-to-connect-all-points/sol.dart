import 'dart:collection';

class Solution {
  int minCostConnectPoints(List<List<int>> points) {
    int n = points.length;
    int minCost = 0;
    List<bool> visited = List.filled(n, false);
    PriorityQueue<List<int>> pq = PriorityQueue<List<int>>((a, b) => a[0] - b[0]);
    pq.add([0, 0]);
    Map<int, int> cache = {0: 0};
    
    while (pq.isNotEmpty) {
      List<int> curr = pq.removeFirst();
      int cost = curr[0], u = curr[1];
      if (visited[u]) continue;
      visited[u] = true;
      minCost += cost;
      for (int v = 0; v < n; v++) {
        if (!visited[v]) {
          int dist = (points[u][0] - points[v][0]).abs() + (points[u][1] - points[v][1]).abs();
          if (dist < (cache[v] ?? 1 << 31 - 1)) {
            cache[v] = dist;
            pq.add([dist, v]);
          }
        }
      }
    }
    return minCost;
  }
}
