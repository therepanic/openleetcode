class Solution {
    public int maxJumps(int[] arr, int d) {
        int n = arr.length;
        int[] dp = new int[n];
        Arrays.fill(dp, -1);
        
        int result = 0;
        for (int i = 0; i < n; i++) {
            result = Math.max(result, dfs(arr, d, i, dp));
        }
        return result;
    }
    
    private int dfs(int[] arr, int d, int i, int[] dp) {
        if (dp[i] != -1) {
            return dp[i];
        }
        
        int best = 1;
        int n = arr.length;
        
        // Right scan
        for (int nxt = i + 1; nxt <= Math.min(n - 1, i + d); nxt++) {
            if (arr[nxt] >= arr[i]) break;
            best = Math.max(best, 1 + dfs(arr, d, nxt, dp));
        }
        
        // Left scan
        for (int nxt = i - 1; nxt >= Math.max(0, i - d); nxt--) {
            if (arr[nxt] >= arr[i]) break;
            best = Math.max(best, 1 + dfs(arr, d, nxt, dp));
        }
        
        dp[i] = best;
        return dp[i];
    }
}
