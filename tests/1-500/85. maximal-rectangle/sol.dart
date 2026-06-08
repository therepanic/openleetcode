class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    if (matrix.isEmpty || matrix[0].isEmpty) return 0;
    final cols = matrix[0].length;
    final heights = List.filled(cols, 0);
    var ans = 0;
    for (final row in matrix) {
      for (var c = 0; c < cols; c++) {
        heights[c] = row[c] == '1' ? heights[c] + 1 : 0;
      }
      final area = _largest(heights);
      if (area > ans) ans = area;
    }
    return ans;
  }

  int _largest(List<int> heights) {
    final stack = <int>[];
    var best = 0;
    for (var i = 0; i <= heights.length; i++) {
      final cur = i == heights.length ? 0 : heights[i];
      while (stack.isNotEmpty && heights[stack.last] > cur) {
        final h = heights[stack.removeLast()];
        final left = stack.isEmpty ? -1 : stack.last;
        final area = h * (i - left - 1);
        if (area > best) best = area;
      }
      stack.add(i);
    }
    return best;
  }
}
