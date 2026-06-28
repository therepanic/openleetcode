class Solution {
    public int swimInWater(int[][] grid) {
        int n = grid.length;
        int[][] dirs = {{0,-1},{0,1},{-1,0},{1,0}};
        
        int low = 0, high = n * n - 1, ans = Integer.MAX_VALUE;
        while (low <= high) {
            int mid = (low + high) / 2;
            boolean[][] vis = new boolean[n][n];
            if (grid[0][0] <= mid && dfs(grid, vis, 0, 0, mid, n, dirs)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
    
    private boolean dfs(int[][] grid, boolean[][] vis, int x, int y, int t, int n, int[][] dirs) {
        if (x == n - 1 && y == n - 1) return true;
        vis[x][y] = true;
        for (int[] d : dirs) {
            int nx = x + d[0], ny = y + d[1];
            if (nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t) {
                if (dfs(grid, vis, nx, ny, t, n, dirs)) return true;
            }
        }
        return false;
    }
}
