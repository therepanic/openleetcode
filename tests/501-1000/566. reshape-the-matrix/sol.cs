public class Solution {
    public int[][] MatrixReshape(int[][] mat, int r, int c) {
        int m = mat.Length;
        int n = mat[0].Length;
        if (m * n != r * c) {
            return mat;
        }
        
        int[][] reshaped = new int[r][];
        for (int i = 0; i < r; i++) {
            reshaped[i] = new int[c];
        }
        int count = 0;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                reshaped[count / c][count % c] = mat[i][j];
                count++;
            }
        }
        
        return reshaped;
    }
}
