class Solution {
    public int kthSmallest(int[][] mat, int k) {
        int[] sums = java.util.Arrays.copyOf(mat[0], Math.min(mat[0].length, k));
        for (int i = 1; i < mat.length; i++) {
            int[] row = mat[i];
            int limit = Math.min(row.length, k);
            int[] next = new int[sums.length * limit];
            int idx = 0;
            for (int a : sums) {
                for (int j = 0; j < limit; j++) {
                    next[idx++] = a + row[j];
                }
            }
            java.util.Arrays.sort(next);
            sums = java.util.Arrays.copyOf(next, Math.min(k, next.length));
        }
        return sums[k - 1];
    }
}
