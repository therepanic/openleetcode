class Solution {
  int minimumMoves(List<List<int>> grid) {
    int n = grid.length;
    if (n == 0 || grid[0].length < 2) {
      return -1;
    }
    if (grid[0][0] == 1 || grid[0][1] == 1 || grid[n - 1][n - 1] == 1) {
      return -1;
    }

    List<List<List<bool>>> visited =
        List.generate(n, (_) => List.generate(n, (_) => [false, false]));
    List<List<int>> queue = [
      [0, 0, 0, 0]
    ];
    int head = 0;
    visited[0][0][0] = true;

    while (head < queue.length) {
      List<int> state = queue[head++];
      int r = state[0];
      int c = state[1];
      int o = state[2];
      int dist = state[3];

      if (r == n - 1 && c == n - 2 && o == 0) {
        return dist;
      }

      if (o == 0) {
        if (c + 2 < n && grid[r][c + 2] == 0 && !visited[r][c + 1][0]) {
          visited[r][c + 1][0] = true;
          queue.add([r, c + 1, 0, dist + 1]);
        }
        if (r + 1 < n &&
            grid[r + 1][c] == 0 &&
            grid[r + 1][c + 1] == 0 &&
            !visited[r + 1][c][0]) {
          visited[r + 1][c][0] = true;
          queue.add([r + 1, c, 0, dist + 1]);
        }
        if (r + 1 < n &&
            c + 1 < n &&
            grid[r + 1][c] == 0 &&
            grid[r][c + 1] == 0 &&
            grid[r + 1][c + 1] == 0 &&
            !visited[r][c][1]) {
          visited[r][c][1] = true;
          queue.add([r, c, 1, dist + 1]);
        }
      } else {
        if (r + 2 < n && grid[r + 2][c] == 0 && !visited[r + 1][c][1]) {
          visited[r + 1][c][1] = true;
          queue.add([r + 1, c, 1, dist + 1]);
        }
        if (c + 1 < n &&
            grid[r][c + 1] == 0 &&
            grid[r + 1][c + 1] == 0 &&
            !visited[r][c + 1][1]) {
          visited[r][c + 1][1] = true;
          queue.add([r, c + 1, 1, dist + 1]);
        }
        if (r + 1 < n &&
            c + 1 < n &&
            grid[r + 1][c] == 0 &&
            grid[r][c + 1] == 0 &&
            grid[r + 1][c + 1] == 0 &&
            !visited[r][c][0]) {
          visited[r][c][0] = true;
          queue.add([r, c, 0, dist + 1]);
        }
      }
    }

    return -1;
  }
}
