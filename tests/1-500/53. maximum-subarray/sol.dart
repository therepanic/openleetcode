class Solution {
  int maxSubArray(List<int> nums) {
    var best = nums[0];
    var cur = 0;
    for (final n in nums) {
      if (cur < 0) cur = 0;
      cur += n;
      if (cur > best) best = cur;
    }
    return best;
  }
}
