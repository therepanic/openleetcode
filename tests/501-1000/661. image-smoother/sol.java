class Solution {
    public int[][] imageSmoother(int[][] img) {
        int m = img.length;
        int n = img[0].length;
        int[][] P = new int[m + 1][n + 1];
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1];
            }
        }
        int[][] res = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int a = Math.max(0, i - 1);
                int b = Math.max(0, j - 1);
                int c = Math.min(m - 1, i + 1);
                int d = Math.min(n - 1, j + 1);
                int s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b];
                res[i][j] = s / ((c - a + 1) * (d - b + 1));
            }
        }
        return res;
    }
}
