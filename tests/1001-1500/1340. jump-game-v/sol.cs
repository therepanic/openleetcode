public class Solution {
    public int MaxJumps(int[] arr, int d) {
        int n = arr.Length;
        int[] dp = new int[n];
        Array.Fill(dp, -1);

        int Dfs(int i) {
            if (dp[i] != -1) return dp[i];

            int best = 1;

            // Right scan
            for (int nxt = i + 1; nxt <= Math.Min(n - 1, i + d); nxt++) {
                if (arr[nxt] >= arr[i]) break;
                best = Math.Max(best, 1 + Dfs(nxt));
            }

            // Left scan
            for (int nxt = i - 1; nxt >= Math.Max(0, i - d); nxt--) {
                if (arr[nxt] >= arr[i]) break;
                best = Math.Max(best, 1 + Dfs(nxt));
            }

            dp[i] = best;
            return dp[i];
        }

        int result = 0;
        for (int i = 0; i < n; i++) {
            result = Math.Max(result, Dfs(i));
        }
        return result;
    }
}
