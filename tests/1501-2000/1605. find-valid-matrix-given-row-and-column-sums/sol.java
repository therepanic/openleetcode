class Solution {
    public int[][] restoreMatrix(int[] rowSum, int[] colSum) {
        int m = rowSum.length, n = colSum.length;
        int[][] matrix = new int[m][n];
        int i = 0, j = 0;
        while (i < m && j < n) {
            int val = Math.min(rowSum[i], colSum[j]);
            matrix[i][j] = val;
            rowSum[i] -= val;
            colSum[j] -= val;
            if (rowSum[i] == 0) i++;
            if (colSum[j] == 0) j++;
        }
        return matrix;
    }
}
