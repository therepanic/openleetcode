class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    final rows = matrix.length;
    final cols = matrix[0].length;
    var left = 0;
    var right = rows * cols - 1;

    while (left <= right) {
      final mid = left + ((right - left) ~/ 2);
      final value = matrix[mid ~/ cols][mid % cols];
      if (value == target) {
        return true;
      }
      if (value < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return false;
  }
}
