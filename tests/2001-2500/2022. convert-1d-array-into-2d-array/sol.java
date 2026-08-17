class Solution {
    public int[][] construct2DArray(int[] original, int m, int n) {
        int k = original.length;
        if (m * n != k) return new int[0][0];
        int[][] ans = new int[m][n];
        int idx = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                ans[i][j] = original[idx++];
            }
        }
        return ans;
    }
}
