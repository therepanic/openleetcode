class Solution {
public:
    int numberOfSets(int n, int k) {
        const long long MOD = 1000000007LL;
        vector<long long> dp_prev(n, 1);
        
        vector<long long> prefix_prev(n, 0);
        prefix_prev[0] = dp_prev[0];
        for (int i = 1; i < n; ++i) {
            prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
        }
        
        for (int iter = 0; iter < k; ++iter) {
            vector<long long> dp_cur(n, 0);
            for (int i = 1; i < n; ++i) {
                dp_cur[i] = (dp_cur[i-1] + prefix_prev[i-1]) % MOD;
            }
            dp_prev = dp_cur;
            prefix_prev[0] = dp_prev[0];
            for (int i = 1; i < n; ++i) {
                prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % MOD;
            }
        }
        
        return (int)dp_prev[n-1];
    }
};
