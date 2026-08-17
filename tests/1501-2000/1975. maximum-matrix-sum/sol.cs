public class Solution {
    public long MaxMatrixSum(int[][] matrix) {
        long totalSum = 0;
        int neg = 0;
        int minAbs = int.MaxValue;
        foreach (var row in matrix) {
            foreach (int v in row) {
                if (v < 0) neg++;
                int av = Math.Abs(v);
                totalSum += av;
                minAbs = Math.Min(minAbs, av);
            }
        }
        return neg % 2 == 0 ? totalSum : totalSum - 2L * minAbs;
    }
}
