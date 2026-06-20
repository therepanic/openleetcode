public class Solution {
    public int LongestIncreasingPath(int[][] matrix) {
        int row = matrix.Length;
        int col = matrix[0].Length;
        int[][] dp = new int[row][];
        for (int i = 0; i < row; i++) {
            dp[i] = new int[col];
        }
        
        int Graph(int i, int j) {
            if (dp[i][j] != 0) {
                return dp[i][j];
            }
            
            int top = 0, down = 0, left = 0, right = 0;
            
            if (i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]) {
                if (dp[i-1][j] == 0) {
                    dp[i-1][j] = Graph(i-1, j);
                }
                top = dp[i-1][j];
            }
            
            if (i + 1 < row && matrix[i+1][j] > matrix[i][j]) {
                if (dp[i+1][j] == 0) {
                    dp[i+1][j] = Graph(i+1, j);
                }
                down = dp[i+1][j];
            }
            
            if (j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]) {
                if (dp[i][j-1] == 0) {
                    dp[i][j-1] = Graph(i, j-1);
                }
                left = dp[i][j-1];
            }
            
            if (j + 1 < col && matrix[i][j+1] > matrix[i][j]) {
                if (dp[i][j+1] == 0) {
                    dp[i][j+1] = Graph(i, j+1);
                }
                right = dp[i][j+1];
            }
            
            dp[i][j] = 1 + Math.Max(Math.Max(top, down), Math.Max(left, right));
            return dp[i][j];
        }
        
        int maxi = 0;
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                int num = Graph(i, j);
                maxi = Math.Max(maxi, num);
            }
        }
        
        return maxi;
    }
}
