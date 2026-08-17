class Solution {
    public long gridGame(int[][] grid) {
        long minResult = Long.MAX_VALUE;
        long row1Sum = 0;
        for (int val : grid[0]) {
            row1Sum += val;
        }
        long row2Sum = 0;
        
        for (int i = 0; i < grid[0].length; i++) {
            row1Sum -= grid[0][i];
            minResult = Math.min(minResult, Math.max(row1Sum, row2Sum));
            row2Sum += grid[1][i];
        }
        
        return minResult;
    }
}
