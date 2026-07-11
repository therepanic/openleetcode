class Solution {
public:
    int shortestBridge(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<pair<int, int>> directions = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
        vector<vector<bool>> visited(n, vector<bool>(n, false));
        queue<tuple<int, int, int>> q;
        
        function<void(int, int)> dfs = [&](int r, int c) {
            visited[r][c] = true;
            for (auto [dr, dc] : directions) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 0) {
                        visited[nr][nc] = true;
                        q.push({nr, nc, 1});
                    } else {
                        dfs(nr, nc);
                    }
                }
            }
        };
        
        bool found = false;
        for (int i = 0; i < n && !found; i++) {
            for (int j = 0; j < n && !found; j++) {
                if (grid[i][j] == 1) {
                    dfs(i, j);
                    found = true;
                }
            }
        }
        
        while (!q.empty()) {
            auto [r, c, dist] = q.front();
            q.pop();
            for (auto [dr, dc] : directions) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 1) return dist;
                    visited[nr][nc] = true;
                    q.push({nr, nc, dist + 1});
                }
            }
        }
        return 0;
    }
};
