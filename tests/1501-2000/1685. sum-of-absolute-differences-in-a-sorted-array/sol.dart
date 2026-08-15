class Solution {
  List<int> getSumAbsoluteDifferences(List<int> nums) {
    final n = nums.length;
    final prefix = List<int>.filled(n, 0);
    prefix[0] = nums[0];
    for (var i = 1; i < n; i++) {
      prefix[i] = prefix[i - 1] + nums[i];
    }
    final result = <int>[];
    for (var i = 0; i < n; i++) {
      final left = i == 0 ? 0 : prefix[i - 1];
      final right = prefix[n - 1] - prefix[i];
      result.add(right - left + (2 * i - n + 1) * nums[i]);
    }
    return result;
  }
}
