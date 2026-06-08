public class Solution {
    public IList<int> SpiralOrder(int[][] matrix) {
        var res = new List<int>();
        int top = 0;
        int bottom = matrix.Length - 1;
        int left = 0;
        int right = matrix[0].Length - 1;

        while (top <= bottom && left <= right) {
            for (int col = left; col <= right; col++) {
                res.Add(matrix[top][col]);
            }
            top++;

            for (int row = top; row <= bottom; row++) {
                res.Add(matrix[row][right]);
            }
            right--;

            if (top <= bottom) {
                for (int col = right; col >= left; col--) {
                    res.Add(matrix[bottom][col]);
                }
                bottom--;
            }

            if (left <= right) {
                for (int row = bottom; row >= top; row--) {
                    res.Add(matrix[row][left]);
                }
                left++;
            }
        }

        return res;
    }
}
