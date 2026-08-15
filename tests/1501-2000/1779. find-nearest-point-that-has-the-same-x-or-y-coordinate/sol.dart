class Solution {
  int nearestValidPoint(int x, int y, List<List<int>> points) {
    int currentMinDistance = 20001;
    int currentMinIndex = -1;
    for (int i = 0; i < points.length; i++) {
      int a = points[i][0];
      int b = points[i][1];
      if (x == a || y == b) {
        int distance = (x - a).abs() + (y - b).abs();
        if (distance < currentMinDistance) {
          currentMinDistance = distance;
          currentMinIndex = i;
        }
      }
    }
    return currentMinIndex;
  }
}
