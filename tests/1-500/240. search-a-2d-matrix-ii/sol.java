class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        boolean v = false;
        for (int[] i : matrix) {
            for (int j = 0; j < i.length; j++) {
                if (i[j] == target) {
                    v = true;
                }
            }
        }
        return v;
    }
}
