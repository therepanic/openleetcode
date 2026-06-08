class Solution {
  int largestRectangleArea(List<int> heights) {
    final stack = <int>[];
    var ans = 0;
    for (var i = 0; i <= heights.length; i++) {
      final cur = i == heights.length ? 0 : heights[i];
      while (stack.isNotEmpty && heights[stack.last] > cur) {
        final h = heights[stack.removeLast()];
        final left = stack.isEmpty ? -1 : stack.last;
        final area = h * (i - left - 1);
        if (area > ans) ans = area;
      }
      stack.add(i);
    }
    return ans;
  }
}
