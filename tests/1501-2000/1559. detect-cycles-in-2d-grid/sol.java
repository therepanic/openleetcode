class Solution {
    public boolean containsCycle(char[][] grid) {
        int n = grid.length;
        int m = grid[0].length;
        boolean[][] visited = new boolean[n][m];
        int[][] directions = {{-1,0}, {1,0}, {0,-1}, {0,1}};
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j]) {
                    if (bfs(i, j, grid, visited, directions)) return true;
                }
            }
        }
        return false;
    }
    
    private boolean bfs(int startI, int startJ, char[][] grid, boolean[][] visited, int[][] directions) {
        int n = grid.length;
        int m = grid[0].length;
        int[][] queue = new int[n * m][4];
        int head = 0, tail = 0;
        queue[tail++] = new int[]{startI, startJ, -1, -1};
        visited[startI][startJ] = true;
        
        while (head < tail) {
            int[] cur = queue[head++];
            int x = cur[0], y = cur[1], px = cur[2], py = cur[3];
            
            for (int[] dir : directions) {
                int nx = x + dir[0], ny = y + dir[1];
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if (grid[nx][ny] != grid[x][y]) continue;
                if (nx == px && ny == py) continue;
                if (visited[nx][ny]) return true;
                visited[nx][ny] = true;
                queue[tail++] = new int[]{nx, ny, x, y};
            }
        }
        return false;
    }
}
