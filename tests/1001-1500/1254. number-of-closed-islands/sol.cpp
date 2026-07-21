class Solution {
public:
    int closedIsland(vector<vector<int>>& grid) {
        int m = grid.size(), n = grid[0].size();
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) continue;
                stack<pair<int, int>> st;
                st.push({i, j});
                grid[i][j] = 1;
                bool closed = true;
                while (!st.empty()) {
                    auto [r, c] = st.top(); st.pop();
                    if (r == 0 || c == 0 || r == m - 1 || c == n - 1)
                        closed = false;
                    vector<pair<int, int>> dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
                    for (auto [dr, dc] : dirs) {
                        int nr = r + dr, nc = c + dc;
                        if (nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                            grid[nr][nc] = 1;
                            st.push({nr, nc});
                        }
                    }
                }
                if (closed) res++;
            }
        }
        return res;
    }
};
