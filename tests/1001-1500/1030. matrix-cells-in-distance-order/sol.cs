public class Solution {
    public int[][] AllCellsDistOrder(int rows, int cols, int rCenter, int cCenter) {
        int[][] result = new int[rows * cols][];
        int idx = 0;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                result[idx++] = new int[] { r, c };
            }
        }
        System.Array.Sort(result, (a, b) => {
            int d1 = Math.Abs(a[0] - rCenter) + Math.Abs(a[1] - cCenter);
            int d2 = Math.Abs(b[0] - rCenter) + Math.Abs(b[1] - cCenter);
            if (d1 != d2) return d1.CompareTo(d2);
            if (a[0] != b[0]) return a[0].CompareTo(b[0]);
            return a[1].CompareTo(b[1]);
        });
        return result;
    }
}
