class Solution {
  int minimumEffortPath(List<List<int>> heights) {
    if (heights.isEmpty) return 0;
    int rows = heights.length, cols = heights[0].length;
    PriorityQueue<List<int>> pq = PriorityQueue<List<int>>((a, b) => a[0] - b[0]);
    pq.add([0, 0, 0]);
    int maxEffort = 0;
    Set<String> visited = {};
    List<List<int>> dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    while (pq.isNotEmpty) {
      List<int> curr = pq.removeFirst();
      int effort = curr[0], r = curr[1], c = curr[2];
      maxEffort = max(maxEffort, effort);
      if (r == rows - 1 && c == cols - 1) return maxEffort;
      String key = '$r,$c';
      if (visited.contains(key)) continue;
      visited.add(key);
      for (List<int> d in dirs) {
        int nr = r + d[0], nc = c + d[1];
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited.contains('$nr,$nc')) {
          int newEffort = (heights[nr][nc] - heights[r][c]).abs();
          pq.add([newEffort, nr, nc]);
        }
      }
    }
    return maxEffort;
  }
}
