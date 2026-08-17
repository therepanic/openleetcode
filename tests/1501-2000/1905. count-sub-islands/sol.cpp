class Solution {
public:
    int countSubIslands(vector<vector<int>>& grid1, vector<vector<int>>& grid2) {
        int m = grid1.size(), n = grid1[0].size();
        bool valid;
        function<void(int,int)> dfs = [&](int i, int j) {
            if (i < 0 || i >= m || j < 0 || j >= n) return;
            if (grid2[i][j] == 0) return;
            if (grid1[i][j] == 0) valid = false;
            grid2[i][j] = 0;
            dfs(i+1, j);
            dfs(i-1, j);
            dfs(i, j+1);
            dfs(i, j-1);
        };
        
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid2[i][j] == 1) {
                    valid = true;
                    dfs(i, j);
                    if (valid) res++;
                }
            }
        }
        return res;
    }
};
