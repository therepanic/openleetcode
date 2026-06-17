class Solution {
    public int maximalSquare(String[][] matrix) {
        if (matrix.length == 0 || matrix[0].length == 0) {
            return 0;
        }
        int Rows = matrix.length;
        int Cols = matrix[0].length;
        int max_area = 0;
        int[][] dp = new int[Rows][Cols];

        for (int r = Rows - 1; r >= 0; r--) {
            for (int c = Cols - 1; c >= 0; c--) {
                if (matrix[r][c].equals("1")) {
                    int down = (r + 1 < Rows) ? dp[r + 1][c] : 0;
                    int right = (c + 1 < Cols) ? dp[r][c + 1] : 0;
                    int diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1][c + 1] : 0;
                    dp[r][c] = 1 + Math.min(down, Math.min(right, diag));
                } else {
                    dp[r][c] = 0;
                }
                max_area = Math.max(max_area, dp[r][c]);
            }
        }
        return max_area * max_area;
    }
}
