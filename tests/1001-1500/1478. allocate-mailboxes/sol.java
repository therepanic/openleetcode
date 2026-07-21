class Solution {
    public int minDistance(int[] houses, int k) {
        int n = houses.length;
        Arrays.sort(houses);
        int[] P = new int[n + 1];
        for (int i = 0; i < n; i++) {
            P[i + 1] = P[i] + houses[i];
        }
        
        int[][] G = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                int mid = (i + j) / 2;
                int countLeft = mid - i + 1;
                int countRight = j - mid;
                int sumLeft = P[mid + 1] - P[i];
                int sumRight = P[j + 1] - P[mid + 1];
                G[i][j] = (houses[mid] * countLeft - sumLeft) + (sumRight - houses[mid] * countRight);
            }
        }
        
        int[][] dp = new int[k + 1][n + 1];
        for (int i = 0; i <= k; i++) {
            Arrays.fill(dp[i], 1000000000);
        }
        dp[0][0] = 0;
        
        for (int m = 1; m <= k; m++) {
            for (int j = 1; j <= n; j++) {
                int best = Integer.MAX_VALUE;
                for (int i = 0; i < j; i++) {
                    best = Math.min(best, dp[m-1][i] + G[i][j-1]);
                }
                dp[m][j] = best;
            }
        }
        
        return dp[k][n];
    }
}
