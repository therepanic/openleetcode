class Solution {
public:
    int connectTwoGroups(vector<vector<int>>& cost) {
        int m = cost.size();
        int n = cost[0].size();
        vector<int> mn(n);
        for (int j = 0; j < n; j++) {
            mn[j] = cost[0][j];
            for (int i = 1; i < m; i++) {
                mn[j] = min(mn[j], cost[i][j]);
            }
        }
        vector<vector<int>> memo(m+1, vector<int>(1<<n, -1));
        function<int(int,int)> fn = [&](int i, int mask) -> int {
            if (memo[i][mask] != -1) return memo[i][mask];
            if (i == m) {
                int sum = 0;
                for (int j = 0; j < n; j++) {
                    if ((mask & (1<<j)) == 0) sum += mn[j];
                }
                return memo[i][mask] = sum;
            }
            int best = INT_MAX;
            for (int j = 0; j < n; j++) {
                best = min(best, cost[i][j] + fn(i+1, mask | (1<<j)));
            }
            return memo[i][mask] = best;
        };
        return fn(0, 0);
    }
};
