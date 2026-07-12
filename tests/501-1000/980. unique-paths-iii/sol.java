class Solution {
    public int uniquePathsIII(int[][] grid) {
        int m = grid.length, n = grid[0].length;
        int sx = -1, sy = -1;
        int count = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 0) count++;
                if (grid[i][j] == 1) {
                    sx = i;
                    sy = j;
                }
            }
        }
        return backtrack(grid, m, n, sx, sy, count);
    }
    
    private int backtrack(int[][] grid, int m, int n, int i, int j, int count) {
        int result = 0;
        int[][] dirs = {{i-1, j}, {i+1, j}, {i, j-1}, {i, j+1}};
        for (int[] d : dirs) {
            int x = d[0], y = d[1];
            if (x < 0 || x >= m || y < 0 || y >= n) continue;
            if (grid[x][y] == 2) {
                result += (count == 0 ? 1 : 0);
            } else if (grid[x][y] == 0) {
                grid[x][y] = -1;
                result += backtrack(grid, m, n, x, y, count - 1);
                grid[x][y] = 0;
            }
        }
        return result;
    }
}
