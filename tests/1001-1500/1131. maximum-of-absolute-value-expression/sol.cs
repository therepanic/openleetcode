public class Solution {
    public int MaxAbsValExpr(int[] arr1, int[] arr2) {
        int res = 0;
        int n = arr1.Length;
        int[,] signs = {{1, 1}, {1, -1}, {-1, 1}, {-1, -1}};

        for (int k = 0; k < 4; k++) {
            int p = signs[k, 0];
            int q = signs[k, 1];
            int maxVal = int.MinValue;
            int minVal = int.MaxValue;
            for (int i = 0; i < n; i++) {
                int value = p * arr1[i] + q * arr2[i] + i;
                maxVal = Math.Max(maxVal, value);
                minVal = Math.Min(minVal, value);
            }
            res = Math.Max(res, maxVal - minVal);
        }

        return res;
    }
}
