public class Solution {
    public int[] CountPoints(int[][] points, int[][] queries) {
        int[] result = new int[queries.Length];
        for (int i = 0; i < queries.Length; i++) {
            for (int j = 0; j < points.Length; j++) {
                int dx = queries[i][0] - points[j][0];
                int dy = queries[i][1] - points[j][1];
                if (dx * dx + dy * dy <= queries[i][2] * queries[i][2]) {
                    result[i]++;
                }
            }
        }
        return result;
    }
}
