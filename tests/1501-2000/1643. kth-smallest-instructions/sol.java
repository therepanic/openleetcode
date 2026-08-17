class Solution {
    public String kthSmallestPath(int[] destination, int k) {
        int rows = destination[0];
        int cols = destination[1];
        StringBuilder path = new StringBuilder();
        k--;

        while (rows > 0 || cols > 0) {
            long pathsWithH = 0;
            if (cols > 0) {
                pathsWithH = combination(rows + cols - 1, cols - 1);
            }

            if (k < pathsWithH) {
                path.append('H');
                cols--;
            } else {
                path.append('V');
                k -= pathsWithH;
                rows--;
            }
        }
        return path.toString();
    }

    private long combination(int n, int r) {
        if (r == 0 || r == n) return 1;
        r = Math.min(r, n - r);
        long result = 1;
        for (int i = 1; i <= r; i++) {
            result = result * (n - r + i) / i;
        }
        return result;
    }
}
