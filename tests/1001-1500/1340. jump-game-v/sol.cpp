class Solution {
public:
    int maxJumps(vector<int>& arr, int d) {
        int n = arr.size();
        vector<int> dp(n, -1);

        function<int(int)> dfs = [&](int i) -> int {
            if (dp[i] != -1) return dp[i];

            int best = 1;

            // Right scan
            for (int nxt = i + 1; nxt <= min(n - 1, i + d); ++nxt) {
                if (arr[nxt] >= arr[i]) break;
                best = max(best, 1 + dfs(nxt));
            }

            // Left scan
            for (int nxt = i - 1; nxt >= max(0, i - d); --nxt) {
                if (arr[nxt] >= arr[i]) break;
                best = max(best, 1 + dfs(nxt));
            }

            dp[i] = best;
            return dp[i];
        };

        int result = 0;
        for (int i = 0; i < n; ++i) {
            result = max(result, dfs(i));
        }
        return result;
    }
};
