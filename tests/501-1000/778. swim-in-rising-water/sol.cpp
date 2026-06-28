class Solution {
public:
    int swimInWater(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<pair<int,int>> dirs = {{0,-1},{0,1},{-1,0},{1,0}};
        
        function<bool(int,int,int,vector<vector<bool>>&)> dfs = [&](int x, int y, int t, vector<vector<bool>>& vis) -> bool {
            if (x == n - 1 && y == n - 1) return true;
            vis[x][y] = true;
            for (auto [dx, dy] : dirs) {
                int nx = x + dx, ny = y + dy;
                if (nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t) {
                    if (dfs(nx, ny, t, vis)) return true;
                }
            }
            return false;
        };
        
        int low = 0, high = n * n - 1, ans = INT_MAX;
        while (low <= high) {
            int mid = (low + high) / 2;
            vector<vector<bool>> vis(n, vector<bool>(n, false));
            if (grid[0][0] <= mid && dfs(0, 0, mid, vis)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
};
