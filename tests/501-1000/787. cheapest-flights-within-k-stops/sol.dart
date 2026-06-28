import 'dart:collection';

class Solution {
  int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
    var matrix = List.generate(n, (_) => <List<int>>[]);
    for (var flight in flights) {
      int u = flight[0], v = flight[1], w = flight[2];
      matrix[u].add([v, w]);
    }

    var distance = List.filled(n, 1 << 31 - 1);
    distance[src] = 0;

    var queue = Queue<List<int>>();
    queue.add([src, 0]);
    int steps = 0;

    while (queue.isNotEmpty) {
      int level = queue.length;
      if (steps == k + 1) {
        break;
      }
      steps++;

      for (int i = 0; i < level; i++) {
        var curr = queue.removeFirst();
        int node = curr[0], dist = curr[1];

        for (var neighbor in matrix[node]) {
          int v = neighbor[0], w = neighbor[1];
          if (w + dist < distance[v]) {
            distance[v] = w + dist;
            queue.add([v, dist + w]);
          }
        }
      }
    }

    return distance[dst] == 1 << 31 - 1 ? -1 : distance[dst];
  }
}
