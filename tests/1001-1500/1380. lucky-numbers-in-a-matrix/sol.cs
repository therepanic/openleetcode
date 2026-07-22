public class Solution {
    public IList<int> LuckyNumbers(int[][] matrix) {
        int rows = matrix.Length;
        int cols = matrix[0].Length;
        IList<int> ans = new List<int>();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                int ele1 = int.MaxValue;
                for (int k = 0; k < cols; k++) {
                    if (matrix[i][k] < ele1) ele1 = matrix[i][k];
                }
                int ele2 = int.MinValue;
                for (int k = 0; k < rows; k++) {
                    if (matrix[k][j] > ele2) ele2 = matrix[k][j];
                }
                if (ele1 == matrix[i][j] && ele2 == matrix[i][j]) {
                    ans.Add(matrix[i][j]);
                }
            }
        }
        return ans;
    }
}
