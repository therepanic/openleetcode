class Solution {
  int maxWidthOfVerticalArea(List<List<int>> points) {
    int maxWidth = 0;
    points.sort((a, b) => a[0].compareTo(b[0]));
    for (int i = 0; i < points.length - 1; i++) {
      int width = points[i+1][0] - points[i][0];
      if (width > maxWidth) maxWidth = width;
    }
    return maxWidth;
  }
}
