public class Solution {
    public int ShortestPathBinaryMatrix(int[][] grid) {
        int n = grid.Length;
        
        if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) {
            return -1;
        }
        
        if (n == 1) {
            return 1;
        }
        
        int[][] dist = new int[n][];
        for (int i = 0; i < n; i++) {
            dist[i] = new int[n];
            for (int j = 0; j < n; j++) {
                dist[i][j] = int.MaxValue;
            }
        }
        dist[0][0] = 1;
        
        Queue<int[]> q = new Queue<int[]>();
        q.Enqueue(new int[] { 0, 0, 1 });
        
        int[][] directions = new int[][] {
            new int[] { -1, 0 }, new int[] { -1, -1 }, new int[] { 0, 1 }, new int[] { -1, 1 },
            new int[] { 1, 0 }, new int[] { 1, -1 }, new int[] { 0, -1 }, new int[] { 1, 1 }
        };
        
        while (q.Count > 0) {
            int[] curr = q.Dequeue();
            int r = curr[0], c = curr[1], dis = curr[2];
            
            foreach (int[] dir in directions) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                
                if (nr >= 0 && nr < n && nc >= 0 && nc < n &&
                    grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]) {
                    
                    dist[nr][nc] = dis + 1;
                    
                    if (nr == n - 1 && nc == n - 1) {
                        return dis + 1;
                    }
                    
                    q.Enqueue(new int[] { nr, nc, dis + 1 });
                }
            }
        }
        
        return -1;
    }
}
