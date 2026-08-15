class Solution {
    public int kthLargestValue(int[][] matrix, int k) {
        int n = matrix.length;
        int m = matrix[0].length;
        int[][] temp = new int[n][m];
        temp[0][0] = matrix[0][0];
        for (int j = 1; j < m; j++) temp[0][j] = temp[0][j-1] ^ matrix[0][j];
        for (int i = 1; i < n; i++) temp[i][0] = temp[i-1][0] ^ matrix[i][0];
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1];
            }
        }
        int[] arr = new int[n*m];
        int idx = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                arr[idx++] = temp[i][j];
            }
        }
        Arrays.sort(arr);
        return arr[n*m - k];
    }
}
