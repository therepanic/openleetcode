public class Solution {
    public int[][] HighestPeak(int[][] isWater) {
        int r = isWater.Length;
        int c = isWater[0].Length;
        int[][] height = new int[r][];
        for (int i = 0; i < r; i++) {
            height[i] = new int[c];
            Array.Fill(height[i], 1000000000);
        }

        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                if (isWater[i][j] == 1) {
                    height[i][j] = 0;
                } else {
                    if (i > 0) height[i][j] = Math.Min(height[i][j], height[i - 1][j] + 1);
                    if (j > 0) height[i][j] = Math.Min(height[i][j], height[i][j - 1] + 1);
                }
            }
        }

        for (int i = r - 1; i >= 0; i--) {
            for (int j = c - 1; j >= 0; j--) {
                if (i < r - 1) height[i][j] = Math.Min(height[i][j], height[i + 1][j] + 1);
                if (j < c - 1) height[i][j] = Math.Min(height[i][j], height[i][j + 1] + 1);
            }
        }

        return height;
    }
}
