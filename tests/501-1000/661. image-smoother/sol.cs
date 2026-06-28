public class Solution {
    public int[][] ImageSmoother(int[][] img) {
        int m = img.Length;
        int n = img[0].Length;
        int[][] P = new int[m + 1][];
        for (int i = 0; i <= m; i++) {
            P[i] = new int[n + 1];
        }
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1];
            }
        }
        int[][] res = new int[m][];
        for (int i = 0; i < m; i++) {
            res[i] = new int[n];
        }
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int a = Math.Max(0, i - 1);
                int b = Math.Max(0, j - 1);
                int c = Math.Min(m - 1, i + 1);
                int d = Math.Min(n - 1, j + 1);
                int s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b];
                res[i][j] = s / ((c - a + 1) * (d - b + 1));
            }
        }
        return res;
    }
}
