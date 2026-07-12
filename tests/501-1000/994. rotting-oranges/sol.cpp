class Solution {
public:
    int orangesRotting(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        queue<tuple<int,int,int>> q;
        int fresh = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 2) {
                    q.push({i, j, 0});
                } else if (grid[i][j] == 1) {
                    fresh++;
                }
            }
        }

        vector<pair<int,int>> directions = {{-1,0},{1,0},{0,-1},{0,1}};
        int maxTime = 0, rotten = 0;

        while (!q.empty()) {
            auto [r, c, t] = q.front(); q.pop();
            if (t > maxTime) maxTime = t;

            for (auto [dr, dc] : directions) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1) {
                    grid[nr][nc] = 2;
                    q.push({nr, nc, t + 1});
                    rotten++;
                }
            }
        }

        return rotten == fresh ? maxTime : -1;
    }
};
