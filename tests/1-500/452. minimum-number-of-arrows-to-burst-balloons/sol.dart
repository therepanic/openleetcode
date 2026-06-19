class Solution {
  int findMinArrowShots(List<List<int>> points) {
    points.sort((a, b) => a[1].compareTo(b[1]));
    int arrows = 1;
    int end = points[0][1];
    for (var point in points) {
      if (point[0] > end) {
        arrows++;
        end = point[1];
      }
    }
    return arrows;
  }
}
