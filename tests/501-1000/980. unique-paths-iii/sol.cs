public class Solution {
    public int UniquePathsIII(int[][] grid) {
        int m = grid.Length, n = grid[0].Length;
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
        return Backtrack(grid, m, n, sx, sy, count);
    }
    
    private int Backtrack(int[][] grid, int m, int n, int i, int j, int count) {
        int result = 0;
        int[][] dirs = new int[][] {
            new int[] {i-1, j}, new int[] {i+1, j}, new int[] {i, j-1}, new int[] {i, j+1}
        };
        foreach (var d in dirs) {
            int x = d[0], y = d[1];
            if (x < 0 || x >= m || y < 0 || y >= n) continue;
            if (grid[x][y] == 2) {
                if (count == 0) result++;
            } else if (grid[x][y] == 0) {
                grid[x][y] = -1;
                result += Backtrack(grid, m, n, x, y, count - 1);
                grid[x][y] = 0;
            }
        }
        return result;
    }
}
