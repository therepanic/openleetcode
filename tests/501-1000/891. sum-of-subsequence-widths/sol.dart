class Solution {
  int sumSubseqWidths(List<int> nums) {
    const mod = 1000000007;
    nums.sort();
    int n = nums.length;
    int ans = 0;
    int factor = 1;
    for (int i = 0; i < n; i++) {
      ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod;
      factor = (factor * 2) % mod;
    }
    return ans;
  }
}
