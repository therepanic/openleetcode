class Solution {
public:
    bool hasValidPath(vector<vector<int>>& grid) {
        int m = grid.size();
        int n = grid[0].size();
        
        unordered_map<int, vector<pair<int, int>>> dir;
        dir[1] = {{0, -1}, {0, 1}};
        dir[2] = {{-1, 0}, {1, 0}};
        dir[3] = {{0, -1}, {1, 0}};
        dir[4] = {{0, 1}, {1, 0}};
        dir[5] = {{0, -1}, {-1, 0}};
        dir[6] = {{0, 1}, {-1, 0}};
        
        vector<vector<bool>> vis(m, vector<bool>(n, false));
        queue<pair<int, int>> q;
        q.push({0, 0});
        vis[0][0] = true;
        
        while (!q.empty()) {
            auto [r, c] = q.front();
            q.pop();
            
            if (r == m - 1 && c == n - 1) {
                return true;
            }
            
            for (auto& [dr, dc] : dir[grid[r][c]]) {
                int nr = r + dr;
                int nc = c + dc;
                
                if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
                    continue;
                }
                
                for (auto& [bdr, bdc] : dir[grid[nr][nc]]) {
                    if (nr + bdr == r && nc + bdc == c) {
                        vis[nr][nc] = true;
                        q.push({nr, nc});
                    }
                }
            }
        }
        
        return false;
    }
};
