public class Solution {
    public int KthLargestValue(int[][] matrix, int k) {
        int n = matrix.Length;
        int m = matrix[0].Length;
        int[][] temp = new int[n][];
        for (int i = 0; i < n; i++) temp[i] = new int[m];
        temp[0][0] = matrix[0][0];
        for (int j = 1; j < m; j++) temp[0][j] = temp[0][j-1] ^ matrix[0][j];
        for (int i = 1; i < n; i++) temp[i][0] = temp[i-1][0] ^ matrix[i][0];
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1];
            }
        }
        List<int> arr = new List<int>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                arr.Add(temp[i][j]);
            }
        }
        arr.Sort((a, b) => b.CompareTo(a));
        return arr[k-1];
    }
}
