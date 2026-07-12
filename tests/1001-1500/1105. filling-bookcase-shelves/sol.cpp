class Solution {
public:
    int minHeightShelves(vector<vector<int>>& books, int shelfWidth) {
        int n = books.size();
        vector<int> dp(n + 1, INT_MAX);
        dp[0] = 0;
        
        for (int i = 1; i <= n; i++) {
            dp[i] = dp[i - 1] + books[i - 1][1];
            int height = 0;
            int width = 0;
            for (int j = i - 1; j >= 0; j--) {
                height = max(books[j][1], height);
                width += books[j][0];
                if (width > shelfWidth) {
                    break;
                }
                dp[i] = min(dp[i], dp[j] + height);
            }
        }
        
        return dp[n];
    }
};
