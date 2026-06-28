class Solution {
public:
    int cherryPickup(vector<vector<int>>& grid) {
        int n = grid.size();
        
        vector<vector<int>> dp(n, vector<int>(n, INT_MIN));
        dp[0][0] = 0;
        
        for (int k = 0; k <= 2 * (n - 1); k++) {
            vector<vector<int>> newDp(n, vector<int>(n, INT_MIN));
            
            for (int x1 = 0; x1 < n; x1++) {
                int y1 = k - x1;
                if (!(y1 >= 0 && y1 < n)) continue;
                
                for (int x2 = 0; x2 < n; x2++) {
                    int y2 = k - x2;
                    if (!(y2 >= 0 && y2 < n)) continue;
                    
                    if (grid[x1][y1] == -1 || grid[x2][y2] == -1) continue;
                    
                    int best = dp[x1][x2];
                    if (x1 > 0) best = max(best, dp[x1-1][x2]);
                    if (x2 > 0) best = max(best, dp[x1][x2-1]);
                    if (x1 > 0 && x2 > 0) best = max(best, dp[x1-1][x2-1]);
                    
                    if (best == INT_MIN) continue;
                    
                    best += grid[x1][y1];
                    if (x1 != x2) best += grid[x2][y2];
                    
                    newDp[x1][x2] = best;
                }
            }
            
            dp = newDp;
        }
        
        return max(0, dp[n-1][n-1]);
    }
};
