function minSkips(dist: number[], speed: number, hoursBefore: number): number {
  const inf = 10 ** 30;
  const n = dist.length;
  let dp: number[] = new Array(n + 1).fill(inf);
  dp[0] = 0;
  for (let i = 0; i < n; i++) {
    const nxt: number[] = new Array(n + 1).fill(inf);
    const d = dist[i];
    for (let skips = 0; skips <= i + 1; skips++) {
      if (dp[skips] >= inf) continue;
      nxt[skips + 1] = Math.min(nxt[skips + 1], dp[skips] + d);
      let arrival = dp[skips] + d;
      if (i !== n - 1) {
        arrival = Math.ceil(arrival / speed) * speed;
      }
      nxt[skips] = Math.min(nxt[skips], arrival);
    }
    dp = nxt;
  }
  const limit = hoursBefore * speed;
  for (let skips = 0; skips <= n; skips++) {
    if (dp[skips] <= limit) return skips;
  }
  return -1;
}
