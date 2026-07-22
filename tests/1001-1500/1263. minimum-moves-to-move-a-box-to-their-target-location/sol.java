class Solution {
    public int minPushBox(char[][] grid) {
        int rows = grid.length, cols = grid[0].length;
        int[] player = null, box = null, target = null;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 'S') player = new int[]{i, j};
                else if (grid[i][j] == 'B') box = new int[]{i, j};
                else if (grid[i][j] == 'T') target = new int[]{i, j};
            }
        }
        
        int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{box[0], box[1], player[0], player[1], 0});
        Set<String> seen = new HashSet<>();
        seen.add(box[0] + "," + box[1] + "," + player[0] + "," + player[1]);
        
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int bx = cur[0], by = cur[1], px = cur[2], py = cur[3], pushes = cur[4];
            if (bx == target[0] && by == target[1]) return pushes;
            
            Set<String> reachable = new HashSet<>();
            Queue<int[]> walk = new LinkedList<>();
            walk.offer(new int[]{px, py});
            reachable.add(px + "," + py);
            
            while (!walk.isEmpty()) {
                int[] w = walk.poll();
                for (int[] d : dirs) {
                    int nx = w[0] + d[0], ny = w[1] + d[1];
                    if (nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                        !(nx == bx && ny == by) && grid[nx][ny] != '#' &&
                        !reachable.contains(nx + "," + ny)) {
                        reachable.add(nx + "," + ny);
                        walk.offer(new int[]{nx, ny});
                    }
                }
            }
            
            for (int[] d : dirs) {
                int nbx = bx + d[0], nby = by + d[1];
                int behindX = bx - d[0], behindY = by - d[1];
                if (nbx >= 0 && nbx < rows && nby >= 0 && nby < cols &&
                    grid[nbx][nby] != '#' &&
                    reachable.contains(behindX + "," + behindY) &&
                    !seen.contains(nbx + "," + nby + "," + bx + "," + by)) {
                    seen.add(nbx + "," + nby + "," + bx + "," + by);
                    q.offer(new int[]{nbx, nby, bx, by, pushes + 1});
                }
            }
        }
        return -1;
    }
}
