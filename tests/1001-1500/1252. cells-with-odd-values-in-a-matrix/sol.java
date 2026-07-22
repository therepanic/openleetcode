class Solution {
    public int oddCells(int m, int n, int[][] indices) {
        int[][] a = new int[m][n];
        int c = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                a[i][j] = 0;
            }
        }
        for (int k = 0; k < indices.length; k++) {
            for (int u = 0; u < n; u++) {
                a[indices[k][0]][u]++;
            }
            for (int l = 0; l < m; l++) {
                a[l][indices[k][1]]++;
            }
        }
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (a[i][j] % 2 != 0) {
                    c++;
                }
            }
        }
        return c;
    }
}
