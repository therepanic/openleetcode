class Solution {
public:
    vector<vector<int>> findFarmland(vector<vector<int>>& land) {
        int n = land.size();
        int m = land[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        vector<pair<int,int>> directions = {{-1,0},{0,1},{1,0},{0,-1}};
        
        vector<int> maxr(1);
        vector<int> maxc(1);
        
        function<void(int,int)> dfs = [&](int r, int c) {
            visited[r][c] = true;
            maxr[0] = max(maxr[0], r);
            maxc[0] = max(maxc[0], c);
            for (auto& d : directions) {
                int nr = r + d.first;
                int nc = c + d.second;
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    if (!visited[nr][nc] && land[nr][nc] == 1) {
                        dfs(nr, nc);
                    }
                }
            }
        };
        
        vector<vector<int>> res;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (land[i][j] == 1 && !visited[i][j]) {
                    maxr[0] = i;
                    maxc[0] = j;
                    dfs(i, j);
                    res.push_back({i, j, maxr[0], maxc[0]});
                }
            }
        }
        return res;
    }
};
