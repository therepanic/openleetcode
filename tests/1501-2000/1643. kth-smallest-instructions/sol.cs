public class Solution {
    public string KthSmallestPath(int[] destination, int k) {
        int rows = destination[0];
        int cols = destination[1];
        var path = new StringBuilder();
        long kLocal = k - 1;

        while (rows > 0 || cols > 0) {
            long pathsWithH = 0;
            if (cols > 0) {
                pathsWithH = Combination(rows + cols - 1, cols - 1);
            }

            if (kLocal < pathsWithH) {
                path.Append('H');
                cols--;
            } else {
                path.Append('V');
                kLocal -= pathsWithH;
                rows--;
            }
        }
        return path.ToString();
    }

    private long Combination(int n, int r) {
        if (r == 0 || r == n) return 1;
        r = Math.Min(r, n - r);
        long result = 1;
        for (int i = 1; i <= r; i++) {
            result = result * (n - r + i) / i;
        }
        return result;
    }
}
