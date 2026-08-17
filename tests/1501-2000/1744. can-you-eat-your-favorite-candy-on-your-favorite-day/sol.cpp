class Solution {
public:
    vector<bool> canEat(vector<int>& candiesCount, vector<vector<int>>& queries) {
        int n = candiesCount.size();
        int m = queries.size();
        vector<bool> ans(m, false);
        vector<long long> psum(n + 1, 0);
        for (int i = 1; i <= n; i++) {
            psum[i] = psum[i - 1] + candiesCount[i - 1];
        }
        for (int i = 0; i < m; i++) {
            int t = queries[i][0];
            long long day = queries[i][1];
            long long cap = queries[i][2];
            long long minDays = psum[t] / cap;
            long long maxDays = psum[t + 1] - 1;
            ans[i] = (minDays <= day && day <= maxDays);
        }
        return ans;
    }
};
