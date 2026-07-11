public class Solution {
    public int[][] ColorBorder(int[][] grid, int row, int col, int color) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        int startColor = grid[row][col];
        
        if (startColor == color) {
            return grid;
        }
        
        Queue<(int, int)> queue = new Queue<(int, int)>();
        queue.Enqueue((row, col));
        bool[][] visited = new bool[rows][];
        for (int i = 0; i < rows; i++) {
            visited[i] = new bool[cols];
        }
        visited[row][col] = true;
        List<(int, int)> borders = new List<(int, int)>();
        
        (int, int)[] dirs = { (-1, 0), (1, 0), (0, -1), (0, 1) };
        
        while (queue.Count > 0) {
            var (r, c) = queue.Dequeue();
            bool isBorder = false;
            
            foreach (var (dr, dc) in dirs) {
                int nr = r + dr;
                int nc = c + dc;
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) {
                    isBorder = true;
                } else if (grid[nr][nc] != startColor) {
                    isBorder = true;
                } else if (!visited[nr][nc]) {
                    visited[nr][nc] = true;
                    queue.Enqueue((nr, nc));
                }
            }
            
            if (isBorder) {
                borders.Add((r, c));
            }
        }
        
        foreach (var (r, c) in borders) {
            grid[r][c] = color;
        }
        
        return grid;
    }
}
