class Solution {
    public int[][] floodFill(int[][] image, int sr, int sc, int color) {
        int old = image[sr][sc];
        if (old == color) return image;
        int m = image.length;
        int n = image[0].length;
        dfs(image, sr, sc, old, color, m, n);
        return image;
    }
    
    private void dfs(int[][] image, int i, int j, int old, int color, int m, int n) {
        if (i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old) return;
        image[i][j] = color;
        dfs(image, i + 1, j, old, color, m, n);
        dfs(image, i - 1, j, old, color, m, n);
        dfs(image, i, j + 1, old, color, m, n);
        dfs(image, i, j - 1, old, color, m, n);
    }
}
