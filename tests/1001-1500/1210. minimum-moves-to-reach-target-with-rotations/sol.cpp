class Solution {
public:
    int minimumMoves(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<int> target = {n - 1, n - 2, 0};
        
        queue<pair<vector<int>, int>> q;
        q.push({{0, 0, 0}, 0});
        
        vector<vector<vector<bool>>> visited(n, vector<vector<bool>>(n, vector<bool>(2, false)));
        visited[0][0][0] = true;
        
        while (!q.empty()) {
            auto [state, dist] = q.front();
            q.pop();
            int r = state[0], c = state[1], o = state[2];
            
            if (r == target[0] && c == target[1] && o == target[2]) {
                return dist;
            }
            
            if (o == 0) {
                if (c + 2 < n && grid[r][c + 2] == 0) {
                    if (!visited[r][c + 1][0]) {
                        visited[r][c + 1][0] = true;
                        q.push({{r, c + 1, 0}, dist + 1});
                    }
                }
                if (r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r + 1][c][0]) {
                        visited[r + 1][c][0] = true;
                        q.push({{r + 1, c, 0}, dist + 1});
                    }
                }
            } else {
                if (c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r][c + 1][1]) {
                        visited[r][c + 1][1] = true;
                        q.push({{r, c + 1, 1}, dist + 1});
                    }
                }
                if (r + 2 < n && grid[r + 2][c] == 0) {
                    if (!visited[r + 1][c][1]) {
                        visited[r + 1][c][1] = true;
                        q.push({{r + 1, c, 1}, dist + 1});
                    }
                }
            }
            
            if (r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                int new_o = 1 - o;
                if (!visited[r][c][new_o]) {
                    visited[r][c][new_o] = true;
                    q.push({{r, c, new_o}, dist + 1});
                }
            }
        }
        
        return -1;
    }
};
