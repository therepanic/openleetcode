public class Solution {
    public int[][] Transpose(int[][] matrix) {
        int row = matrix.Length;
        int col = matrix[0].Length;
        int[][] trans = new int[col][];

        for (int i = 0; i < col; i++) {
            trans[i] = new int[row];
            for (int j = 0; j < row; j++) {
                trans[i][j] = matrix[j][i];
            }
        }

        return trans;
    }
}
