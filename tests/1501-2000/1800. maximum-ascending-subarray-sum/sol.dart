class Solution {
  int maxAscendingSum(List<int> nums) {
    int curr = nums[0], ans = nums[0];
    for (int i = 1; i < nums.length; i++) {
      curr = nums[i] > nums[i-1] ? curr + nums[i] : nums[i];
      if (curr > ans) ans = curr;
    }
    return ans;
  }
}
