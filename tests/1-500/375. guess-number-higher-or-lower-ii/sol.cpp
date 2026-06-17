class Solution {
public:
    int getMoneyAmount(int n) {
        vector<vector<int>> dp(n + 1, vector<int>(n + 1, 0));
        for (int length = 2; length <= n; length++) {
            for (int start = n - length + 1; start >= 1; start--) {
                int end = start + length - 1;
                dp[start][end] = INT_MAX;
                for (int pivot = start; pivot <= end; pivot++) {
                    int left = pivot > start ? dp[start][pivot - 1] : 0;
                    int right = pivot < end ? dp[pivot + 1][end] : 0;
                    dp[start][end] = min(dp[start][end], pivot + max(left, right));
                }
            }
        }
        return dp[1][n];
    }
};
