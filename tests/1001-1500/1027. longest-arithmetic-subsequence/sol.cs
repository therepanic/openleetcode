public class Solution {
    public int LongestArithSeqLength(int[] nums) {
        int n = nums.Length;
        if (n <= 2) {
            return n;
        }
        Dictionary<int, int>[] dp = new Dictionary<int, int>[n];
        for (int i = 0; i < n; i++) {
            dp[i] = new Dictionary<int, int>();
        }
        int ans = 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                int d = nums[i] - nums[j];
                int prev = dp[j].ContainsKey(d) ? dp[j][d] : 1;
                int current = prev + 1;
                if (!dp[i].ContainsKey(d) || current > dp[i][d]) {
                    dp[i][d] = current;
                }
                ans = Math.Max(ans, dp[i][d]);
            }
        }
        return ans;
    }
}
