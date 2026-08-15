class Solution {

public:

    vector<vector<int>> rotateGrid(vector<vector<int>>& grid, int k) {

        int T = 0, L = 0;

        int B = grid.size() - 1, R = grid[0].size() - 1;

        while (T < B && L < R) {

            int ln = B - T, wid = R - L;

            int perimeter = 2 * ln + 2 * wid;

            int r = k % perimeter;

            while (r--) {

                int tmp = grid[T][L];

                for (int i = L; i < R; ++i) grid[T][i] = grid[T][i + 1];

                for (int i = T; i < B; ++i) grid[i][R] = grid[i + 1][R];

                for (int i = R; i > L; --i) grid[B][i] = grid[B][i - 1];

                for (int i = B; i > T; --i) grid[i][L] = grid[i - 1][L];

                grid[T + 1][L] = tmp;

            }

            ++T; ++L; --B; --R;

        }

        return grid;

    }

};
