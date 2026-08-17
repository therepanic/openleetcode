class Solution {
    public boolean[] canEat(int[] candiesCount, int[][] queries) {
        int n = candiesCount.length;
        int m = queries.length;
        boolean[] ans = new boolean[m];
        long[] psum = new long[n + 1];
        for (int i = 1; i <= n; i++) {
            psum[i] = psum[i - 1] + candiesCount[i - 1];
        }
        for (int i = 0; i < m; i++) {
            int t = queries[i][0];
            long day = queries[i][1];
            long cap = queries[i][2];
            long minDays = psum[t] / cap;
            long maxDays = psum[t + 1] - 1;
            ans[i] = (minDays <= day && day <= maxDays);
        }
        return ans;
    }
}
