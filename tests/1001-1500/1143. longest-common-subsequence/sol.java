class Solution {
    public int longestCommonSubsequence(String text1, String text2) {
        int m = text1.length();
        int n = text2.length();
        int[][] memo = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                memo[i][j] = -1;
            }
        }
        return solve(0, 0, text1, text2, memo, m, n);
    }

    private int solve(int i, int j, String text1, String text2, int[][] memo, int m, int n) {
        if (i >= m || j >= n) return 0;
        if (memo[i][j] != -1) return memo[i][j];

        if (text1.charAt(i) == text2.charAt(j)) {
            memo[i][j] = 1 + solve(i + 1, j + 1, text1, text2, memo, m, n);
        } else {
            memo[i][j] = Math.max(solve(i + 1, j, text1, text2, memo, m, n),
                                  solve(i, j + 1, text1, text2, memo, m, n));
        }
        return memo[i][j];
    }
}
