class Solution {
  int minFlips(List<List<int>> mat) {
    final m = mat.length;
    final n = mat[0].length;
    final masks = <int>[];
    const dirs = [
      [0, 0],
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];

    for (var r = 0; r < m; r++) {
      for (var c = 0; c < n; c++) {
        var mask = 0;
        for (final d in dirs) {
          final nr = r + d[0];
          final nc = c + d[1];
          if (nr >= 0 && nr < m && nc >= 0 && nc < n) {
            mask |= 1 << (nr * n + nc);
          }
        }
        masks.add(mask);
      }
    }

    var start = 0;
    for (var r = 0; r < m; r++) {
      for (var c = 0; c < n; c++) {
        if (mat[r][c] == 1) {
          start |= 1 << (r * n + c);
        }
      }
    }

    final size = 1 << (m * n);
    final dist = List<int>.filled(size, -1);
    final q = <int>[start];
    dist[start] = 0;

    for (var head = 0; head < q.length; head++) {
      final state = q[head];
      final steps = dist[state];
      if (state == 0) {
        return steps;
      }
      for (final mask in masks) {
        final next = state ^ mask;
        if (dist[next] == -1) {
          dist[next] = steps + 1;
          q.add(next);
        }
      }
    }

    return -1;
  }
}
