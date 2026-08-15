class Solution {
    public int minDays(int[][] grid) {
        if (countIslands(grid) != 1) return 0;
        
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 1) {
                    grid[i][j] = 0;
                    if (countIslands(grid) != 1) return 1;
                    grid[i][j] = 1;
                }
            }
        }
        return 2;
    }
    
    private int countIslands(int[][] grid) {
        boolean[][] seen = new boolean[grid.length][grid[0].length];
        int islands = 0;
        
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 1 && !seen[i][j]) {
                    islands++;
                    dfs(grid, i, j, seen);
                }
            }
        }
        return islands;
    }
    
    private void dfs(int[][] grid, int r, int c, boolean[][] seen) {
        int[][] dirs = {{-1,0},{1,0},{0,-1},{0,1}};
        java.util.Stack<int[]> stack = new java.util.Stack<>();
        stack.push(new int[]{r, c});
        while (!stack.isEmpty()) {
            int[] cell = stack.pop();
            int x = cell[0], y = cell[1];
            for (int[] d : dirs) {
                int nx = x + d[0], ny = y + d[1];
                if (nx >= 0 && nx < grid.length && ny >= 0 && ny < grid[0].length && grid[nx][ny] == 1 && !seen[nx][ny]) {
                    seen[nx][ny] = true;
                    stack.push(new int[]{nx, ny});
                }
            }
        }
    }
}
