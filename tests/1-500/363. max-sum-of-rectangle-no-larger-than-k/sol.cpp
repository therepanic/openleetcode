class Solution {
public:
    int maxSumSubmatrix(vector<vector<int>>& matrix, int k) {
        int m = matrix.size();
        int n = matrix[0].size();
        int ans = INT_MIN;
        for (int left = 0; left < n; left++) {
            vector<int> rowSum(m, 0);
            for (int right = left; right < n; right++) {
                for (int i = 0; i < m; i++) {
                    rowSum[i] += matrix[i][right];
                }
                set<int> s;
                s.insert(0);
                int curr = 0;
                for (int x : rowSum) {
                    curr += x;
                    auto it = s.lower_bound(curr - k);
                    if (it != s.end()) {
                        ans = max(ans, curr - *it);
                    }
                    s.insert(curr);
                }
            }
        }
        return ans;
    }
};
