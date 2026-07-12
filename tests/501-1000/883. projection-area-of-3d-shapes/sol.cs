public class Solution {
    public int ProjectionArea(int[][] grid) {
        int xyArea = 0;
        int yzArea = 0;
        int zxArea = 0;
        int rows = grid.Length;
        int cols = grid[0].Length;
        for (int i = 0; i < rows; i++) {
            int maxRow = 0;
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] > 0) xyArea++;
                if (grid[i][j] > maxRow) maxRow = grid[i][j];
            }
            yzArea += maxRow;
        }
        for (int j = 0; j < cols; j++) {
            int maxCol = 0;
            for (int i = 0; i < rows; i++) {
                if (grid[i][j] > maxCol) maxCol = grid[i][j];
            }
            zxArea += maxCol;
        }
        return xyArea + yzArea + zxArea;
    }
}
