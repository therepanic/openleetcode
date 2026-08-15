public class Solution {
    public int[] FindBall(int[][] grid) {
        int m = grid.Length, n = grid[0].Length;
        int[] result = new int[n];
        for (int col = 0; col < n; col++) {
            int cur = col;
            for (int row = 0; row < m; row++) {
                int d = grid[row][cur];
                int nxt = cur + d;
                if (nxt < 0 || nxt >= n || grid[row][nxt] != d) {
                    cur = -1;
                    break;
                }
                cur = nxt;
            }
            result[col] = cur;
        }
        return result;
    }
}
