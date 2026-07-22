class Solution {
    public List<Integer> luckyNumbers(int[][] matrix) {
        int rows = matrix.length;
        int cols = matrix[0].length;
        List<Integer> ans = new ArrayList<>();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                int ele1 = Integer.MAX_VALUE;
                for (int k = 0; k < cols; k++) {
                    if (matrix[i][k] < ele1) ele1 = matrix[i][k];
                }
                int ele2 = Integer.MIN_VALUE;
                for (int k = 0; k < rows; k++) {
                    if (matrix[k][j] > ele2) ele2 = matrix[k][j];
                }
                if (ele1 == matrix[i][j] && ele2 == matrix[i][j]) {
                    ans.add(matrix[i][j]);
                }
            }
        }
        return ans;
    }
}
