public class Solution {
    public int MinFallingPathSum(int[][] grid) {
        int n = grid.Length;
        int[] dp = (int[])grid[0].Clone();
        for (int i = 1; i < n; i++) {
            int smallest = int.MaxValue;
            int secondSmallest = int.MaxValue;
            int smallestCol = -1;
            for (int col = 0; col < n; col++) {
                if (dp[col] < smallest) {
                    secondSmallest = smallest;
                    smallest = dp[col];
                    smallestCol = col;
                } else if (dp[col] < secondSmallest) {
                    secondSmallest = dp[col];
                }
            }
            int[] newDp = new int[n];
            for (int col = 0; col < n; col++) {
                newDp[col] = grid[i][col] + (col == smallestCol ? secondSmallest : smallest);
            }
            dp = newDp;
        }
        return dp.Min();
    }
}
