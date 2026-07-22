class Solution {
    public int maxAbsValExpr(int[] arr1, int[] arr2) {
        int res = 0;
        int n = arr1.length;
        int[][] signs = {{1, 1}, {1, -1}, {-1, 1}, {-1, -1}};

        for (int[] sign : signs) {
            int p = sign[0], q = sign[1];
            int maxVal = Integer.MIN_VALUE;
            int minVal = Integer.MAX_VALUE;
            for (int i = 0; i < n; i++) {
                int value = p * arr1[i] + q * arr2[i] + i;
                maxVal = Math.max(maxVal, value);
                minVal = Math.min(minVal, value);
            }
            res = Math.max(res, maxVal - minVal);
        }

        return res;
    }
}
