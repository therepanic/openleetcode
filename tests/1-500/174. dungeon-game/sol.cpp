class Solution {
public:
    int calculateMinimumHP(vector<vector<int>>& dungeon) {
        int rows = dungeon.size(), cols = dungeon[0].size();
        vector<vector<int>> dp(rows, vector<int>(cols));
        dp[rows - 1][cols - 1] = max(1, 1 - dungeon[rows - 1][cols - 1]);
        for (int r = rows - 2; r >= 0; --r) dp[r][cols - 1] = max(1, dp[r + 1][cols - 1] - dungeon[r][cols - 1]);
        for (int c = cols - 2; c >= 0; --c) dp[rows - 1][c] = max(1, dp[rows - 1][c + 1] - dungeon[rows - 1][c]);
        for (int r = rows - 2; r >= 0; --r) for (int c = cols - 2; c >= 0; --c) dp[r][c] = max(1, min(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c]);
        return dp[0][0];
    }
};
