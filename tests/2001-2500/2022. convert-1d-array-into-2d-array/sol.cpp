class Solution {
public:
    vector<vector<int>> construct2DArray(vector<int>& original, int m, int n) {
        int k = original.size();
        if (m * n != k) return {};
        vector<vector<int>> ans(m, vector<int>(n));
        int idx = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                ans[i][j] = original[idx++];
            }
        }
        return ans;
    }
};
