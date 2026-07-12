public class Solution {
    public int NumSubmatrixSumTarget(int[][] matrix, int target) {
        int m = matrix.Length, n = matrix[0].Length;
        for (int row = 0; row < m; row++) {
            for (int col = 1; col < n; col++) {
                matrix[row][col] += matrix[row][col - 1];
            }
        }
        int count = 0;
        for (int c1 = 0; c1 < n; c1++) {
            for (int c2 = c1; c2 < n; c2++) {
                var prefixSumMap = new Dictionary<int, int>();
                prefixSumMap[0] = 1;
                int sumVal = 0;
                for (int row = 0; row < m; row++) {
                    sumVal += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0);
                    if (prefixSumMap.ContainsKey(sumVal - target))
                        count += prefixSumMap[sumVal - target];
                    if (prefixSumMap.ContainsKey(sumVal))
                        prefixSumMap[sumVal]++;
                    else
                        prefixSumMap[sumVal] = 1;
                }
            }
        }
        return count;
    }
}
