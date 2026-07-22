public class Solution {
    public int ClosedIsland(int[][] grid) {
        int m = grid.Length, n = grid[0].Length;
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) continue;
                Stack<(int, int)> stack = new Stack<(int, int)>();
                stack.Push((i, j));
                grid[i][j] = 1;
                bool closed = true;
                while (stack.Count > 0) {
                    var (r, c) = stack.Pop();
                    if (r == 0 || c == 0 || r == m - 1 || c == n - 1)
                        closed = false;
                    (int, int)[] dirs = { (1, 0), (-1, 0), (0, 1), (0, -1) };
                    foreach (var (dr, dc) in dirs) {
                        int nr = r + dr, nc = c + dc;
                        if (nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                            grid[nr][nc] = 1;
                            stack.Push((nr, nc));
                        }
                    }
                }
                if (closed) res++;
            }
        }
        return res;
    }
}
