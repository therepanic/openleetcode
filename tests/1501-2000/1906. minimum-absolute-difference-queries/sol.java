class Solution {
    public int[] minDifference(int[] nums, int[][] queries) {
        int maxVal = 0;
        for (int x : nums) maxVal = Math.max(maxVal, x);
        int[][] p = new int[nums.length + 1][maxVal + 1];
        for (int i = 0; i <= maxVal; i++) p[0][i] = 0;
        for (int i = 0; i < nums.length; i++) {
            for (int j = 0; j <= maxVal; j++) {
                p[i + 1][j] = p[i][j] + (nums[i] == j ? 1 : 0);
            }
        }
        int[] res = new int[queries.length];
        for (int qi = 0; qi < queries.length; qi++) {
            int l = queries[qi][0], r = queries[qi][1];
            int[] diff = new int[maxVal + 1];
            for (int j = 0; j <= maxVal; j++) diff[j] = p[r + 1][j] - p[l][j];
            int prev = -1;
            int best = -1;
            for (int j = 0; j <= maxVal; j++) {
                if (diff[j] > 0) {
                    if (prev >= 0) {
                        if (best == -1 || j - prev < best) best = j - prev;
                    }
                    prev = j;
                }
            }
            res[qi] = best;
        }
        return res;
    }
}
