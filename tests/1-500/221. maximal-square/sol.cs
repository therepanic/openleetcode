public class Solution {
    public int MaximalSquare(string[][] matrix) {
        if (matrix.Length == 0 || matrix[0].Length == 0) {
            return 0;
        }
        int Rows = matrix.Length;
        int Cols = matrix[0].Length;
        int maxArea = 0;
        int[,] dp = new int[Rows, Cols];

        for (int r = Rows - 1; r >= 0; r--) {
            for (int c = Cols - 1; c >= 0; c--) {
                if (matrix[r][c] == "1") {
                    int down = (r + 1 < Rows) ? dp[r + 1, c] : 0;
                    int right = (c + 1 < Cols) ? dp[r, c + 1] : 0;
                    int diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1, c + 1] : 0;
                    dp[r, c] = 1 + Math.Min(down, Math.Min(right, diag));
                } else {
                    dp[r, c] = 0;
                }
                maxArea = Math.Max(maxArea, dp[r, c]);
            }
        }
        return maxArea * maxArea;
    }
}
