class Solution {
    public int numberOfArrays(String s, int k) {
        int mod = 1000000007;
        int n = s.length();
        int[] dp = new int[n + 1];
        dp[0] = 1;
        int width = String.valueOf(k).length();
        for (int i = 0; i < n; i++) {
            if (s.charAt(i) == '0' || dp[i] == 0) continue;
            long value = 0;
            for (int j = i; j < Math.min(n, i + width); j++) {
                value = value * 10 + (s.charAt(j) - '0');
                if (value > k) break;
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod;
            }
        }
        return dp[n];
    }
}
