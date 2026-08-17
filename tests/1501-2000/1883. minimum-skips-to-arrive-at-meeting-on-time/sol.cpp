class Solution {
public:
    int minSkips(vector<int>& dist, int speed, int hoursBefore) {
        const long long INF = 1e18;
        int n = dist.size();
        vector<long long> dp(n + 1, INF);
        dp[0] = 0;
        for (int i = 0; i < n; i++) {
            vector<long long> nxt(n + 1, INF);
            int d = dist[i];
            for (int skips = 0; skips <= i + 1; skips++) {
                if (dp[skips] >= INF) continue;
                nxt[skips + 1] = min(nxt[skips + 1], dp[skips] + d);
                long long arrival = dp[skips] + d;
                if (i != n - 1) {
                    arrival = ((arrival + speed - 1) / speed) * speed;
                }
                nxt[skips] = min(nxt[skips], arrival);
            }
            dp = nxt;
        }
        long long limit = (long long)hoursBefore * speed;
        for (int skips = 0; skips <= n; skips++) {
            if (dp[skips] <= limit) return skips;
        }
        return -1;
    }
};
