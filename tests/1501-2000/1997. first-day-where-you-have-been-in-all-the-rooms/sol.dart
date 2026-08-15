class Solution {
  int firstDayBeenInAllRooms(List<int> nextVisit) {
    const MOD = 1000000007;
    int n = nextVisit.length;
    List<int> dp = List.filled(n, 0);

    for (int i = 1; i < n; i++) {
      dp[i] = (2 * dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD;
    }
    
    return dp[n-1];
  }
}
