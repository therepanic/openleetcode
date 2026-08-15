class Solution {
    public int numOfWays(int[] nums) {
        final int MOD = 1000000007;
        int n = nums.length;
        
        long[][] nCr = new long[n+1][n+1];
        for (int i = 0; i <= n; i++) {
            nCr[i][0] = nCr[i][i] = 1;
            for (int j = 1; j < i; j++) {
                nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD;
            }
        }
        
        return (int)((dfs(nums, nCr) - 1 + MOD) % MOD);
    }
    
    private long dfs(int[] nums, long[][] nCr) {
        if (nums.length <= 2) return 1;
        int root = nums[0];
        int[] left = Arrays.stream(nums).skip(1).filter(x -> x < root).toArray();
        int[] right = Arrays.stream(nums).skip(1).filter(x -> x > root).toArray();
        long leftWays = dfs(left, nCr);
        long rightWays = dfs(right, nCr);
        int L = left.length, R = right.length;
        return (nCr[L+R][L] * leftWays % 1000000007 * rightWays) % 1000000007;
    }
}
