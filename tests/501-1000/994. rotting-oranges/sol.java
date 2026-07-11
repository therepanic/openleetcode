class Solution {
    public int orangesRotting(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        Queue<int[]> q = new LinkedList<>();
        int fresh = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 2) {
                    q.offer(new int[]{i, j, 0});
                } else if (grid[i][j] == 1) {
                    fresh++;
                }
            }
        }

        int[][] directions = {{-1,0},{1,0},{0,-1},{0,1}};
        int maxTime = 0, rotten = 0;

        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int r = cur[0], c = cur[1], t = cur[2];
            maxTime = Math.max(maxTime, t);

            for (int[] dir : directions) {
                int nr = r + dir[0], nc = c + dir[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1) {
                    grid[nr][nc] = 2;
                    q.offer(new int[]{nr, nc, t + 1});
                    rotten++;
                }
            }
        }

        return rotten == fresh ? maxTime : -1;
    }
}
