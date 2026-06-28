class Solution {
  int maxChunksToSorted(List<int> arr) {
    List<int> stack = [];
    for (final value in arr) {
      int currentMax = value;
      while (stack.isNotEmpty && stack.last > value) {
        int top = stack.removeLast();
        if (top > currentMax) {
          currentMax = top;
        }
      }
      stack.add(currentMax);
    }
    return stack.length;
  }
}
