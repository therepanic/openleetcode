class Solution {
public:
    vector<vector<int>> pacificAtlantic(vector<vector<int>>& heights) {
        if (heights.empty()) return {};
        int m = heights.size(), n = heights[0].size();
        vector<vector<int>> directions = {{1,0}, {-1,0}, {0,1}, {0,-1}};
        
        vector<vector<bool>> pacific(m, vector<bool>(n, false));
        vector<vector<bool>> atlantic(m, vector<bool>(n, false));
        
        function<void(int, int, vector<vector<bool>>&)> dfs = [&](int i, int j, vector<vector<bool>>& visited) {
            visited[i][j] = true;
            for (auto& d : directions) {
                int x = i + d[0], y = j + d[1];
                if (x >= 0 && x < m && y >= 0 && y < n 
                    && !visited[x][y] && heights[x][y] >= heights[i][j]) {
                    dfs(x, y, visited);
                }
            }
        };
        
        for (int j = 0; j < n; j++) dfs(0, j, pacific);
        for (int i = 0; i < m; i++) dfs(i, 0, pacific);
        for (int j = 0; j < n; j++) dfs(m-1, j, atlantic);
        for (int i = 0; i < m; i++) dfs(i, n-1, atlantic);
        
        vector<vector<int>> result;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.push_back({i, j});
                }
            }
        }
        return result;
    }
};
