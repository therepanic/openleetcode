class Solution {
  int minimumIncompatibility(List<int> nums, int k) {
    int n = nums.length;
    int sz = n ~/ k;
    
    Map<int, int> counts = {};
    for (int num in nums) {
      counts[num] = (counts[num] ?? 0) + 1;
    }
    for (int v in counts.values) {
      if (v > k) return -1;
    }
    
    nums.sort();
    
    Map<int, int> validSubsets = {};
    for (int mask = 0; mask < (1 << n); mask++) {
      if (mask.toRadixString(2).split('1').length - 1 == sz) {
        List<int> subset = [];
        for (int i = 0; i < n; i++) {
          if (((mask >> i) & 1) == 1) {
            subset.add(nums[i]);
          }
        }
        Set<int> set = subset.toSet();
        if (set.length == sz) {
          int maxVal = subset.reduce((a, b) => a > b ? a : b);
          int minVal = subset.reduce((a, b) => a < b ? a : b);
          validSubsets[mask] = maxVal - minVal;
        }
      }
    }
    
    Map<int, int> memo = {};
    int solve(int remainingMask) {
      if (remainingMask == 0) return 0;
      if (memo.containsKey(remainingMask)) return memo[remainingMask]!;
      
      int firstElement = (remainingMask & -remainingMask).bitLength - 1;
      int res = 1 << 30;
      
      validSubsets.forEach((mask, cost) {
        if ((mask & remainingMask) == mask && ((mask >> firstElement) & 1) == 1) {
          int next = solve(remainingMask ^ mask);
          if (next != 1 << 30) {
            res = res < cost + next ? res : cost + next;
          }
        }
      });
      
      memo[remainingMask] = res;
      return res;
    }
    
    int ans = solve((1 << n) - 1);
    return ans == 1 << 30 ? -1 : ans;
  }
}
