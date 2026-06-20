class Solution {
  int trapRainWater(List<List<int>> heightMap) {
    if (heightMap.isEmpty || heightMap.length < 3 || heightMap[0].length < 3) {
      return 0;
    }

    int m = heightMap.length, n = heightMap[0].length;
    List<List<bool>> visited = List.generate(m, (_) => List.filled(n, false));
    var heap = <List<int>>[];

    for (int i = 0; i < m; i++) {
      heap.add([heightMap[i][0], i, 0]);
      heap.add([heightMap[i][n - 1], i, n - 1]);
      visited[i][0] = visited[i][n - 1] = true;
    }
    for (int j = 0; j < n; j++) {
      heap.add([heightMap[0][j], 0, j]);
      heap.add([heightMap[m - 1][j], m - 1, j]);
      visited[0][j] = visited[m - 1][j] = true;
    }

    int result = 0;
    List<List<int>> directions = [[0, 1], [1, 0], [0, -1], [-1, 0]];

    while (heap.isNotEmpty) {
      heap.sort((a, b) => a[0].compareTo(b[0]));
      var cell = heap.removeAt(0);
      int height = cell[0], x = cell[1], y = cell[2];

      for (var dir in directions) {
        int nx = x + dir[0], ny = y + dir[1];
        if (nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny]) {
          result += (height - heightMap[nx][ny]).clamp(0, 9999999);
          heap.add([height > heightMap[nx][ny] ? height : heightMap[nx][ny], nx, ny]);
          visited[nx][ny] = true;
        }
      }
    }

    return result;
  }
}
