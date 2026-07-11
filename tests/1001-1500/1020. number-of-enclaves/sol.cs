using System.Collections.Generic;

public class Solution {
    public int NumEnclaves(int[][] grid) {
        int total = 0;
        foreach (var row in grid) {
            foreach (int val in row) {
                total += val;
            }
        }
        
        int m = grid.Length;
        int n = grid[0].Length;
        if (m == 1 || n == 1) return 0;
        
        Queue<(int, int)> q = new Queue<(int, int)>();
        HashSet<(int, int)> seen = new HashSet<(int, int)>();
        
        for (int i = 0; i < n; i++) {
            if (grid[0][i] == 1) {
                q.Enqueue((0, i));
                seen.Add((0, i));
            }
            if (grid[m-1][i] == 1) {
                q.Enqueue((m-1, i));
                seen.Add((m-1, i));
            }
        }
        for (int i = 1; i < m-1; i++) {
            if (grid[i][0] == 1) {
                q.Enqueue((i, 0));
                seen.Add((i, 0));
            }
            if (grid[i][n-1] == 1) {
                q.Enqueue((i, n-1));
                seen.Add((i, n-1));
            }
        }
        
        int[][] directions = new int[][] { new int[] {0,1}, new int[] {1,0}, new int[] {0,-1}, new int[] {-1,0} };
        int nextTotal = 0;
        
        while (q.Count > 0) {
            var (x, y) = q.Dequeue();
            nextTotal++;
            
            foreach (var dir in directions) {
                int nx = x + dir[0];
                int ny = y + dir[1];
                if (nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen.Contains((nx, ny))) {
                    q.Enqueue((nx, ny));
                    seen.Add((nx, ny));
                }
            }
        }
        
        return total - nextTotal;
    }
}
