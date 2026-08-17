class Solution {
  int minSkips(List<int> dist, int speed, int hoursBefore) {
    int inf = 1 << 60;
    int n = dist.length;
    List<int> dp = List.filled(n + 1, inf);
    dp[0] = 0;
    for (int i = 0; i < n; i++) {
      List<int> nxt = List.filled(n + 1, inf);
      for (int skips = 0; skips <= i + 1; skips++) {
        if (dp[skips] >= inf) continue;
        nxt[skips + 1] = min(nxt[skips + 1], dp[skips] + dist[i]);
        int arrival = dp[skips] + dist[i];
        if (i != n - 1) {
          arrival = ((arrival + speed - 1) ~/ speed) * speed;
        }
        nxt[skips] = min(nxt[skips], arrival);
      }
      dp = nxt;
    }
    int limit = hoursBefore * speed;
    for (int skips = 0; skips <= n; skips++) {
      if (dp[skips] <= limit) return skips;
    }
    return -1;
  }
}
