class Solution {
  String largestNumber(List<int> cost, int target) {
    int N = cost.length;
    List<List<int>> memo = List.generate(N + 1, (_) => List.filled(target + 1, -1));
    
    int helper(int i, int c) {
      if (c == 0) return 0;
      if (i == N || c < 0) return -9223372036854775808;
      if (memo[i][c] != -1) return memo[i][c];
      int take = helper(i, c - cost[i]);
      if (take != -9223372036854775808) take += 1;
      int notTake = helper(i + 1, c);
      memo[i][c] = take > notTake ? take : notTake;
      return memo[i][c];
    }
    
    int e = helper(0, target);
    if (e == -9223372036854775808) return "0";
    
    StringBuffer s = StringBuffer();
    int t = target;
    for (int k = 0; k < e; k++) {
      for (int j = 9; j >= 1; j--) {
        if (cost[j-1] <= t && helper(0, t - cost[j-1]) == e - k - 1) {
          t -= cost[j-1];
          s.write(j.toString());
          break;
        }
      }
    }
    return s.toString();
  }
}
