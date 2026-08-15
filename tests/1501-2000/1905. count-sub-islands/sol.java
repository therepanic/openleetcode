class Solution {
    public int countSubIslands(int[][] grid1, int[][] grid2) {
        int m = grid1.length, n = grid1[0].length;
        boolean[] valid = new boolean[1];
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid2[i][j] == 1) {
                    valid[0] = true;
                    dfs(grid1, grid2, i, j, m, n, valid);
                    if (valid[0]) res++;
                }
            }
        }
        return res;
    }
    private void dfs(int[][] grid1, int[][] grid2, int i, int j, int m, int n, boolean[] valid) {
        if (i < 0 || i >= m || j < 0 || j >= n) return;
        if (grid2[i][j] == 0) return;
        if (grid1[i][j] == 0) valid[0] = false;
        grid2[i][j] = 0;
        dfs(grid1, grid2, i+1, j, m, n, valid);
        dfs(grid1, grid2, i-1, j, m, n, valid);
        dfs(grid1, grid2, i, j+1, m, n, valid);
        dfs(grid1, grid2, i, j-1, m, n, valid);
    }
}
