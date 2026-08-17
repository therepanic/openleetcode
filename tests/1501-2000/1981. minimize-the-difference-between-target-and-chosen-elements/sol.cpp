class Solution {
public:
    int minimizeTheDifference(vector<vector<int>>& mat, int target) {
        for (auto& row : mat) {
            sort(row.begin(), row.end());
        }
        unordered_map<long long, int> dp;
        int mini = INT_MAX;
        
        function<int(int, int)> dfs = [&](int i, int ans) -> int {
            if (i < 0) {
                int diff = abs(ans);
                mini = min(mini, diff);
                return diff;
            }
            long long key = (long long)i * 100000 + (ans + 100000);
            if (dp.find(key) != dp.end()) return dp[key];
            if (ans < 0 && abs(ans) > mini) return INT_MAX / 2;
            int take = INT_MAX / 2;
            for (int z = 0; z < mat[i].size(); z++) {
                if (z > 0 && mat[i][z] == mat[i][z-1]) continue;
                take = min(take, dfs(i-1, ans - mat[i][z]));
                if (take == 0) break;
            }
            dp[key] = take;
            return take;
        };
        
        return dfs(mat.size() - 1, target);
    }
};
