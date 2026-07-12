class Solution {
public:
    int numMagicSquaresInside(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size(), c = 0;
        for (int i = 0; i < m - 2; i++) {
            for (int j = 0; j < n - 2; j++) {
                if (isMagicSquare(grid, i, j)) {
                    c++;
                }
            }
        }
        return c;
    }

private:
    bool isMagicSquare(vector<vector<int>>& grid, int r, int c) {
        if (grid[r+1][c+1] != 5) return false;

        int a = grid[r][c], b = grid[r][c+1], d = grid[r][c+2];
        int e = grid[r+1][c], f = grid[r+1][c+2];
        int h = grid[r+2][c], i = grid[r+2][c+1], j = grid[r+2][c+2];

        bool seen[10] = {false};
        int arr[] = {a, b, d, e, f, h, i, j, 5};
        for (int x : arr) {
            if (x < 1 || x > 9 || seen[x]) return false;
            seen[x] = true;
        }

        if (a + j != 10) return false;
        if (b + i != 10) return false;
        if (d + h != 10) return false;
        if (e + f != 10) return false;

        if (a + b + d != 15) return false;
        if (h + i + j != 15) return false;
        if (a + e + h != 15) return false;
        if (d + f + j != 15) return false;
        if (a + 5 + j != 15) return false;
        if (d + 5 + h != 15) return false;

        return true;
    }
};
