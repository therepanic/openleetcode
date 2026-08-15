class Solution {
  int rearrangeSticks(int n, int k) {
    const mod = 1000000007;
    List<int> dp = List.filled(k + 1, 0);
    dp[0] = 1;
    for (int length = 1; length <= n; length++) {
      List<int> nxt = List.filled(k + 1, 0);
      for (int visible = 1; visible <= (length < k ? length : k); visible++) {
        nxt[visible] = (dp[visible - 1] + (length - 1) * dp[visible]) % mod;
      }
      dp = nxt;
    }
    return dp[k];
  }
}
