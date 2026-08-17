class Solution {
    public int largestSubmatrix(int[][] matrix) {
        int m = matrix.length;
        int n = matrix[0].length;
        int maxArea = 0;
        int[] h = new int[n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (j < matrix[i].length && matrix[i][j] == 1) {
                    h[j]++;
                } else {
                    h[j] = 0;
                }
            }
            int[] sh = h.clone();
            Arrays.sort(sh);
            // reverse
            for (int l = 0, r = n - 1; l < r; l++, r--) {
                int temp = sh[l];
                sh[l] = sh[r];
                sh[r] = temp;
            }
            for (int j = 0; j < n; j++) {
                if (sh[j] == 0) break;
                maxArea = Math.max(maxArea, sh[j] * (j + 1));
            }
        }
        return maxArea;
    }
}
