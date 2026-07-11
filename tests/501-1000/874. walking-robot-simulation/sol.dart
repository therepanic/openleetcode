class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    var blocked = <String>{};
    for (var o in obstacles) {
      blocked.add("${o[0]},${o[1]}");
    }

    var directions = [
      [0, 1], [1, 0], [0, -1], [-1, 0]
    ];

    int x = 0, y = 0;
    int dir = 0;
    int maxDist = 0;

    for (var cmd in commands) {
      if (cmd == -1) {
        dir = (dir + 1) % 4;
      } else if (cmd == -2) {
        dir = (dir + 3) % 4;
      } else {
        while (cmd > 0) {
          int nx = x + directions[dir][0];
          int ny = y + directions[dir][1];

          if (blocked.contains("$nx,$ny")) {
            break;
          }

          x = nx;
          y = ny;

          int dist = x * x + y * y;
          if (dist > maxDist) {
            maxDist = dist;
          }
          cmd--;
        }
      }
    }

    return maxDist;
  }
}
