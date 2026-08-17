class Solution {
  int minimumDifference(List<int> nums, int k) {
    nums.sort();
    int n = nums.length;
    int ans = nums[k - 1] - nums[0];
    for (int i = 0; i <= n - k; i++) {
      ans = ans < nums[i + k - 1] - nums[i] ? ans : nums[i + k - 1] - nums[i];
    }
    return ans;
  }
}
