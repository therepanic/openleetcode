class Solution {
    public int[] kWeakestRows(int[][] mat, int k) {
        int n = mat.length;
        int[][] soldiers = new int[n][2];
        for (int i = 0; i < n; i++) {
            int sum = 0;
            for (int val : mat[i]) {
                sum += val;
            }
            soldiers[i][0] = sum;
            soldiers[i][1] = i;
        }
        Arrays.sort(soldiers, (a, b) -> a[0] == b[0] ? a[1] - b[1] : a[0] - b[0]);
        int[] result = new int[k];
        for (int i = 0; i < k; i++) {
            result[i] = soldiers[i][1];
        }
        return result;
    }
}
