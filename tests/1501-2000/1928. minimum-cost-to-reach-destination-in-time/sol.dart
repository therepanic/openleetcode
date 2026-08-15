class Solution {
  int minCost(int maxTime, List<List<int>> edges, List<int> passingFees) {
    int n = passingFees.length;
    List<List<List<int>>> graph = List.generate(n, (_) => []);
    for (var e in edges) {
      graph[e[0]].add([e[1], e[2]]);
      graph[e[1]].add([e[0], e[2]]);
    }
    List<int> times = List.filled(n, maxTime + 1);
    List<int> costs = List.filled(n, 1 << 31 - 1); // large
    times[0] = 0;
    costs[0] = passingFees[0];
    // simple priority queue using list and sort
    List<List<int>> pq = [[passingFees[0], 0, 0]];
    while (pq.isNotEmpty) {
      // find min
      int minIdx = 0;
      for (int i = 1; i < pq.length; i++) {
        if (pq[i][0] < pq[minIdx][0] || (pq[i][0] == pq[minIdx][0] && pq[i][1] < pq[minIdx][1])) {
          minIdx = i;
        }
      }
      var cur = pq.removeAt(minIdx);
      int cost = cur[0], time = cur[1], city = cur[2];
      if (city == n - 1) return cost;
      for (var nb in graph[city]) {
        int nxt = nb[0], t = nb[1];
        int nt = time + t;
        if (nt > maxTime) continue;
        int nc = cost + passingFees[nxt];
        if (nc < costs[nxt] || nt < times[nxt]) {
          costs[nxt] = nc;
          times[nxt] = nt;
          pq.add([nc, nt, nxt]);
        }
      }
    }
    return -1;
  }
}
