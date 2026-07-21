public class Solution {
    public int MaxSizeSlices(int[] slices) {
        int n = slices.Length;
        int m = n / 3;
        return Math.Max(DP(slices, 0, n - 2, m), DP(slices, 1, n - 1, m));
    }

    private int DP(int[] slices, int start, int end, int m) {
        int k = end - start + 1;
        int[,] dpTable = new int[k + 1, m + 1];
        for (int i = 1; i <= k; i++) {
            for (int j = 1; j <= Math.Min(i, m); j++) {
                dpTable[i, j] = Math.Max(dpTable[i - 1, j], (i > 1 ? dpTable[i - 2, j - 1] : 0) + slices[start + i - 1]);
            }
        }
        return dpTable[k, m];
    }
}
