public class Solution {
    public bool IsToeplitzMatrix(int[][] matrix) {
        int n = matrix.Length;
        int m = matrix[0].Length;
        
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < m - 1; j++) {
                if (matrix[i][j] != matrix[i + 1][j + 1]) {
                    return false;
                }
            }
        }
        
        return true;
    }
}
