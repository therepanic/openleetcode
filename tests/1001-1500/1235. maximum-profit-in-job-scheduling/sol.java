class Solution {
    public int jobScheduling(int[] startTime, int[] endTime, int[] profit) {
        int n = startTime.length;
        int[][] jobs = new int[n][3];
        for (int i = 0; i < n; i++) {
            jobs[i][0] = startTime[i];
            jobs[i][1] = endTime[i];
            jobs[i][2] = profit[i];
        }
        java.util.Arrays.sort(jobs, (a, b) -> Integer.compare(a[0], b[0]));
        
        int[] starts = new int[n];
        for (int i = 0; i < n; i++) {
            starts[i] = jobs[i][0];
        }
        
        int[] dp = new int[n + 1];
        for (int i = n - 1; i >= 0; i--) {
            int idx = java.util.Arrays.binarySearch(starts, i + 1, n, jobs[i][1]);
            if (idx < 0) {
                idx = -idx - 1;
            }
            int take = jobs[i][2] + dp[idx];
            int notTake = dp[i + 1];
            dp[i] = Math.max(take, notTake);
        }
        return dp[0];
    }
}
