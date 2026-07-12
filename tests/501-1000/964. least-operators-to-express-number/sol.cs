public class Solution {
    private Dictionary<long, int> memo = new Dictionary<long, int>();
    
    public int LeastOpsExpressTarget(int x, int target) {
        return Dfs((long)target, (long)x);
    }
    
    private int Dfs(long val, long x) {
        if (memo.ContainsKey(val)) return memo[val];
        if (val < x) {
            int res = Math.Min(2 * (int)val - 1, 2 * (int)(x - val));
            memo[val] = res;
            return res;
        }
        
        long k = (long)(Math.Log(val) / Math.Log(x));
        long pow = (long)Math.Pow(x, k);
        int ans = (int)k + Dfs(val - pow, x);
        
        long nextPow = pow * x;
        if (nextPow < 2 * val) {
            ans = Math.Min(ans, (int)k + 1 + Dfs(nextPow - val, x));
        }
        
        memo[val] = ans;
        return ans;
    }
}
