public class Solution {
    public int LargestSubmatrix(int[][] matrix) {
        int m = matrix.Length;
        int n = matrix[0].Length;
        int maxArea = 0;
        int[] h = new int[n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (j < matrix[i].Length && matrix[i][j] == 1) {
                    h[j]++;
                } else {
                    h[j] = 0;
                }
            }
            int[] sh = (int[])h.Clone();
            Array.Sort(sh);
            Array.Reverse(sh);
            for (int j = 0; j < n; j++) {
                if (sh[j] == 0) break;
                maxArea = Math.Max(maxArea, sh[j] * (j + 1));
            }
        }
        return maxArea;
    }
}
