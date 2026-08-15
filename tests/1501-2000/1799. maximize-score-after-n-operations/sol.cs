public class Solution {
    int[][] dp;
    int[] nums;
    int n;
    public int MaxScore(int[] nums) {
        this.nums = nums;
        n = nums.Length;
        dp = new int[1 << n][];
        for (int i = 0; i < (1 << n); ++i) {
            dp[i] = new int[n/2 + 1];
            Array.Fill(dp[i], -1);
        }
        return Dfs(0, 1);
    }
    int Dfs(int mask, int op) {
        if (mask == (1 << n) - 1) return 0;
        if (dp[mask][op] != -1) return dp[mask][op];
        int ans = 0;
        for (int i = 0; i < n; ++i) {
            if ((mask & (1 << i)) == 0) {
                for (int j = 0; j < n; ++j) {
                    if (j != i && (mask & (1 << j)) == 0) {
                        int nmask = mask | (1 << i) | (1 << j);
                        ans = Math.Max(ans, Dfs(nmask, op + 1) + Gcd(nums[i], nums[j]) * op);
                    }
                }
            }
        }
        return dp[mask][op] = ans;
    }
    int Gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }
        return a;
    }
}
