class Solution {
  int maxJumps(List<int> arr, int d) {
    int n = arr.length;
    List<int> dp = List.filled(n, -1);

    int dfs(int i) {
      if (dp[i] != -1) return dp[i];

      int best = 1;

      // Right scan
      for (int nxt = i + 1; nxt <= (n - 1 < i + d ? n - 1 : i + d); nxt++) {
        if (arr[nxt] >= arr[i]) break;
        int cur = 1 + dfs(nxt);
        if (cur > best) best = cur;
      }

      // Left scan
      for (int nxt = i - 1; nxt >= (0 > i - d ? 0 : i - d); nxt--) {
        if (arr[nxt] >= arr[i]) break;
        int cur = 1 + dfs(nxt);
        if (cur > best) best = cur;
      }

      dp[i] = best;
      return dp[i];
    }

    int result = 0;
    for (int i = 0; i < n; i++) {
      int cur = dfs(i);
      if (cur > result) result = cur;
    }
    return result;
  }
}
