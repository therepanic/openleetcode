public class Solution {
    public int MaxIncreaseKeepingSkyline(int[][] grid) {
        int n = grid.Length;
        int[] rowMax = new int[n];
        int[] colMax = new int[n];
        for (int r = 0; r < n; r++) {
            int maxVal = 0;
            for (int c = 0; c < n; c++) {
                maxVal = Math.Max(maxVal, grid[r][c]);
            }
            rowMax[r] = maxVal;
        }
        for (int c = 0; c < n; c++) {
            int maxVal = 0;
            for (int r = 0; r < n; r++) {
                maxVal = Math.Max(maxVal, grid[r][c]);
            }
            colMax[c] = maxVal;
        }
        int gain = 0;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                gain += Math.Min(rowMax[r], colMax[c]) - grid[r][c];
            }
        }
        return gain;
    }
}
