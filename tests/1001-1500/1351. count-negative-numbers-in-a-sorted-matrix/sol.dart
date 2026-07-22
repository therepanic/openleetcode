class Solution {
  int countNegatives(List<List<int>> grid) {
    int count = 0;
    for (var row in grid) {
      for (var num in row) {
        if (num < 0) count++;
      }
    }
    return count;
  }
}
