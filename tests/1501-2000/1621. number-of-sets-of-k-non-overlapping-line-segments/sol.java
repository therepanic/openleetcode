class Solution {
    public int numberOfSets(int n, int k) {
        long MOD = 1_000_000_007L;
        long[] dp_prev = new long[n];
        for (int i = 0; i < n; i++) dp_prev[i] = 1;
        
        long[] prefix_prev = new long[n];
        prefix_prev[0] = dp_prev[0];
        for (int i = 1; i < n; i++) {
            prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
        }
        
        for (int iter = 0; iter < k; iter++) {
            long[] dp_cur = new long[n];
            for (int i = 1; i < n; i++) {
                dp_cur[i] = (dp_cur[i-1] + prefix_prev[i-1]) % MOD;
            }
            dp_prev = dp_cur;
            prefix_prev[0] = dp_prev[0];
            for (int i = 1; i < n; i++) {
                prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
            }
        }
        
        return (int) dp_prev[n-1];
    }
}
