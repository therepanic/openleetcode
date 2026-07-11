class Solution {
    public int largestIsland(int[][] grid) {
        int r = grid.length;
        int c = grid[0].length;
        int[][] dirs = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}};
        int island = 2;
        java.util.Map<Integer, Integer> a = new java.util.HashMap<>();
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 1) {
                    a.put(island, dfs(grid, i, j, r, c, dirs, island));
                    island++;
                }
            }
        }
        
        int res = 0;
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (grid[i][j] == 0) {
                    java.util.Set<Integer> y = new java.util.HashSet<>();
                    for (int[] d : dirs) {
                        int nx = i + d[0];
                        int ny = j + d[1];
                        if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0) {
                            y.add(grid[nx][ny]);
                        }
                    }
                    int tot = 1;
                    for (int b : y) {
                        tot += a.get(b);
                    }
                    res = Math.max(res, tot);
                }
            }
        }
        
        return Math.max(res, a.getOrDefault(2, 0));
    }
    
    private int dfs(int[][] grid, int i, int j, int r, int c, int[][] dirs, int x) {
        int tot = 1;
        grid[i][j] = x;
        for (int[] d : dirs) {
            int nx = i + d[0];
            int ny = j + d[1];
            if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1) {
                tot += dfs(grid, nx, ny, r, c, dirs, x);
            }
        }
        return tot;
    }
}
