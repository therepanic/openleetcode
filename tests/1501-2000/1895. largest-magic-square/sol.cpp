class Solution {
public:
    int largestMagicSquare(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        int res = 1;

        auto isValid = [&](int i, int j, int k) {
            int s = -1;
            for (int x = i; x < i + k; x++) {
                int row = 0;
                for (int y = j; y < j + k; y++) row += grid[x][y];
                if (s == -1) s = row;
                else if (s != row) return false;
            }

            for (int y = j; y < j + k; y++) {
                int col = 0;
                for (int x = i; x < i + k; x++) col += grid[x][y];
                if (col != s) return false;
            }

            int d1 = 0, d2 = 0;
            for (int d = 0; d < k; d++) {
                d1 += grid[i + d][j + d];
                d2 += grid[i + d][j + k - 1 - d];
            }
            if (d1 != s || d2 != s) return false;

            return true;
        };

        for (int k = 2; k <= min(m, n); k++) {
            for (int i = 0; i <= m - k; i++) {
                for (int j = 0; j <= n - k; j++) {
                    if (isValid(i, j, k)) res = k;
                }
            }
        }
        return res;
    }
};
