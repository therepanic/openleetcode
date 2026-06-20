class Solution {
  int maxProduct(List<int> nums) {
    var best = nums[0];
    var curMax = nums[0];
    var curMin = nums[0];
    for (var i = 1; i < nums.length; i++) {
      final x = nums[i];
      if (x < 0) {
        final temp = curMax;
        curMax = curMin;
        curMin = temp;
      }
      curMax = x > curMax * x ? x : curMax * x;
      curMin = x < curMin * x ? x : curMin * x;
      if (curMax > best) best = curMax;
    }
    return best;
  }
}
