class Solution {
  int numberOfBoomerangs(List<List<int>> points) {
    int result = 0;
    for (var p in points) {
      Map<int, int> distances = {};
      for (var q in points) {
        int d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
        distances[d] = (distances[d] ?? 0) + 1;
      }
      for (var count in distances.values) {
        result += count * (count - 1);
      }
    }
    return result;
  }
}
