class Solution {
    int n;
    int[][] dp;
    int[] nums;
    public int maxScore(int[] nums) {
        this.nums = nums;
        n = nums.length;
        dp = new int[1 << n][n/2 + 1];
        for (int i = 0; i < (1 << n); ++i) Arrays.fill(dp[i], -1);
        return dfs(0, 1);
    }
    int dfs(int mask, int op) {
        if (mask == (1 << n) - 1) return 0;
        if (dp[mask][op] != -1) return dp[mask][op];
        int ans = 0;
        for (int i = 0; i < n; ++i) {
            if ((mask & (1 << i)) == 0) {
                for (int j = 0; j < n; ++j) {
                    if (j != i && (mask & (1 << j)) == 0) {
                        int nmask = mask | (1 << i) | (1 << j);
                        ans = Math.max(ans, dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op);
                    }
                }
            }
        }
        return dp[mask][op] = ans;
    }
    int gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }
        return a;
    }
}
