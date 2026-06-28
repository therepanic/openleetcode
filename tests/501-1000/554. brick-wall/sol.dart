class Solution {
  int leastBricks(List<List<int>> wall) {
    Map<int, int> edgeCounts = {};
    for (var row in wall) {
      int edge = 0;
      for (int i = 0; i < row.length - 1; i++) {
        edge += row[i];
        edgeCounts[edge] = (edgeCounts[edge] ?? 0) + 1;
      }
    }
    int maxEdges = 0;
    for (var count in edgeCounts.values) {
      if (count > maxEdges) {
        maxEdges = count;
      }
    }
    return wall.length - maxEdges;
  }
}
