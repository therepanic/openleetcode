public class Solution {
    public int CountSubIslands(int[][] grid1, int[][] grid2) {
        int m = grid1.Length, n = grid1[0].Length;
        bool valid;
        
        void Dfs(int i, int j) {
            if (i < 0 || i >= m || j < 0 || j >= n) return;
            if (grid2[i][j] == 0) return;
            if (grid1[i][j] == 0) valid = false;
            grid2[i][j] = 0;
            Dfs(i+1, j);
            Dfs(i-1, j);
            Dfs(i, j+1);
            Dfs(i, j-1);
        }
        
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid2[i][j] == 1) {
                    valid = true;
                    Dfs(i, j);
                    if (valid) res++;
                }
            }
        }
        return res;
    }
}
