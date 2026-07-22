class Solution {
    public int closedIsland(int[][] grid) {
        int m = grid.length, n = grid[0].length;
        int res = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) continue;
                Deque<int[]> stack = new ArrayDeque<>();
                stack.push(new int[]{i, j});
                grid[i][j] = 1;
                boolean closed = true;
                while (!stack.isEmpty()) {
                    int[] cur = stack.pop();
                    int r = cur[0], c = cur[1];
                    if (r == 0 || c == 0 || r == m - 1 || c == n - 1)
                        closed = false;
                    int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
                    for (int[] d : dirs) {
                        int nr = r + d[0], nc = c + d[1];
                        if (nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0) {
                            grid[nr][nc] = 1;
                            stack.push(new int[]{nr, nc});
                        }
                    }
                }
                if (closed) res++;
            }
        }
        return res;
    }
}
