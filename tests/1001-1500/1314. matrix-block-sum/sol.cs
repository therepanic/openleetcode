public class Solution {
    public int[][] MatrixBlockSum(int[][] mat, int k) {
        int n = mat.Length, m = mat[0].Length;
        int[][] pre = new int[n][];
        int[][] ans = new int[n][];
        for (int i = 0; i < n; i++) {
            pre[i] = new int[m];
            ans[i] = new int[m];
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                int sum = mat[i][j];
                if (i - 1 >= 0) sum += pre[i-1][j];
                if (j - 1 >= 0) sum += pre[i][j-1];
                if (i - 1 >= 0 && j - 1 >= 0) sum -= pre[i-1][j-1];
                pre[i][j] = sum;
            }
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                int i1 = Math.Max(0, i - k);
                int i2 = Math.Min(n - 1, i + k);
                int j1 = Math.Max(0, j - k);
                int j2 = Math.Min(m - 1, j + k);
                int sum = pre[i2][j2];
                if (i1 - 1 >= 0) sum -= pre[i1-1][j2];
                if (j1 - 1 >= 0) sum -= pre[i2][j1-1];
                if (i1 - 1 >= 0 && j1 - 1 >= 0) sum += pre[i1-1][j1-1];
                ans[i][j] = sum;
            }
        }
        return ans;
    }
}
