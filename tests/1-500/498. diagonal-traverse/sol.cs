public class Solution {
    public int[] FindDiagonalOrder(int[][] mat) {
        if (mat == null || mat.Length == 0 || mat[0].Length == 0) {
            return new int[0];
        }
        
        int m = mat.Length, n = mat[0].Length;
        int[] result = new int[m * n];
        int row = 0, col = 0;
        
        for (int i = 0; i < m * n; i++) {
            result[i] = mat[row][col];
            
            if ((row + col) % 2 == 0) {
                if (col == n - 1) {
                    row++;
                } else if (row == 0) {
                    col++;
                } else {
                    row--;
                    col++;
                }
            } else {
                if (row == m - 1) {
                    col++;
                } else if (col == 0) {
                    row++;
                } else {
                    row++;
                    col--;
                }
            }
        }
        
        return result;
    }
}
