public class Solution {
    public int NumOfWays(int[] nums) {
        const int MOD = 1000000007;
        int n = nums.Length;
        
        long[,] nCr = new long[n+1, n+1];
        for (int i = 0; i <= n; i++) {
            nCr[i,0] = nCr[i,i] = 1;
            for (int j = 1; j < i; j++) {
                nCr[i,j] = (nCr[i-1,j-1] + nCr[i-1,j]) % MOD;
            }
        }
        
        Func<int[], long> dfs = null;
        dfs = (arr) => {
            if (arr.Length <= 2) return 1;
            int root = arr[0];
            var left = arr.Skip(1).Where(x => x < root).ToArray();
            var right = arr.Skip(1).Where(x => x > root).ToArray();
            long leftWays = dfs(left);
            long rightWays = dfs(right);
            int L = left.Length, R = right.Length;
            return (nCr[L+R, L] * leftWays % MOD * rightWays) % MOD;
        };
        
        return (int)((dfs(nums) - 1 + MOD) % MOD);
    }
}
