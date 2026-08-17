import 'dart:collection';

class _BfsResult {
  final int last;
  final int distance;
  _BfsResult(this.last, this.distance);
}

class Solution {
  List<int> countSubgraphsForEachDiameter(int n, List<List<int>> edges) {
    final graph = List.generate(n, (_) => <int>[]);
    for (final e in edges) {
      final u = e[0] - 1;
      final v = e[1] - 1;
      graph[u].add(v);
      graph[v].add(u);
    }
    final answer = List<int>.filled(n - 1, 0);
    for (var mask = 1; mask < (1 << n); mask++) {
      if ((mask & (mask - 1)) == 0) continue;
      final start = _lowestBit(mask);
      final seen = List<bool>.filled(n, false);
      final queue = Queue<int>()..add(start);
      seen[start] = true;
      var count = 1;
      while (queue.isNotEmpty) {
        final u = queue.removeFirst();
        for (final v in graph[u]) {
          if (((mask >> v) & 1) != 0 && !seen[v]) {
            seen[v] = true;
            count++;
            queue.add(v);
          }
        }
      }
      if (count != mask.bitLength - 1 + _popcount(mask) - (mask.bitLength - 1)) continue;
      final first = _bfs(start, mask, graph, n);
      final diameter = _bfs(first.last, mask, graph, n).distance;
      if (diameter > 0) answer[diameter - 1]++;
    }
    return answer;
  }

  int _lowestBit(int mask) {
    var i = 0;
    while (((mask >> i) & 1) == 0) i++;
    return i;
  }

  int _popcount(int mask) {
    var count = 0;
    while (mask != 0) {
      count += mask & 1;
      mask >>= 1;
    }
    return count;
  }

  _BfsResult _bfs(int start, int mask, List<List<int>> graph, int n) {
    final dist = List<int>.filled(n, -1);
    final queue = Queue<int>()..add(start);
    dist[start] = 0;
    var last = start;
    while (queue.isNotEmpty) {
      final u = queue.removeFirst();
      last = u;
      for (final v in graph[u]) {
        if (((mask >> v) & 1) != 0 && dist[v] == -1) {
          dist[v] = dist[u] + 1;
          queue.add(v);
        }
      }
    }
    return _BfsResult(last, dist[last]);
  }
}
