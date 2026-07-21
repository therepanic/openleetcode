class Solution {
    public int maxSizeSlices(int[] slices) {
        int n = slices.length;
        int m = n / 3;
        return Math.max(dp(slices, 0, n - 2, m), dp(slices, 1, n - 1, m));
    }

    private int dp(int[] slices, int start, int end, int m) {
        int k = end - start + 1;
        int[][] dp_table = new int[k + 1][m + 1];
        for (int i = 1; i <= k; i++) {
            for (int j = 1; j <= Math.min(i, m); j++) {
                dp_table[i][j] = Math.max(dp_table[i - 1][j], (i > 1 ? dp_table[i - 2][j - 1] : 0) + slices[start + i - 1]);
            }
        }
        return dp_table[k][m];
    }
}
