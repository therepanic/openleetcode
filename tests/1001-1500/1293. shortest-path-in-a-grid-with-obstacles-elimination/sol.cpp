class Solution {
public:
    int shortestPath(vector<vector<int>>& grid, int k) {
        int n = grid.size(), m = grid[0].size();
        queue<vector<int>> q;
        q.push({0, 0, k, 0});
        set<vector<int>> visi;
        visi.insert({0, 0, k});
        vector<pair<int, int>> dirs = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
        while (!q.empty()) {
            auto cur = q.front(); q.pop();
            int r = cur[0], c = cur[1], k_rem = cur[2], d = cur[3];
            if (r == n - 1 && c == m - 1) return d;
            if (grid[r][c] == 1) k_rem--;
            for (auto [dr, dc] : dirs) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    if (visi.find({nr, nc, k_rem}) == visi.end() && k_rem >= 0) {
                        visi.insert({nr, nc, k_rem});
                        q.push({nr, nc, k_rem, d + 1});
                    }
                }
            }
        }
        return -1;
    }
};
