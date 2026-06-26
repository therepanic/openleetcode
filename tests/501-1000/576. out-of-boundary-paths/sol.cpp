class Solution {
public:
    int findPaths(int m, int n, int maxMove, int startRow, int startColumn) {
        const int MOD = 1000000007;
        vector<vector<vector<int>>> dp(maxMove + 1, vector<vector<int>>(m, vector<int>(n, 0)));
        vector<pair<int, int>> directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

        for (int move = 1; move <= maxMove; move++) {
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    for (auto [dx, dy] : directions) {
                        int x = i + dx;
                        int y = j + dy;
                        if (x < 0 || x >= m || y < 0 || y >= n) {
                            dp[move][i][j] = (dp[move][i][j] + 1) % MOD;
                        } else {
                            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD;
                        }
                    }
                }
            }
        }

        return dp[maxMove][startRow][startColumn];
    }
};
