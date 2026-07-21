class Solution {
    private int n, m;
    private boolean[][] visited;
    private int[][] directions = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    
    public int getMaximumGold(int[][] grid) {
        n = grid.length;
        m = grid[0].length;
        visited = new boolean[n][m];
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j] && grid[i][j] != 0) {
                    ans = Math.max(ans, dfs(grid, i, j));
                }
            }
        }
        return ans;
    }
    
    private int dfs(int[][] grid, int r, int c) {
        int total = grid[r][c];
        visited[r][c] = true;
        
        int curr = 0;
        for (int[] dir : directions) {
            int nr = r + dir[0];
            int nc = c + dir[1];
            if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                if (grid[nr][nc] != 0 && !visited[nr][nc]) {
                    int a = dfs(grid, nr, nc);
                    curr = Math.max(curr, a);
                }
            }
        }
        total += curr;
        visited[r][c] = false;
        return total;
    }
}
