public class Solution {
    public int MinSkips(int[] dist, int speed, int hoursBefore) {
        const long INF = (long)1e18;
        int n = dist.Length;
        long[] dp = new long[n + 1];
        Array.Fill(dp, INF);
        dp[0] = 0;
        for (int i = 0; i < n; i++) {
            long[] nxt = new long[n + 1];
            Array.Fill(nxt, INF);
            for (int skips = 0; skips <= i + 1; skips++) {
                if (dp[skips] >= INF) continue;
                nxt[skips + 1] = Math.Min(nxt[skips + 1], dp[skips] + dist[i]);
                long arrival = dp[skips] + dist[i];
                if (i != n - 1) {
                    arrival = ((arrival + speed - 1) / speed) * speed;
                }
                nxt[skips] = Math.Min(nxt[skips], arrival);
            }
            dp = nxt;
        }
        long limit = (long)hoursBefore * speed;
        for (int skips = 0; skips <= n; skips++) {
            if (dp[skips] <= limit) return skips;
        }
        return -1;
    }
}
