class Solution {
    public int maxIncreaseKeepingSkyline(int[][] grid) {
        int n = grid.length;
        int[] rowMax = new int[n];
        int[] colMax = new int[n];
        for (int r = 0; r < n; r++) {
            int maxVal = 0;
            for (int c = 0; c < n; c++) {
                maxVal = Math.max(maxVal, grid[r][c]);
            }
            rowMax[r] = maxVal;
        }
        for (int c = 0; c < n; c++) {
            int maxVal = 0;
            for (int r = 0; r < n; r++) {
                maxVal = Math.max(maxVal, grid[r][c]);
            }
            colMax[c] = maxVal;
        }
        int gain = 0;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                gain += Math.min(rowMax[r], colMax[c]) - grid[r][c];
            }
        }
        return gain;
    }
}
