public class Solution {
    public int[][] Construct2DArray(int[] original, int m, int n) {
        int k = original.Length;
        if (m * n != k) return new int[0][];
        int[][] ans = new int[m][];
        for (int i = 0; i < m; i++) {
            ans[i] = new int[n];
            for (int j = 0; j < n; j++) {
                ans[i][j] = original[i * n + j];
            }
        }
        return ans;
    }
}
