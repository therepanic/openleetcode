class Solution {
  int heightChecker(List<int> heights) {
    int count = 0;
    List<int> s = List.from(heights);
    s.sort();
    for (int i = 0; i < heights.length; i++) {
      if (heights[i] != s[i]) {
        count++;
      }
    }
    return count;
  }
}
