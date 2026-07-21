class Solution {
    public int minFallingPathSum(int[][] grid) {
        int n = grid.length;
        int[] dp = grid[0].clone();
        for (int i = 1; i < n; i++) {
            int smallest = Integer.MAX_VALUE;
            int secondSmallest = Integer.MAX_VALUE;
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
        int min = dp[0];
        for (int val : dp) {
            if (val < min) min = val;
        }
        return min;
    }
}
