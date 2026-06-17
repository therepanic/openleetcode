class Solution {
public:
    int longestIncreasingPath(vector<vector<int>>& matrix) {
        int row = matrix.size();
        int col = matrix[0].size();
        vector<vector<int>> dp(row, vector<int>(col, 0));
        
        function<int(int, int)> graph = [&](int i, int j) -> int {
            if (dp[i][j] != 0) {
                return dp[i][j];
            }
            
            int top = 0, down = 0, left = 0, right = 0;
            
            if (i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]) {
                if (dp[i-1][j] == 0) {
                    dp[i-1][j] = graph(i-1, j);
                }
                top = dp[i-1][j];
            }
            
            if (i + 1 < row && matrix[i+1][j] > matrix[i][j]) {
                if (dp[i+1][j] == 0) {
                    dp[i+1][j] = graph(i+1, j);
                }
                down = dp[i+1][j];
            }
            
            if (j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]) {
                if (dp[i][j-1] == 0) {
                    dp[i][j-1] = graph(i, j-1);
                }
                left = dp[i][j-1];
            }
            
            if (j + 1 < col && matrix[i][j+1] > matrix[i][j]) {
                if (dp[i][j+1] == 0) {
                    dp[i][j+1] = graph(i, j+1);
                }
                right = dp[i][j+1];
            }
            
            dp[i][j] = 1 + max({top, down, left, right});
            return dp[i][j];
        };
        
        int maxi = 0;
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                int num = graph(i, j);
                maxi = max(maxi, num);
            }
        }
        
        return maxi;
    }
};
