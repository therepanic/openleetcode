public class Solution {
    public int OddCells(int m, int n, int[][] indices) {
        int[][] a = new int[m][];
        for (int i = 0; i < m; i++) {
            a[i] = new int[n];
        }
        int c = 0;
        foreach (int[] k in indices) {
            for (int u = 0; u < n; u++) {
                a[k[0]][u]++;
            }
            for (int l = 0; l < m; l++) {
                a[l][k[1]]++;
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
