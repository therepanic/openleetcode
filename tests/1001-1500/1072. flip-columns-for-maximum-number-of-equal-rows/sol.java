class Solution {
    public int maxEqualRowsAfterFlips(int[][] matrix) {
        java.util.Map<String, Integer> count = new java.util.HashMap<>();
        int ans = 0;

        for (int[] row : matrix) {
            int flip = row[0];
            StringBuilder sb = new StringBuilder();
            for (int x : row) {
                sb.append(x ^ flip);
                sb.append(',');
            }
            String key = sb.toString();
            int val = count.getOrDefault(key, 0) + 1;
            count.put(key, val);
            if (val > ans) ans = val;
        }

        return ans;
    }
}
