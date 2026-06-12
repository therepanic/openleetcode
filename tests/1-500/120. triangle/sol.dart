
class Solution {
  int minimumTotal(List<List<int>> triangle) {
    final dp = List<int>.from(triangle.last);
    for (var row = triangle.length - 2; row >= 0; row--) {
      for (var col = 0; col < triangle[row].length; col++) {
        final left = dp[col];
        final right = dp[col + 1];
        dp[col] = triangle[row][col] + (left < right ? left : right);
      }
    }
    return dp[0];
  }
}
