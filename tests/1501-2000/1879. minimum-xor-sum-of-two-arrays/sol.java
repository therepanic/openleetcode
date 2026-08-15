class Solution {
    public int minimumXORSum(int[] nums1, int[] nums2) {
        int n = nums1.length;
        int fullMask = 1 << n;
        int[] dp = new int[fullMask];
        Arrays.fill(dp, Integer.MAX_VALUE);
        dp[0] = 0;
        for (int mask = 0; mask < fullMask; mask++) {
            int idx = Integer.bitCount(mask);
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
