class Solution {
  bool isPossibleDivide(List<int> nums, int k) {
    if (nums.length % k != 0) return false;
    final count = <int, int>{};
    for (final num in nums) {
      count[num] = (count[num] ?? 0) + 1;
    }
    nums.sort();
    for (final num in nums) {
      if (count[num] == 0) continue;
      for (int i = 0; i < k; i++) {
        final cur = num + i;
        if ((count[cur] ?? 0) == 0) return false;
        count[cur] = count[cur]! - 1;
      }
    }
    return true;
  }
}
