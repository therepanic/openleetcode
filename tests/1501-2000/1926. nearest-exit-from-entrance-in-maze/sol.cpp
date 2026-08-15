class Solution {
public:
    int nearestExit(vector<vector<char>>& maze, vector<int>& entrance) {
        int n = maze.size(), m = maze[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        queue<tuple<int,int,int>> q;
        q.push({entrance[0], entrance[1], 0});
        visited[entrance[0]][entrance[1]] = true;
        int dirs[4][2] = {{-1,0},{1,0},{0,-1},{0,1}};
        
        while(!q.empty()) {
            auto [r, c, dist] = q.front(); q.pop();
            for(auto& d : dirs) {
                int nr = r + d[0], nc = c + d[1];
                if(nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == '.') {
                    visited[nr][nc] = true;
                    if(nr == 0 || nc == 0 || nr == n-1 || nc == m-1) return dist+1;
                    q.push({nr, nc, dist+1});
                }
            }
        }
        return -1;
    }
};
