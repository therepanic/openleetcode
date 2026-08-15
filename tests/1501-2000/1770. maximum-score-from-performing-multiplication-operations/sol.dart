class Solution {
  int maximumScore(List<int> nums, List<int> multipliers) {
    int m = multipliers.length;
    List<List<int?>> dp = List.generate(m + 1, (_) => List<int?>.filled(m + 1, null));
    
    int f(int i, int j) {
      int k = i + j;
      if (k == m) return 0;
      if (dp[i][j] != null) return dp[i][j]!;
      
      int back = multipliers[k] * nums[nums.length - 1 - j] + f(i, j + 1);
      int front = multipliers[k] * nums[i] + f(i + 1, j);
      int result = front > back ? front : back;
      dp[i][j] = result;
      return result;
    }
    
    return f(0, 0);
  }
}
