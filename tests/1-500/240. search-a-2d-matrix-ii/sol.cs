public class Solution {
    public bool SearchMatrix(int[][] matrix, int target) {
        bool v = false;
        for (int idx = 0; idx < matrix.Length; idx++) {
            int[] i = matrix[idx];
            for (int j = 0; j < i.Length; j++) {
                if (i[j] == target) {
                    v = true;
                }
            }
        }
        return v;
    }
}
