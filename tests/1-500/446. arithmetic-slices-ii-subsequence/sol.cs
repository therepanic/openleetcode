public class Solution {
    public int NumberOfArithmeticSlices(int[] nums) {
        int n = nums.Length;
        int totalCount = 0;
        var dp = new Dictionary<long, int>[n];
        for (int i = 0; i < n; i++) {
            dp[i] = new Dictionary<long, int>();
        }

        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                long diff = (long)nums[i] - nums[j];
                dp[i][diff] = dp[i].GetValueOrDefault(diff, 0) + 1;
                if (dp[j].ContainsKey(diff)) {
                    int cnt = dp[j][diff];
                    dp[i][diff] += cnt;
                    totalCount += cnt;
                }
            }
        }

        return totalCount;
    }
}
