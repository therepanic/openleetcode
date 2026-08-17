public class Solution {
    public int[] GetBiggestThree(int[][] grid) {
        int m = grid.Length, n = grid[0].Length;
        int maxD = Math.Min(m, n) / 2;
        List<int> list = new List<int>();
        for (int d = 0; d <= maxD; d++) {
            for (int i = d; i < m - d; i++) {
                for (int j = d; j < n - d; j++) {
                    int val = DiamondSum(grid, i, j, d);
                    if (!list.Contains(val)) list.Add(val);
                }
            }
        }
        list.Sort((a, b) => b.CompareTo(a));
        int count = Math.Min(3, list.Count);
        int[] ans = new int[count];
        for (int k = 0; k < count; k++) ans[k] = list[k];
        return ans;
    }
    
    private int DiamondSum(int[][] grid, int i, int j, int d) {
        if (d == 0) return grid[i][j];
        int sum = 0;
        for (int t = 0; t <= d; t++) sum += grid[i - d + t][j + t];
        for (int t = 1; t <= d; t++) sum += grid[i + t][j + d - t];
        for (int t = 1; t <= d; t++) sum += grid[i + d - t][j - t];
        for (int t = 1; t < d; t++) sum += grid[i - t][j - d + t];
        return sum;
    }
}
