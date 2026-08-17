class Solution {
  int minChanges(List<int> nums, int k) {
    Map<int, Map<int, int>> freq = {};
    for (int i = 0; i < nums.length; i++) {
      int rem = i % k;
      freq.putIfAbsent(rem, () => {}).update(nums[i], (v) => v + 1, ifAbsent: () => 1);
    }
    
    int n = 1 << 10;
    List<int> dp = List.filled(n, 0);
    for (int i = 1; i < n; i++) dp[i] = -(1 << 60);
    for (int i = 0; i < k; i++) {
      int mx = dp.reduce((a, b) => a > b ? a : b);
      List<int> tmp = List.filled(n, 0);
      for (int x = 0; x < n; x++) {
        int c = dp[x];
        freq[i]?.forEach((xx, cc) {
          int idx = x ^ xx;
          tmp[idx] = [tmp[idx], c + cc, mx].reduce((a, b) => a > b ? a : b);
        });
      }
      dp = tmp;
    }
    return nums.length - dp[0];
  }
}
