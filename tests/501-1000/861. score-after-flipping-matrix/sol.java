class Solution {
    public int matrixScore(int[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;
        for (int[] row : grid) {
            if (row[0] == 0) {
                for (int i = 0; i < cols; i++) {
                    row[i] ^= 1;
                }
            }
        }
        for (int j = 1; j < cols; j++) {
            int temp = 0;
            for (int i = 0; i < rows; i++) {
                temp += grid[i][j];
            }
            if (2 * temp < rows) {
                for (int i = 0; i < rows; i++) {
                    grid[i][j] ^= 1;
                }
            }
        }
        int ans = 0;
        for (int[] row : grid) {
            int val = 0;
            for (int bit : row) {
                val = (val << 1) | bit;
            }
            ans += val;
        }
        return ans;
    }
}
