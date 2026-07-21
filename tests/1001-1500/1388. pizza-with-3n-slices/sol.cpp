class Solution {
public:
    int maxSizeSlices(vector<int>& slices) {
        int n = slices.size();
        int m = n / 3;
        return max(dp(slices, 0, n - 2, m), dp(slices, 1, n - 1, m));
    }

private:
    int dp(vector<int>& slices, int start, int end, int m) {
        int k = end - start + 1;
        vector<vector<int>> dpTable(k + 1, vector<int>(m + 1, 0));
        for (int i = 1; i <= k; i++) {
            for (int j = 1; j <= min(i, m); j++) {
                dpTable[i][j] = max(dpTable[i - 1][j], (i > 1 ? dpTable[i - 2][j - 1] : 0) + slices[start + i - 1]);
            }
        }
        return dpTable[k][m];
    }
};
