class Solution {
  bool canPartitionKSubsets(List<int> nums, int k) {
    int total = nums.reduce((a, b) => a + b);
    if (total % k != 0) return false;
    int target = total ~/ k;
    nums.sort((a, b) => b.compareTo(a));
    if (nums[0] > target) return false;
    int n = nums.length;
    Map<int, bool> memo = {};
    
    bool dfs(int used, int curr) {
      if (used == (1 << n) - 1) return true;
      int key = (used << 10) | curr;
      if (memo.containsKey(key)) return memo[key]!;
      for (int i = 0; i < n; i++) {
        if (((used >> i) & 1) == 0 && curr + nums[i] <= target) {
          int newCurr = curr + nums[i];
          int nxt = newCurr == target ? 0 : newCurr;
          if (dfs(used | (1 << i), nxt)) {
            memo[key] = true;
            return true;
          }
        }
      }
      memo[key] = false;
      return false;
    }
    
    return dfs(0, 0);
  }
}
