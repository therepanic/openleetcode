public class Solution {
    public int[][] FloodFill(int[][] image, int sr, int sc, int color) {
        int old = image[sr][sc];
        if (old == color) return image;
        int m = image.Length;
        int n = image[0].Length;
        void Dfs(int i, int j) {
            if (i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old) return;
            image[i][j] = color;
            Dfs(i + 1, j);
            Dfs(i - 1, j);
            Dfs(i, j + 1);
            Dfs(i, j - 1);
        }
        Dfs(sr, sc);
        return image;
    }
}
