public class Solution {
    public int IslandPerimeter(int[][] grid) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        HashSet<(int, int)> visited = new HashSet<(int, int)>();
        
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
        
        Queue<(int, int)> queue = new Queue<(int, int)>();
        queue.Enqueue((startR, startC));
        visited.Add((startR, startC));
        int perimeter = 0;
        
        (int, int)[] dirs = {(-1,0),(1,0),(0,-1),(0,1)};
        
        while (queue.Count > 0) {
            var (r, c) = queue.Dequeue();
            
            foreach (var (dr, dc) in dirs) {
                int nr = r + dr;
                int nc = c + dc;
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0) {
                    perimeter++;
                } else if (!visited.Contains((nr, nc))) {
                    visited.Add((nr, nc));
                    queue.Enqueue((nr, nc));
                }
            }
        }
        
        return perimeter;
    }
}
