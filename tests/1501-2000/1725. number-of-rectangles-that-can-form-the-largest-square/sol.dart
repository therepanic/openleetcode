class Solution {
  int countGoodRectangles(List<List<int>> rectangles) {
    int best = 0;
    for (final rectangle in rectangles) {
      final side = rectangle[0] < rectangle[1] ? rectangle[0] : rectangle[1];
      if (side > best) best = side;
    }
    int count = 0;
    for (final rectangle in rectangles) {
      final side = rectangle[0] < rectangle[1] ? rectangle[0] : rectangle[1];
      if (side == best) count++;
    }
    return count;
  }
}
