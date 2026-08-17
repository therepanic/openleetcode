class Solution {
  List<int> countPoints(List<List<int>> points, List<List<int>> queries) {
    List<int> result = List.filled(queries.length, 0);
    for (int i = 0; i < queries.length; i++) {
      for (int j = 0; j < points.length; j++) {
        int dx = queries[i][0] - points[j][0];
        int dy = queries[i][1] - points[j][1];
        if (dx * dx + dy * dy <= queries[i][2] * queries[i][2]) {
          result[i]++;
        }
      }
    }
    return result;
  }
}
