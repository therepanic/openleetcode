class Solution {
    public int[][] findFarmland(int[][] land) {
        int n = land.length;
        int m = land[0].length;
        boolean[][] visited = new boolean[n][m];
        int[][] directions = {{-1,0},{0,1},{1,0},{0,-1}};
        
        int[] maxr = new int[1];
        int[] maxc = new int[1];
        
        java.util.List<int[]> res = new java.util.ArrayList<>();
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (land[i][j] == 1 && !visited[i][j]) {
                    maxr[0] = i;
                    maxc[0] = j;
                    dfs(land, visited, directions, i, j, maxr, maxc);
                    res.add(new int[]{i, j, maxr[0], maxc[0]});
                }
            }
        }
        return res.toArray(new int[0][]);
    }
    
    private void dfs(int[][] land, boolean[][] visited, int[][] directions, int r, int c, int[] maxr, int[] maxc) {
        visited[r][c] = true;
        maxr[0] = Math.max(maxr[0], r);
        maxc[0] = Math.max(maxc[0], c);
        for (int[] d : directions) {
            int nr = r + d[0];
            int nc = c + d[1];
            if (nr >= 0 && nr < land.length && nc >= 0 && nc < land[0].length) {
                if (!visited[nr][nc] && land[nr][nc] == 1) {
                    dfs(land, visited, directions, nr, nc, maxr, maxc);
                }
            }
        }
    }
}
