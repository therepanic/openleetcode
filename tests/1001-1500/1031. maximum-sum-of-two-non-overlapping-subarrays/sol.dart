class Solution {
  int maxSumTwoNoOverlap(List<int> nums, int firstLen, int secondLen) {
    final a = _solve(nums, firstLen, secondLen);
    final b = _solve(nums, secondLen, firstLen);
    return a >= b ? a : b;
  }

  int _solve(List<int> nums, int firstLen, int secondLen) {
    final n = nums.length;
    final prefix = List<int>.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + nums[i];
    }
    var bestA = prefix[firstLen];
    var ans = 0;
    for (int end = firstLen + secondLen; end <= n; end++) {
      bestA = bestA > prefix[end - secondLen] - prefix[end - secondLen - firstLen]
          ? bestA
          : prefix[end - secondLen] - prefix[end - secondLen - firstLen];
      final cur = bestA + prefix[end] - prefix[end - secondLen];
      if (cur > ans) ans = cur;
    }
    return ans;
  }
}
