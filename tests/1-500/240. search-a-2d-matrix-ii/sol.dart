class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    bool found = false;
    for (final row in matrix) {
      for (final value in row) {
        if (value == target) {
          found = true;
        }
      }
    }
    return found;
  }
}
