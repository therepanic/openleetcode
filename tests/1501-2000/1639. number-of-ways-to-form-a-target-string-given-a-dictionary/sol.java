class Solution {
    public int numWays(String[] words, String target) {
        final int MOD = 1_000_000_007;
        int m = words[0].length();
        int[][] A = new int[m][26];
        for (String word : words) {
            for (int j = 0; j < m; j++) {
                A[j][word.charAt(j) - 'a']++;
            }
        }
        int[][] dp = new int[m][target.length()];
        for (int[] row : dp) Arrays.fill(row, -1);
        return (int) solve(0, 0, A, target, dp, MOD);
    }
    private long solve(int i, int j, int[][] A, String target, int[][] dp, int MOD) {
        if (j == target.length()) return 1;
        if (i == A.length) return 0;
        if (dp[i][j] != -1) return dp[i][j];
        long count = solve(i+1, j, A, target, dp, MOD) % MOD;
        count = (count + (long)A[i][target.charAt(j)-'a'] * solve(i+1, j+1, A, target, dp, MOD)) % MOD;
        dp[i][j] = (int)count;
        return count;
    }
}
