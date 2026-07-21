public class Solution {
    public int MaxDistance(int[][] grid) {
        if (grid == null || grid.Length == 0 || grid[0].Length == 0) {
            return -1;
        }
        
        int n = grid.Length;
        var frontier = new Queue<(int, int)>();
        
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < n; c++) {
                if (grid[r][c] == 1) {
                    frontier.Enqueue((r, c));
                }
            }
        }
        
        if (frontier.Count == 0 || frontier.Count == n * n) {
            return -1;
        }
        
        (int, int)[] directions = { (-1, 0), (1, 0), (0, -1), (0, 1) };
        int distance = -1;
        
        while (frontier.Count > 0) {
            int size = frontier.Count;
            distance++;
            
            for (int i = 0; i < size; i++) {
                var (r, c) = frontier.Dequeue();
                
                foreach (var (dr, dc) in directions) {
                    int nr = r + dr;
                    int nc = c + dc;
                    
                    if (nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                        grid[nr][nc] = 1;
                        frontier.Enqueue((nr, nc));
                    }
                }
            }
        }
        
        return distance;
    }
}
