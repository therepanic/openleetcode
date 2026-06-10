class Solution {
  int maximumGap(List<int> nums) {
    if (nums.length < 2) return 0;
    nums.sort();
    var best = 0;
    for (var i = 1; i < nums.length; i++) {
      final gap = nums[i] - nums[i - 1];
      if (gap > best) best = gap;
    }
    return best;
  }
}
