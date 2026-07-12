class Solution {
public:
    int minDeletionSize(vector<string>& strs) {
        int m = strs[0].size();
        vector<int> dp(m, 1);
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < i; j++) {
                bool all = true;
                for (const string& row : strs) {
                    if (row[j] > row[i]) {
                        all = false;
                        break;
                    }
                }
                if (all) {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
        }
        
        int maxDp = *max_element(dp.begin(), dp.end());
        return m - maxDp;
    }
};
