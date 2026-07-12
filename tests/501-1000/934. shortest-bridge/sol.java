class Solution {
    public int shortestBridge(int[][] grid) {
        int n = grid.length;
        int[][] directions = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
        boolean[][] visited = new boolean[n][n];
        Deque<int[]> q = new ArrayDeque<>();
        
        boolean found = false;
        for (int i = 0; i < n && !found; i++) {
            for (int j = 0; j < n && !found; j++) {
                if (grid[i][j] == 1) {
                    dfs(i, j, grid, visited, directions, q);
                    found = true;
                }
            }
        }
        
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int r = cur[0], c = cur[1], dist = cur[2];
            for (int[] dir : directions) {
                int nr = r + dir[0], nc = c + dir[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 1) return dist;
                    visited[nr][nc] = true;
                    q.offer(new int[]{nr, nc, dist + 1});
                }
            }
        }
        return 0;
    }
    
    private void dfs(int r, int c, int[][] grid, boolean[][] visited, int[][] directions, Deque<int[]> q) {
        visited[r][c] = true;
        for (int[] dir : directions) {
            int nr = r + dir[0], nc = c + dir[1];
            if (nr >= 0 && nr < grid.length && nc >= 0 && nc < grid.length && !visited[nr][nc]) {
                if (grid[nr][nc] == 0) {
                    visited[nr][nc] = true;
                    q.offer(new int[]{nr, nc, 1});
                } else {
                    dfs(nr, nc, grid, visited, directions, q);
                }
            }
        }
    }
}
