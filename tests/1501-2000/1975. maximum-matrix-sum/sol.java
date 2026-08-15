class Solution {
    public long maxMatrixSum(int[][] matrix) {
        long totalSum = 0;
        int neg = 0;
        int minAbs = Integer.MAX_VALUE;
        for (int[] row : matrix) {
            for (int v : row) {
                if (v < 0) neg++;
                int av = Math.abs(v);
                totalSum += av;
                minAbs = Math.min(minAbs, av);
            }
        }
        return neg % 2 == 0 ? totalSum : totalSum - 2L * minAbs;
    }
}
