class Solution {
    private Map<Long, Integer> memo = new HashMap<>();
    
    public int leastOpsExpressTarget(int x, int target) {
        return dfs((long) target, (long) x);
    }
    
    private int dfs(long val, long x) {
        if (memo.containsKey(val)) return memo.get(val);
        if (val < x) {
            int res = (int) Math.min(2 * val - 1, 2 * (x - val));
            memo.put(val, res);
            return res;
        }
        
        long k = (long) (Math.log(val) / Math.log(x));
        long pow = (long) Math.pow(x, k);
        int ans = (int) k + dfs(val - pow, x);
        
        long nextPow = pow * x;
        if (nextPow < 2 * val) {
            ans = Math.min(ans, (int)(k + 1) + dfs(nextPow - val, x));
        }
        
        memo.put(val, ans);
        return ans;
    }
}
