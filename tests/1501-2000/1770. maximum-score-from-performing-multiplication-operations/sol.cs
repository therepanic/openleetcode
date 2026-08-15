public class Solution {
    public int MaximumScore(int[] nums, int[] multipliers) {
        int m = multipliers.Length;
        int?[][] dp = new int?[m + 1][];
        for (int i = 0; i <= m; i++) {
            dp[i] = new int?[m + 1];
        }
        
        Func<int, int, int> f = null;
        f = (i, j) => {
            int k = i + j;
            if (k == m) return 0;
            if (dp[i][j].HasValue) return dp[i][j].Value;
            
            int back = multipliers[k] * nums[nums.Length - 1 - j] + f(i, j + 1);
            int front = multipliers[k] * nums[i] + f(i + 1, j);
            int result = Math.Max(front, back);
            dp[i][j] = result;
            return result;
        };
        
        return f(0, 0);
    }
}
