class Solution {
public:
    double knightProbability(int n, int k, int row, int column) {
        if (k == 0) return 1.0;
        
        vector<pair<int, int>> moves = {{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}};
        
        vector<vector<double>> dp(n, vector<double>(n, 0.0));
        dp[row][column] = 1.0;
        
        for (int step = 0; step < k; step++) {
            vector<vector<double>> nextDp(n, vector<double>(n, 0.0));
            for (int r = 0; r < n; r++) {
                for (int c = 0; c < n; c++) {
                    if (dp[r][c] == 0.0) continue;
                    for (auto& move : moves) {
                        int nr = r + move.first;
                        int nc = c + move.second;
                        if (nr >= 0 && nr < n && nc >= 0 && nc < n) {
                            nextDp[nr][nc] += dp[r][c] / 8.0;
                        }
                    }
                }
            }
            dp = nextDp;
        }
        
        double total = 0.0;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                total += dp[r][c];
            }
        }
        return total;
    }
};
