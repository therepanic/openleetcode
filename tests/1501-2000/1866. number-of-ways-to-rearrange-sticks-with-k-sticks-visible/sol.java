class Solution {
    public int rearrangeSticks(int n, int k) {
        int mod = 1000000007;
        int[] dp = new int[k + 1];
        dp[0] = 1;
        for (int length = 1; length <= n; length++) {
            int[] nxt = new int[k + 1];
            for (int visible = 1; visible <= Math.min(length, k); visible++) {
                nxt[visible] = (int)(((long)dp[visible - 1] + (long)(length - 1) * dp[visible]) % mod);
            }
            dp = nxt;
        }
        return dp[k];
    }
}
