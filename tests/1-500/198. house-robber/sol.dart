class Solution {
  int rob(List<int> nums) {
    var next1 = 0;
    var next2 = 0;
    for (var i = nums.length - 1; i >= 0; i--) {
      final curr = (nums[i] + next2 > next1) ? nums[i] + next2 : next1;
      next2 = next1;
      next1 = curr;
    }
    return next1;
  }
}
