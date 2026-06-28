class Solution {
public:
    vector<vector<int>> imageSmoother(vector<vector<int>>& img) {
        int m = img.size();
        int n = img[0].size();
        vector<vector<int>> P(m + 1, vector<int>(n + 1, 0));
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1];
            }
        }
        vector<vector<int>> res(m, vector<int>(n, 0));
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int a = max(0, i - 1);
                int b = max(0, j - 1);
                int c = min(m - 1, i + 1);
                int d = min(n - 1, j + 1);
                int s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b];
                res[i][j] = s / ((c - a + 1) * (d - b + 1));
            }
        }
        return res;
    }
};
