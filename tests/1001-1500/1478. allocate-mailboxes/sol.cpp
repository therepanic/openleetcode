class Solution {
public:
    int minDistance(vector<int>& houses, int k) {
        int n = houses.size();
        sort(houses.begin(), houses.end());
        vector<int> P(n + 1, 0);
        for (int i = 0; i < n; i++) {
            P[i + 1] = P[i] + houses[i];
        }
        
        vector<vector<int>> G(n, vector<int>(n, 0));
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                int mid = (i + j) / 2;
                int countLeft = mid - i + 1;
                int countRight = j - mid;
                int sumLeft = P[mid + 1] - P[i];
                int sumRight = P[j + 1] - P[mid + 1];
                G[i][j] = (houses[mid] * countLeft - sumLeft) + (sumRight - houses[mid] * countRight);
            }
        }
        
        vector<vector<int>> dp(k + 1, vector<int>(n + 1, 1e9));
        dp[0][0] = 0;
        
        for (int m = 1; m <= k; m++) {
            for (int j = 1; j <= n; j++) {
                int best = 1e9;
                for (int i = 0; i < j; i++) {
                    best = min(best, dp[m-1][i] + G[i][j-1]);
                }
                dp[m][j] = best;
            }
        }
        
        return dp[k][n];
    }
};
