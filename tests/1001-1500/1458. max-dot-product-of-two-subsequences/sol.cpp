class Solution {
public:
    int maxDotProduct(vector<int>& nums1, vector<int>& nums2) {
        int n = nums1.size(), m = nums2.size();
        vector<vector<int>> memo(n, vector<int>(m, INT_MIN));
        
        function<int(int, int)> dp = [&](int i, int j) -> int {
            if (i == n || j == m) {
                return INT_MIN;
            }
            if (memo[i][j] != INT_MIN) {
                return memo[i][j];
            }
            
            int take = nums1[i] * nums2[j];
            int res = take;
            int takeAndContinue = dp(i + 1, j + 1);
            if (takeAndContinue != INT_MIN) {
                res = max(res, take + takeAndContinue);
            }
            res = max(res, dp(i + 1, j));
            res = max(res, dp(i, j + 1));
            
            memo[i][j] = res;
            return res;
        };
        
        return dp(0, 0);
    }
};
