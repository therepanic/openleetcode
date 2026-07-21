class Solution {
    public int shortestPath(int[][] grid, int k) {
        int n = grid.length, m = grid[0].length;
        var q = new java.util.ArrayDeque<int[]>();
        q.add(new int[]{0, 0, k, 0});
        var visi = new java.util.HashSet<String>();
        visi.add(0 + "," + 0 + "," + k);
        int[][] dirs = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int r = cur[0], c = cur[1], k_rem = cur[2], d = cur[3];
            if (r == n - 1 && c == m - 1) return d;
            if (grid[r][c] == 1) k_rem--;
            for (int[] dir : dirs) {
                int nr = r + dir[0], nc = c + dir[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    String key = nr + "," + nc + "," + k_rem;
                    if (!visi.contains(key) && k_rem >= 0) {
                        visi.add(key);
                        q.add(new int[]{nr, nc, k_rem, d + 1});
                    }
                }
            }
        }
        return -1;
    }
}
