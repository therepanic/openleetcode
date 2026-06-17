class Solution {
public:
    int maximalSquare(vector<vector<string>>& matrix) {
        if (matrix.empty() || matrix[0].empty()) {
            return 0;
        }
        int Rows = matrix.size();
        int Cols = matrix[0].size();
        int maxArea = 0;
        vector<vector<int>> dp(Rows, vector<int>(Cols, 0));

        for (int r = Rows - 1; r >= 0; r--) {
            for (int c = Cols - 1; c >= 0; c--) {
                if (matrix[r][c] == "1") {
                    int down = (r + 1 < Rows) ? dp[r + 1][c] : 0;
                    int right = (c + 1 < Cols) ? dp[r][c + 1] : 0;
                    int diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1][c + 1] : 0;
                    dp[r][c] = 1 + min({down, right, diag});
                } else {
                    dp[r][c] = 0;
                }
                maxArea = max(maxArea, dp[r][c]);
            }
        }
        return maxArea * maxArea;
    }
};
