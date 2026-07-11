class Solution {
public:
    int largestIsland(vector<vector<int>>& grid) {
        int r = grid.size();
        int c = grid[0].size();
        vector<pair<int, int>> dirs = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}};
        int island = 2;
        unordered_map<int, int> a;
        
        function<int(int, int, int)> dfs = [&](int i, int j, int x) -> int {
            int tot = 1;
            grid[i][j] = x;
            for (auto [dx, dy] : dirs) {
                int nx = i + dx;
                int ny = j + dy;
                if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1) {
                    tot += dfs(nx, ny, x);
                }
            }
            return tot;
        };
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 1) {
                    a[island] = dfs(i, j, island);
                    island++;
                }
            }
        }
        
        int res = 0;
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 0) {
                    unordered_set<int> y;
                    for (auto [dx, dy] : dirs) {
                        int nx = i + dx;
                        int ny = j + dy;
                        if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0) {
                            y.insert(grid[nx][ny]);
                        }
                    }
                    int tot = 1;
                    for (int b : y) {
                        tot += a[b];
                    }
                    res = max(res, tot);
                }
            }
        }
        
        return max(res, a[2]);
    }
};
