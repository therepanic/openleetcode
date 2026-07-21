class Solution {
  List<int> shuffle(List<int> nums, int n) {
    final result = List<int>.filled(2 * n, 0);
    for (int i = 0; i < n; i++) {
      result[2 * i] = nums[i];
      result[2 * i + 1] = nums[n + i];
    }
    return result;
  }
}
