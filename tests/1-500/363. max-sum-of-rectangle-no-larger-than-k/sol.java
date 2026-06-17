class Solution {
    public int maxSumSubmatrix(int[][] matrix, int k) {
        int m = matrix.length;
        int n = matrix[0].length;
        int ans = Integer.MIN_VALUE;
        for (int left = 0; left < n; left++) {
            int[] rowSum = new int[m];
            for (int right = left; right < n; right++) {
                for (int i = 0; i < m; i++) {
                    rowSum[i] += matrix[i][right];
                }
                TreeSet<Integer> set = new TreeSet<>();
                set.add(0);
                int curr = 0;
                for (int x : rowSum) {
                    curr += x;
                    Integer ceiling = set.ceiling(curr - k);
                    if (ceiling != null) {
                        ans = Math.max(ans, curr - ceiling);
                    }
                    set.add(curr);
                }
            }
        }
        return ans;
    }
}
