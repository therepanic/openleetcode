class Solution {
    public int minSkips(int[] dist, int speed, int hoursBefore) {
        long inf = (long) 1e18;
        int n = dist.length;
        long[] dp = new long[n + 1];
        Arrays.fill(dp, inf);
        dp[0] = 0;
        for (int i = 0; i < n; i++) {
            long[] nxt = new long[n + 1];
            Arrays.fill(nxt, inf);
            for (int skips = 0; skips <= i + 1; skips++) {
                if (dp[skips] >= inf) continue;
                nxt[skips + 1] = Math.min(nxt[skips + 1], dp[skips] + dist[i]);
                long arrival = dp[skips] + dist[i];
                if (i != n - 1) {
                    arrival = ((arrival + speed - 1) / speed) * speed;
                }
                nxt[skips] = Math.min(nxt[skips], arrival);
            }
            dp = nxt;
        }
        long limit = (long) hoursBefore * speed;
        for (int skips = 0; skips <= n; skips++) {
            if (dp[skips] <= limit) return skips;
        }
        return -1;
    }
}
