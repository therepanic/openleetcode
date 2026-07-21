class Solution {
public:
    vector<vector<int>> shiftGrid(vector<vector<int>>& grid, int k) {
        int m = grid.size();
        int n = grid[0].size();
        int total = m * n;
        k %= total;
        if (k == 0) {
            return grid;
        }
        
        vector<int> lastKElements(k);
        int i = m - 1;
        int x = n - 1;
        int count = 0;
        
        while (count != k) {
            lastKElements[count] = grid[i][x];
            if (x >= 1) {
                x--;
            } else {
                i--;
                x = n - 1;
            }
            count++;
        }
        
        int j = m - 1;
        int y = n - 1;
        
        while (i != 0 || x != -1) {
            if (x == -1) {
                i--;
                x = n - 1;
            }
            if (y == -1) {
                j--;
                y = n - 1;
            }
            grid[j][y] = grid[i][x];
            x--;
            y--;
        }
        
        int idx = 0;
        while (k > 0) {
            if (y == -1) {
                j--;
                y = n - 1;
            }
            grid[j][y] = lastKElements[idx];
            y--;
            k--;
            idx++;
        }
        
        return grid;
    }
};
