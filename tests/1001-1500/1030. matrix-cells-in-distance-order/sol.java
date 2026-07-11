class Solution {
    public int[][] allCellsDistOrder(int rows, int cols, int rCenter, int cCenter) {
        int[][] result = new int[rows * cols][2];
        int idx = 0;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                result[idx][0] = r;
                result[idx][1] = c;
                idx++;
            }
        }
        java.util.Arrays.sort(result, (a, b) -> {
            int d1 = Math.abs(a[0] - rCenter) + Math.abs(a[1] - cCenter);
            int d2 = Math.abs(b[0] - rCenter) + Math.abs(b[1] - cCenter);
            if (d1 != d2) return Integer.compare(d1, d2);
            if (a[0] != b[0]) return Integer.compare(a[0], b[0]);
            return Integer.compare(a[1], b[1]);
        });
        return result;
    }
}
