class Solution {
  bool isEscapePossible(List<List<int>> blocked, List<int> source, List<int> target) {
    var blockedSet = blocked.map((b) => '${b[0]},${b[1]}').toSet();
    int MAX = blocked.length * blocked.length ~/ 2;
    var dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]];

    bool bfs(List<int> start, List<int> end) {
      var visited = <String>{};
      var queue = <List<int>>[];
      queue.add(start);
      visited.add('${start[0]},${start[1]}');
      int count = 0;

      while (queue.isNotEmpty) {
        var cur = queue.removeAt(0);
        int x = cur[0], y = cur[1];
        if (x == end[0] && y == end[1]) return true;
        if (count > MAX) return true;

        for (var dir in dirs) {
          int nx = x + dir[0];
          int ny = y + dir[1];
          var key = '$nx,$ny';
          if (nx >= 0 && nx < 1000000 && ny >= 0 && ny < 1000000 && !visited.contains(key) && !blockedSet.contains(key)) {
            visited.add(key);
            queue.add([nx, ny]);
          }
        }
        count++;
      }
      return false;
    }

    return bfs(source, target) && bfs(target, source);
  }
}
