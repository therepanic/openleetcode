class Solution {
  int shortestPath(List<List<int>> grid, int k) {
    int n = grid.length, m = grid[0].length;
    var q = Queue();
    q.add([0, 0, k, 0]);
    var visi = <String>{};
    visi.add("0,0,$k");
    var dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]];
    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int r = cur[0], c = cur[1], kRem = cur[2], d = cur[3];
      if (r == n - 1 && c == m - 1) return d;
      if (grid[r][c] == 1) kRem--;
      for (var dir in dirs) {
        int nr = r + dir[0], nc = c + dir[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
          var key = "$nr,$nc,$kRem";
          if (!visi.contains(key) && kRem >= 0) {
            visi.add(key);
            q.add([nr, nc, kRem, d + 1]);
          }
        }
      }
    }
    return -1;
  }
}

class Queue {
  final List<List<int>> _list = [];
  void add(List<int> val) => _list.add(val);
  bool get isNotEmpty => _list.isNotEmpty;
  List<int> removeFirst() => _list.removeAt(0);
}
