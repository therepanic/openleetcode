class Solution {
  int minimumXORSum(List<int> nums1, List<int> nums2) {
    int n = nums1.length;
    int fullMask = 1 << n;
    List<int> dp = List.filled(fullMask, 2147483647);
    dp[0] = 0;
    for (int mask = 0; mask < fullMask; mask++) {
      int idx = mask.toRadixString(2).split('1').length - 1;
      if (idx >= n) continue;
      for (int j = 0; j < n; j++) {
        if ((mask & (1 << j)) == 0) {
          int nextMask = mask | (1 << j);
          int cost = dp[mask] + (nums1[idx] ^ nums2[j]);
          if (cost < dp[nextMask]) {
            dp[nextMask] = cost;
          }
        }
      }
    }
    return dp[fullMask - 1];
  }
}
