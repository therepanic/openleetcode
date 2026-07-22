class Solution {
public:
    int largest1BorderedSquare(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        vector<vector<int>> h(m, vector<int>(n, 0));
        vector<vector<int>> v(m, vector<int>(n, 0));
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j]) {
                    h[i][j] = (j == 0 ? 0 : h[i][j-1]) + 1;
                    v[i][j] = (i == 0 ? 0 : v[i-1][j]) + 1;
                }
            }
        }
        int ans = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int sz = min(h[i][j], v[i][j]);
                for (int k = sz; k >= 1; k--) {
                    if (h[i-k+1][j] >= k && v[i][j-k+1] >= k) {
                        ans = max(ans, k);
                        break;
                    }
                }
            }
        }
        return ans * ans;
    }
};
