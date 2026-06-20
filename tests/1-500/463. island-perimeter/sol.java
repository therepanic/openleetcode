class Solution {
    public int islandPerimeter(int[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;
        Set<String> visited = new HashSet<>();
        
        int startR = -1, startC = -1;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] == 1) {
                    startR = r;
                    startC = c;
                    break;
                }
            }
            if (startR != -1) break;
        }
        
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{startR, startC});
        visited.add(startR + "," + startC);
        int perimeter = 0;
        
        int[][] dirs = {{-1,0},{1,0},{0,-1},{0,1}};
        
        while (!queue.isEmpty()) {
            int[] curr = queue.poll();
            int r = curr[0], c = curr[1];
            
            for (int[] dir : dirs) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0) {
                    perimeter++;
                } else if (!visited.contains(nr + "," + nc)) {
                    visited.add(nr + "," + nc);
                    queue.offer(new int[]{nr, nc});
                }
            }
        }
        
        return perimeter;
    }
}
