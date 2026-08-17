class Solution {
    public int numberOfCombinations(String num) {
        int n = num.length();
        long MOD = 1_000_000_007L;
        long[][] dp = new long[n][n + 1];
        for (int i = 0; i < n; i++) {
            if (num.charAt(i) != '0') {
                for (int j = i + 1; j <= n; j++) {
                    if (i == 0) {
                        dp[i][j] = 1;
                    } else {
                        int length = j - i;
                        dp[i][j] = dp[i][j - 1];
                        if (i - length >= 0 && num.substring(i - length, i).compareTo(num.substring(i, j)) <= 0) {
                            dp[i][j] += dp[i - length][i];
                        }
                        if (i - length + 1 >= 0 && num.substring(i - length + 1, i).compareTo(num.substring(i, j - 1)) > 0) {
                            dp[i][j] += dp[i - length + 1][i];
                        }
                        dp[i][j] %= MOD;
                    }
                }
            }
        }
        long ans = 0;
        for (int i = 0; i < n; i++) {
            ans = (ans + dp[i][n]) % MOD;
        }
        return (int)ans;
    }
}
