public class Solution {
    public int MaxAreaOfIsland(int[][] grid) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        bool[][] visited = new bool[rows][];
        for (int i = 0; i < rows; i++) {
            visited[i] = new bool[cols];
        }
        int maxIsland = 0;
        
        int Dfs(int r, int c) {
            if (r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == 0) {
                return 0;
            }
            
            visited[r][c] = true;
            
            return 1 + Dfs(r+1, c) + Dfs(r-1, c) + Dfs(r, c+1) + Dfs(r, c-1);
        }
        
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] == 1 && !visited[r][c]) {
                    maxIsland = Math.Max(maxIsland, Dfs(r, c));
                }
            }
        }
        
        return maxIsland;
    }
}
