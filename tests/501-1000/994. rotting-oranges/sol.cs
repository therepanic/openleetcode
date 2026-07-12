public class Solution {
    public int OrangesRotting(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        Queue<(int, int, int)> q = new Queue<(int, int, int)>();
        int fresh = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 2) {
                    q.Enqueue((i, j, 0));
                } else if (grid[i][j] == 1) {
                    fresh++;
                }
            }
        }

        (int, int)[] directions = {(-1,0),(1,0),(0,-1),(0,1)};
        int maxTime = 0, rotten = 0;

        while (q.Count > 0) {
            var (r, c, t) = q.Dequeue();
            if (t > maxTime) maxTime = t;

            foreach (var (dr, dc) in directions) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1) {
                    grid[nr][nc] = 2;
                    q.Enqueue((nr, nc, t + 1));
                    rotten++;
                }
            }
        }

        return rotten == fresh ? maxTime : -1;
    }
}
