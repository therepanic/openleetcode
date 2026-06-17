class Solution {
  List<int> largestDivisibleSubset(List<int> nums) {
    nums.sort();
    int n = nums.length;
    List<int> dp = List.filled(n, 1);
    List<int> prev = List.filled(n, -1);
    int maxi = 0;
    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1) {
          dp[i] = dp[j] + 1;
          prev[i] = j;
        }
      }
      if (dp[i] > dp[maxi]) {
        maxi = i;
      }
    }
    List<int> res = [];
    for (int i = maxi; i >= 0; i = prev[i]) {
      res.add(nums[i]);
    }
    return res.reversed.toList();
  }
}
