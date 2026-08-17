class Solution {
public:
    int maxValue(vector<vector<int>>& events, int k) {
        sort(events.begin(), events.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] < b[1];
        });
        int n = events.size();
        vector<vector<int>> dp(n + 1, vector<int>(k + 1, 0));
        
        for (int i = 1; i <= n; i++) {
            int start = events[i - 1][0];
            int value = events[i - 1][2];
            int prev = findLastNonOverlapping(events, i - 1, start);
            for (int j = 1; j <= k; j++) {
                dp[i][j] = max(dp[i - 1][j], dp[prev + 1][j - 1] + value);
            }
        }
        return dp[n][k];
    }
    
private:
    int findLastNonOverlapping(vector<vector<int>>& events, int right, int targetStart) {
        int left = 0;
        int res = -1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (events[mid][1] < targetStart) {
                res = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return res;
    }
};
