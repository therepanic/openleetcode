class Solution {
public:
    int numFactoredBinaryTrees(vector<int>& arr) {
        const int MOD = 1e9 + 7;
        sort(arr.begin(), arr.end());
        unordered_map<int, long long> dp;
        unordered_set<int> s(arr.begin(), arr.end());
        for (int x : arr) {
            dp[x] = 1;
            for (int a : arr) {
                if (a > x) break;
                if (x % a == 0) {
                    int b = x / a;
                    if (s.count(b)) {
                        dp[x] = (dp[x] + dp[a] * dp[b]) % MOD;
                    }
                }
            }
        }
        long long sum = 0;
        for (auto& p : dp) {
            sum = (sum + p.second) % MOD;
        }
        return sum;
    }
};
