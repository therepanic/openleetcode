class Solution {
    public int[] countPoints(int[][] points, int[][] queries) {
        int[] result = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            for (int j = 0; j < points.length; j++) {
                if ((Math.pow(queries[i][0] - points[j][0], 2) + Math.pow(queries[i][1] - points[j][1], 2)) <= Math.pow(queries[i][2], 2)) {
                    result[i]++;
                }
            }
        }
        return result;
    }
}
