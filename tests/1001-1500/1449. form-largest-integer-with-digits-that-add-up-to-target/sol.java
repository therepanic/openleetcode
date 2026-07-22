class Solution {
    public String largestNumber(int[] cost, int target) {
        int N = cost.length;
        int[][] memo = new int[N + 1][target + 1];
        for (int i = 0; i <= N; i++) {
            for (int j = 0; j <= target; j++) {
                memo[i][j] = -1;
            }
        }
        int e = helper(0, target, cost, N, memo);
        if (e == Integer.MIN_VALUE) return "0";
        StringBuilder s = new StringBuilder();
        for (int k = 0; k < e; k++) {
            for (int j = 9; j >= 1; j--) {
                if (cost[j-1] <= target && helper(0, target - cost[j-1], cost, N, memo) == e - k - 1) {
                    target -= cost[j-1];
                    s.append(j);
                    break;
                }
            }
        }
        return s.toString();
    }
    
    private int helper(int i, int c, int[] cost, int N, int[][] memo) {
        if (c == 0) return 0;
        if (i == N || c < 0) return Integer.MIN_VALUE;
        if (memo[i][c] != -1) return memo[i][c];
        int take = helper(i, c - cost[i], cost, N, memo);
        int notTake = helper(i + 1, c, cost, N, memo);
        if (take != Integer.MIN_VALUE) take += 1;
        memo[i][c] = Math.max(take, notTake);
        return memo[i][c];
    }
}
