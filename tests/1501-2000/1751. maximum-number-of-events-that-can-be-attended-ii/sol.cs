public class Solution {
    public int MaxValue(int[][] events, int k) {
        Array.Sort(events, (a, b) => a[1].CompareTo(b[1]));
        int n = events.Length;
        int[,] dp = new int[n + 1, k + 1];
        
        for (int i = 1; i <= n; i++) {
            int start = events[i - 1][0];
            int value = events[i - 1][2];
            int prev = FindLastNonOverlapping(events, i - 1, start);
            for (int j = 1; j <= k; j++) {
                dp[i, j] = Math.Max(dp[i - 1, j], dp[prev + 1, j - 1] + value);
            }
        }
        return dp[n, k];
    }
    
    private int FindLastNonOverlapping(int[][] events, int right, int targetStart) {
        int left = 0;
        int res = -1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (events[mid][1] < targetStart) {
                res = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return res;
    }
}
