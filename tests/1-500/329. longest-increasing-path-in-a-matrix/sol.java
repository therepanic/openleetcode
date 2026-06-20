class Solution {
    private int row;
    private int col;
    private int[][] dp;
    private int[][] matrix;
    
    public int longestIncreasingPath(int[][] matrix) {
        this.matrix = matrix;
        this.row = matrix.length;
        this.col = matrix[0].length;
        this.dp = new int[row][col];
        
        int maxi = 0;
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                int num = graph(i, j);
                maxi = Math.max(maxi, num);
            }
        }
        return maxi;
    }
    
    private int graph(int i, int j) {
        if (dp[i][j] != 0) {
            return dp[i][j];
        }
        
        int top = 0, down = 0, left = 0, right = 0;
        
        if (i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]) {
            if (dp[i-1][j] == 0) {
                dp[i-1][j] = graph(i-1, j);
            }
            top = dp[i-1][j];
        }
        
        if (i + 1 < row && matrix[i+1][j] > matrix[i][j]) {
            if (dp[i+1][j] == 0) {
                dp[i+1][j] = graph(i+1, j);
            }
            down = dp[i+1][j];
        }
        
        if (j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]) {
            if (dp[i][j-1] == 0) {
                dp[i][j-1] = graph(i, j-1);
            }
            left = dp[i][j-1];
        }
        
        if (j + 1 < col && matrix[i][j+1] > matrix[i][j]) {
            if (dp[i][j+1] == 0) {
                dp[i][j+1] = graph(i, j+1);
            }
            right = dp[i][j+1];
        }
        
        dp[i][j] = 1 + Math.max(Math.max(top, down), Math.max(left, right));
        return dp[i][j];
    }
}
