class Solution {
    public int shortestPathBinaryMatrix(int[][] grid) {
        int n = grid.length;
        
        if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) {
            return -1;
        }
        
        if (n == 1) {
            return 1;
        }
        
        int[][] dist = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dist[i][j] = Integer.MAX_VALUE;
            }
        }
        dist[0][0] = 1;
        
        java.util.Queue<int[]> q = new java.util.LinkedList<>();
        q.offer(new int[]{0, 0, 1});
        
        int[][] directions = {
            {-1, 0}, {-1, -1}, {0, 1}, {-1, 1},
            {1, 0}, {1, -1}, {0, -1}, {1, 1}
        };
        
        while (!q.isEmpty()) {
            int[] curr = q.poll();
            int r = curr[0], c = curr[1], dis = curr[2];
            
            for (int[] dir : directions) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                
                if (nr >= 0 && nr < n && nc >= 0 && nc < n &&
                    grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]) {
                    
                    dist[nr][nc] = dis + 1;
                    
                    if (nr == n - 1 && nc == n - 1) {
                        return dis + 1;
                    }
                    
                    q.offer(new int[]{nr, nc, dis + 1});
                }
            }
        }
        
        return -1;
    }
}
