function rearrangeSticks(n: number, k: number): number {
  const mod = 1000000007;
  let dp: number[] = new Array(k + 1).fill(0);
  dp[0] = 1;
  for (let length = 1; length <= n; length++) {
    const nxt: number[] = new Array(k + 1).fill(0);
    for (let visible = 1; visible <= Math.min(length, k); visible++) {
      nxt[visible] = (dp[visible - 1] + (length - 1) * dp[visible]) % mod;
    }
    dp = nxt;
  }
  return dp[k];
}
