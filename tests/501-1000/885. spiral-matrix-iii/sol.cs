public class Solution {
    public int[][] SpiralMatrixIII(int rows, int cols, int rStart, int cStart) {
        int total = rows * cols;
        int[][] res = new int[total][];
        int idx = 0;
        res[idx++] = new int[] { rStart, cStart };
        int top = rStart, bottom = rStart;
        int left = cStart, right = cStart;
        while (idx < total) {
            right++;
            for (int i = left + 1; i <= right; i++) {
                if (top >= 0 && top < rows && i >= 0 && i < cols) {
                    res[idx++] = new int[] { top, i };
                    if (idx == total) return res;
                }
            }
            bottom++;
            for (int i = top + 1; i <= bottom; i++) {
                if (right >= 0 && right < cols && i >= 0 && i < rows) {
                    res[idx++] = new int[] { i, right };
                    if (idx == total) return res;
                }
            }
            left--;
            for (int i = right - 1; i >= left; i--) {
                if (i >= 0 && i < cols && bottom >= 0 && bottom < rows) {
                    res[idx++] = new int[] { bottom, i };
                    if (idx == total) return res;
                }
            }
            top--;
            for (int i = bottom - 1; i >= top; i--) {
                if (i >= 0 && i < rows && left >= 0 && left < cols) {
                    res[idx++] = new int[] { i, left };
                    if (idx == total) return res;
                }
            }
        }
        return res;
    }
}
