class Solution {
    public int colorTheGrid(int m, int n) {
        int mod = 1000000007;
        int total = 1;
        for (int i = 0; i < m; i++) total *= 3;
        int[][] dp = new int[n+1][total];
        int[][] rowValid = new int[total][total];
        java.util.List<Integer> good = new java.util.ArrayList<>();
        int[][] pattern = new int[total][m];
        for (int i = 0; i < total; i++) {
            int val = i;
            boolean valid = true;
            for (int k = 0; k < m; k++) {
                pattern[i][k] = val % 3;
                val /= 3;
            }
            for (int k = 1; k < m; k++) {
                if (pattern[i][k] == pattern[i][k-1]) {
                    valid = false;
                    break;
                }
            }
            if (valid) good.add(i);
        }
        for (int i : good) dp[1][i] = 1;
        for (int i : good) {
            for (int j : good) {
                rowValid[i][j] = 1;
                for (int k = 0; k < m; k++) {
                    if (pattern[i][k] == pattern[j][k]) {
                        rowValid[i][j] = 0;
                        break;
                    }
                }
            }
        }
        for (int col = 2; col <= n; col++) {
            for (int i : good) {
                long totalWays = 0;
                for (int j : good) {
                    if (rowValid[i][j] == 1) {
                        totalWays += dp[col-1][j];
                    }
                }
                dp[col][i] = (int)(totalWays % mod);
            }
        }
        long ans = 0;
        for (int i : good) ans += dp[n][i];
        return (int)(ans % mod);
    }
}
