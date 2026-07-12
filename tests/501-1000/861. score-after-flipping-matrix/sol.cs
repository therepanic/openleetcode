public class Solution {
    public int MatrixScore(int[][] grid) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        foreach (var row in grid) {
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
        foreach (var row in grid) {
            int val = 0;
            foreach (int bit in row) {
                val = (val << 1) | bit;
            }
            ans += val;
        }
        return ans;
    }
}
