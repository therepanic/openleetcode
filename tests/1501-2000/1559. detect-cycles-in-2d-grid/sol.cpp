class Solution {
public:
    bool containsCycle(vector<vector<char>>& grid) {
        int n = grid.size();
        int m = grid[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        vector<pair<int,int>> directions = {{-1,0}, {1,0}, {0,-1}, {0,1}};
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j]) {
                    if (bfs(i, j, grid, visited, directions)) return true;
                }
            }
        }
        return false;
    }
    
private:
    bool bfs(int startI, int startJ, vector<vector<char>>& grid, vector<vector<bool>>& visited, vector<pair<int,int>>& directions) {
        int n = grid.size();
        int m = grid[0].size();
        queue<tuple<int,int,int,int>> q;
        q.push({startI, startJ, -1, -1});
        visited[startI][startJ] = true;
        
        while (!q.empty()) {
            auto [x, y, px, py] = q.front();
            q.pop();
            
            for (auto& dir : directions) {
                int nx = x + dir.first;
                int ny = y + dir.second;
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if (grid[nx][ny] != grid[x][y]) continue;
                if (nx == px && ny == py) continue;
                if (visited[nx][ny]) return true;
                visited[nx][ny] = true;
                q.push({nx, ny, x, y});
            }
        }
        return false;
    }
};
