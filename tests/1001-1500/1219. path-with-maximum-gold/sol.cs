public class Solution {
    private int n, m;
    private bool[][] visited;
    private int[][] directions = new int[][] { new int[] {-1, 0}, new int[] {0, 1}, new int[] {1, 0}, new int[] {0, -1} };
    
    public int GetMaximumGold(int[][] grid) {
        n = grid.Length;
        m = grid[0].Length;
        visited = new bool[n][];
        for (int i = 0; i < n; i++) {
            visited[i] = new bool[m];
        }
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j] && grid[i][j] != 0) {
                    ans = Math.Max(ans, dfs(grid, i, j));
                }
            }
        }
        return ans;
    }
    
    private int dfs(int[][] grid, int r, int c) {
        int total = grid[r][c];
        visited[r][c] = true;
        
        int curr = 0;
        foreach (var dir in directions) {
            int nr = r + dir[0];
            int nc = c + dir[1];
            if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                if (grid[nr][nc] != 0 && !visited[nr][nc]) {
                    int a = dfs(grid, nr, nc);
                    curr = Math.Max(curr, a);
                }
            }
        }
        total += curr;
        visited[r][c] = false;
        return total;
    }
}
