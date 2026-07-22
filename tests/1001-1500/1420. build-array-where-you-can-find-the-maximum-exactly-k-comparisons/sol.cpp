class Solution {
private:
    static const int MOD = 1'000'000'007;
    vector<vector<vector<int>>> dp;
    int n, m, k;

    int solve(int idx, int searchCost, int maxValue) {
        if (idx == n) {
            return searchCost == k ? 1 : 0;
        }
        if (searchCost > k) {
            return 0;
        }
        if (dp[idx][searchCost][maxValue] != -1) {
            return dp[idx][searchCost][maxValue];
        }

        int result = 0;
        for (int i = 1; i <= m; ++i) {
            if (i > maxValue) {
                result = (result + solve(idx + 1, searchCost + 1, i)) % MOD;
            } else {
                result = (result + solve(idx + 1, searchCost, maxValue)) % MOD;
            }
        }

        dp[idx][searchCost][maxValue] = result;
        return result;
    }

public:
    int numOfArrays(int n, int m, int k) {
        this->n = n;
        this->m = m;
        this->k = k;
        dp = vector<vector<vector<int>>>(n + 1, vector<vector<int>>(k + 1, vector<int>(m + 1, -1)));
        return solve(0, 0, 0);
    }
};
