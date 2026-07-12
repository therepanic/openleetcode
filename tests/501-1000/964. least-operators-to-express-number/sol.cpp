class Solution {
private:
    unordered_map<long long, int> memo;
    
    int dfs(long long val, long long x) {
        if (memo.count(val)) return memo[val];
        if (val < x) {
            int res = min(2 * (int)val - 1, 2 * (int)(x - val));
            memo[val] = res;
            return res;
        }
        
        long long k = log(val) / log(x);
        long long pow = (long long)std::pow(x, k);
        int ans = (int)k + dfs(val - pow, x);
        
        long long nextPow = pow * x;
        if (nextPow < 2 * val) {
            ans = min(ans, (int)k + 1 + dfs(nextPow - val, x));
        }
        
        memo[val] = ans;
        return ans;
    }
    
public:
    int leastOpsExpressTarget(int x, int target) {
        return dfs((long long)target, (long long)x);
    }
};
