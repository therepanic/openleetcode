class Solution {
    public int maxDistance(int[][] grid) {
        if (grid == null || grid.length == 0 || grid[0].length == 0) {
            return -1;
        }
        
        int n = grid.length;
        java.util.Queue<int[]> frontier = new java.util.LinkedList<>();
        
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                if (grid[r][c] == 1) {
                    frontier.offer(new int[]{r, c});
                }
            }
        }
        
        if (frontier.isEmpty() || frontier.size() == n * n) {
            return -1;
        }
        
        int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        int distance = -1;
        
        while (!frontier.isEmpty()) {
            int size = frontier.size();
            distance++;
            
            for (int i = 0; i < size; i++) {
                int[] cell = frontier.poll();
                int r = cell[0], c = cell[1];
                
                for (int[] dir : directions) {
                    int nr = r + dir[0];
                    int nc = c + dir[1];
                    
                    if (nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                        grid[nr][nc] = 1;
                        frontier.offer(new int[]{nr, nc});
                    }
                }
            }
        }
        
        return distance;
    }
}
