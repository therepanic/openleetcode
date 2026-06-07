class Solution {
  bool canJump(List<int> nums) {
    var farthest = 0;
    for (var i = 0; i < nums.length; i++) {
      if (i > farthest) {
        return false;
      }
      if (i + nums[i] > farthest) {
        farthest = i + nums[i];
      }
      if (farthest >= nums.length - 1) {
        return true;
      }
    }
    return true;
  }
}
