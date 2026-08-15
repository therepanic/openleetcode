public class Solution {
    public long GridGame(int[][] grid) {
        long minResult = long.MaxValue;
        long row1Sum = 0;
        foreach (int val in grid[0]) {
            row1Sum += val;
        }
        long row2Sum = 0;
        
        for (int i = 0; i < grid[0].Length; i++) {
            row1Sum -= grid[0][i];
            minResult = Math.Min(minResult, Math.Max(row1Sum, row2Sum));
            row2Sum += grid[1][i];
        }
        
        return minResult;
    }
}
