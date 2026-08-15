class Solution {
public:
    int colorTheGrid(int m, int n) {
        const int MOD = 1000000007;
        long long total = 1;
        for (int i = 0; i < m; i++) total *= 3;
        vector<int> good;
        vector<vector<int>> pattern(total, vector<int>(m));
        for (int i = 0; i < total; i++) {
            int val = i;
            bool valid = true;
            for (int k = 0; k < m; k++) {
                pattern[i][k] = val % 3;
                val /= 3;
            }
            for (int k = 1; k < m; k++) {
                if (pattern[i][k] == pattern[i][k-1]) {
                    valid = false;
                    break;
                }
            }
            if (valid) good.push_back(i);
        }
        vector<vector<int>> compatible(good.size());
        for (int i = 0; i < (int)good.size(); i++) {
            for (int j = 0; j < (int)good.size(); j++) {
                bool ok = true;
                for (int k = 0; k < m; k++) {
                    if (pattern[good[i]][k] == pattern[good[j]][k]) {
                        ok = false;
                        break;
                    }
                }
                if (ok) compatible[i].push_back(j);
            }
        }
        vector<long long> dp(good.size(), 1), next(good.size());
        for (int col = 2; col <= n; col++) {
            fill(next.begin(), next.end(), 0);
            for (int i = 0; i < (int)good.size(); i++) {
                long long totalWays = 0;
                for (int j : compatible[i]) {
                    totalWays += dp[j];
                }
                next[i] = totalWays % MOD;
            }
            dp.swap(next);
        }
        long long ans = 0;
        for (long long ways : dp) ans += ways;
        return (int)(ans % MOD);
    }
};
