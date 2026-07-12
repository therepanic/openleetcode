class Solution {
    public int[][] colorBorder(int[][] grid, int row, int col, int color) {
        int rows = grid.length;
        int cols = grid[0].length;
        int startColor = grid[row][col];
        
        if (startColor == color) {
            return grid;
        }
        
        java.util.Queue<int[]> queue = new java.util.LinkedList<>();
        queue.offer(new int[]{row, col});
        boolean[][] visited = new boolean[rows][cols];
        visited[row][col] = true;
        java.util.List<int[]> borders = new java.util.ArrayList<>();
        
        int[][] dirs = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        
        while (!queue.isEmpty()) {
            int[] cur = queue.poll();
            int r = cur[0], c = cur[1];
            boolean isBorder = false;
            
            for (int[] dir : dirs) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) {
                    isBorder = true;
                } else if (grid[nr][nc] != startColor) {
                    isBorder = true;
                } else if (!visited[nr][nc]) {
                    visited[nr][nc] = true;
                    queue.offer(new int[]{nr, nc});
                }
            }
            
            if (isBorder) {
                borders.add(new int[]{r, c});
            }
        }
        
        for (int[] cell : borders) {
            grid[cell[0]][cell[1]] = color;
        }
        
        return grid;
    }
}
