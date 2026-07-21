class Solution {
    public int minCost(int[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        int[][] minCost = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                minCost[i][j] = Integer.MAX_VALUE;
            }
        }
        minCost[0][0] = 0;
        
        java.util.Deque<int[]> deque = new java.util.ArrayDeque<>();
        deque.offerFirst(new int[]{0, 0});
        
        int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
        
        while (!deque.isEmpty()) {
            int[] curr = deque.pollFirst();
            int r = curr[0];
            int c = curr[1];
            
            for (int i = 0; i < 4; i++) {
                int nr = r + directions[i][0];
                int nc = c + directions[i][1];
                int cost = (grid[r][c] != i + 1) ? 1 : 0;
                
                if (nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c] + cost < minCost[nr][nc]) {
                    minCost[nr][nc] = minCost[r][c] + cost;
                    
                    if (cost == 1) {
                        deque.offerLast(new int[]{nr, nc});
                    } else {
                        deque.offerFirst(new int[]{nr, nc});
                    }
                }
            }
        }
        
        return minCost[m - 1][n - 1];
    }
}
