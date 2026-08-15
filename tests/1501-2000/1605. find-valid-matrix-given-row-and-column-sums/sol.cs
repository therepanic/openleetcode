public class Solution {
    public int[][] RestoreMatrix(int[] rowSum, int[] colSum) {
        int m = rowSum.Length, n = colSum.Length;
        int[][] matrix = new int[m][];
        for (int i = 0; i < m; i++) matrix[i] = new int[n];
        int row = 0, col = 0;
        while (row < m && col < n) {
            int val = Math.Min(rowSum[row], colSum[col]);
            matrix[row][col] = val;
            rowSum[row] -= val;
            colSum[col] -= val;
            if (rowSum[row] == 0) row++;
            if (colSum[col] == 0) col++;
        }
        return matrix;
    }
}
