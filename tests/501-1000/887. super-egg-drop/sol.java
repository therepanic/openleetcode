class Solution {
    public int superEggDrop(int k, int n) {
        int[][] memo = new int[k + 1][n + 1];
        for (int i = 0; i <= k; i++) {
            for (int j = 0; j <= n; j++) {
                memo[i][j] = -1;
            }
        }
        return solve(k, n, memo);
    }
    
    private int solve(int eggs, int floors, int[][] memo) {
        if (floors <= 1 || eggs == 1) {
            return floors;
        }
        if (memo[eggs][floors] != -1) {
            return memo[eggs][floors];
        }
        
        int low = 1, high = floors;
        int ans = floors;
        
        while (low <= high) {
            int mid = (low + high) / 2;
            int breakCase = solve(eggs - 1, mid - 1, memo);
            int notBreakCase = solve(eggs, floors - mid, memo);
            
            ans = Math.min(ans, 1 + Math.max(breakCase, notBreakCase));
            if (breakCase < notBreakCase) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        
        memo[eggs][floors] = ans;
        return ans;
    }
}
