class Solution {
  List<int> canSeePersonsCount(List<int> heights) {
    int n = heights.length;
    List<int> result = List<int>.filled(n, 0);
    List<int> stack = [];

    for (int i = n-1; i >= 0; i--) {
      int height = heights[i];
      int visibility = 0;

      while (stack.isNotEmpty && height > stack.last) {
        stack.removeLast();
        visibility++;
      }

      if (stack.isNotEmpty) {
        visibility++;
      }

      result[i] = visibility;
      stack.add(height);
    }

    return result;
  }
}
