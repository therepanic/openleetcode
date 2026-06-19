class Solution {
    public List<List<Integer>> pacificAtlantic(int[][] heights) {
        if (heights == null || heights.length == 0) return new ArrayList<>();
        int m = heights.length, n = heights[0].length;
        int[][] directions = {{1,0}, {-1,0}, {0,1}, {0,-1}};
        
        boolean[][] pacific = new boolean[m][n];
        boolean[][] atlantic = new boolean[m][n];
        
        for (int j = 0; j < n; j++) dfs(0, j, pacific, heights, directions);
        for (int i = 0; i < m; i++) dfs(i, 0, pacific, heights, directions);
        for (int j = 0; j < n; j++) dfs(m-1, j, atlantic, heights, directions);
        for (int i = 0; i < m; i++) dfs(i, n-1, atlantic, heights, directions);
        
        List<List<Integer>> result = new ArrayList<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.add(Arrays.asList(i, j));
                }
            }
        }
        return result;
    }
    
    private void dfs(int i, int j, boolean[][] visited, int[][] heights, int[][] directions) {
        visited[i][j] = true;
        for (int[] d : directions) {
            int x = i + d[0], y = j + d[1];
            if (x >= 0 && x < heights.length && y >= 0 && y < heights[0].length
                && !visited[x][y] && heights[x][y] >= heights[i][j]) {
                dfs(x, y, visited, heights, directions);
            }
        }
    }
}
