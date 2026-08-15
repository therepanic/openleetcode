public class Solution {
    public int MinimumXORSum(int[] nums1, int[] nums2) {
        int n = nums1.Length;
        int fullMask = 1 << n;
        int[] dp = new int[fullMask];
        for (int i = 0; i < fullMask; i++) dp[i] = 2147483647;
        dp[0] = 0;
        for (int mask = 0; mask < fullMask; mask++) {
            int idx = Convert.ToString(mask, 2).Count(c => c == '1');
            if (idx >= n) continue;
            for (int j = 0; j < n; j++) {
                if ((mask & (1 << j)) == 0) {
                    int nextMask = mask | (1 << j);
                    int cost = dp[mask] + (nums1[idx] ^ nums2[j]);
                    if (cost < dp[nextMask]) {
                        dp[nextMask] = cost;
                    }
                }
            }
        }
        return dp[fullMask - 1];
    }
}
