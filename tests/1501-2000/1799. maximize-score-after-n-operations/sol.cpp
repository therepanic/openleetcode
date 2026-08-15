class Solution {
public:
    int maxScore(vector<int>& nums) {
        int n = nums.size();
        vector<vector<int>> dp(1 << n, vector<int>(n/2 + 1, -1));
        function<int(int,int)> dfs = [&](int mask, int op) -> int {
            if (mask == (1 << n) - 1) return 0;
            if (dp[mask][op] != -1) return dp[mask][op];
            int ans = 0;
            for (int i = 0; i < n; ++i) {
                if ((mask & (1 << i)) == 0) {
                    for (int j = 0; j < n; ++j) {
                        if (j != i && (mask & (1 << j)) == 0) {
                            int nmask = mask | (1 << i) | (1 << j);
                            ans = max(ans, dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op);
                        }
                    }
                }
            }
            return dp[mask][op] = ans;
        };
        return dfs(0, 1);
    }
};
