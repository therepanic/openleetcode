public class Solution {
    public int JobScheduling(int[] startTime, int[] endTime, int[] profit) {
        int n = startTime.Length;
        int[][] jobs = new int[n][];
        for (int i = 0; i < n; i++) {
            jobs[i] = new int[] { startTime[i], endTime[i], profit[i] };
        }
        Array.Sort(jobs, (a, b) => a[0].CompareTo(b[0]));
        
        int[] starts = new int[n];
        for (int i = 0; i < n; i++) {
            starts[i] = jobs[i][0];
        }
        
        int[] dp = new int[n + 1];
        for (int i = n - 1; i >= 0; i--) {
            int target = jobs[i][1];
            int idx = Array.BinarySearch(starts, i + 1, n - i - 1, target);
            if (idx < 0) idx = ~idx;
            int take = jobs[i][2] + dp[idx];
            int notTake = dp[i + 1];
            dp[i] = Math.Max(take, notTake);
        }
        return dp[0];
    }
}
