public class Solution {
    public int ShortestBridge(int[][] grid) {
        int n = grid.Length;
        int[][] directions = new int[][] { new int[] {-1, 0}, new int[] {1, 0}, new int[] {0, 1}, new int[] {0, -1} };
        bool[][] visited = new bool[n][];
        for (int i = 0; i < n; i++) visited[i] = new bool[n];
        Queue<(int r, int c, int dist)> q = new Queue<(int, int, int)>();
        
        void Dfs(int r, int c) {
            visited[r][c] = true;
            foreach (var d in directions) {
                int nr = r + d[0], nc = c + d[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 0) {
                        visited[nr][nc] = true;
                        q.Enqueue((nr, nc, 1));
                    } else {
                        Dfs(nr, nc);
                    }
                }
            }
        }
        
        bool found = false;
        for (int i = 0; i < n && !found; i++) {
            for (int j = 0; j < n && !found; j++) {
                if (grid[i][j] == 1) {
                    Dfs(i, j);
                    found = true;
                }
            }
        }
        
        while (q.Count > 0) {
            var (r, c, dist) = q.Dequeue();
            foreach (var d in directions) {
                int nr = r + d[0], nc = c + d[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
                    if (grid[nr][nc] == 1) return dist;
                    visited[nr][nc] = true;
                    q.Enqueue((nr, nc, dist + 1));
                }
            }
        }
        return 0;
    }
}
