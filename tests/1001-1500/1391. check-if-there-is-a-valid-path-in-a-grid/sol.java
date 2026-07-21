class Solution {
    public boolean hasValidPath(int[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        
        int[][][] dir = new int[7][][];
        dir[1] = new int[][]{{0, -1}, {0, 1}};
        dir[2] = new int[][]{{-1, 0}, {1, 0}};
        dir[3] = new int[][]{{0, -1}, {1, 0}};
        dir[4] = new int[][]{{0, 1}, {1, 0}};
        dir[5] = new int[][]{{0, -1}, {-1, 0}};
        dir[6] = new int[][]{{0, 1}, {-1, 0}};
        
        boolean[][] vis = new boolean[m][n];
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{0, 0});
        vis[0][0] = true;
        
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int r = cur[0], c = cur[1];
            
            if (r == m - 1 && c == n - 1) {
                return true;
            }
            
            for (int[] d : dir[grid[r][c]]) {
                int nr = r + d[0];
                int nc = c + d[1];
                
                if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
                    continue;
                }
                
                for (int[] bd : dir[grid[nr][nc]]) {
                    if (nr + bd[0] == r && nc + bd[1] == c) {
                        vis[nr][nc] = true;
                        q.offer(new int[]{nr, nc});
                    }
                }
            }
        }
        
        return false;
    }
}
