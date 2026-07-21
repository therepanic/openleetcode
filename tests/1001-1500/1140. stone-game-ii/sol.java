class Solution {
    public int stoneGameII(int[] piles) {
        int n = piles.length;
        int[] suffix = new int[n + 1];
        for (int i = n - 1; i >= 0; i--) {
            suffix[i] = suffix[i + 1] + piles[i];
        }
        int[][] memo = new int[n][n + 1];
        for (int i = 0; i < n; i++) {
            java.util.Arrays.fill(memo[i], -1);
        }
        return best(0, 1, piles, suffix, memo);
    }
    
    private int best(int i, int m, int[] piles, int[] suffix, int[][] memo) {
        int n = piles.length;
        if (i >= n) {
            return 0;
        }
        if (memo[i][m] != -1) {
            return memo[i][m];
        }
        int answer = 0;
        for (int x = 1; x <= Math.min(2 * m, n - i); x++) {
            answer = Math.max(answer, suffix[i] - best(i + x, Math.max(m, x), piles, suffix, memo));
        }
        memo[i][m] = answer;
        return answer;
    }
}
