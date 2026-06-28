class Solution {
    public int minimumDeleteSum(String s1, String s2) {
        int n = s1.length(), m = s2.length();
        int[][] dp = new int[n + 1][m + 1];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (s1.charAt(i) == s2.charAt(j)) {
                    dp[i + 1][j + 1] = dp[i][j] + (int) s1.charAt(i);
                } else {
                    dp[i + 1][j + 1] = Math.max(dp[i][j + 1], dp[i + 1][j]);
                }
            }
        }
        int totalAscii = 0;
        for (int i = 0; i < n; i++) totalAscii += (int) s1.charAt(i);
        for (int j = 0; j < m; j++) totalAscii += (int) s2.charAt(j);
        return totalAscii - 2 * dp[n][m];
    }
}
