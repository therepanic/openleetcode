function numberOfGoodSubsets(nums: number[]): number {
  const mod = 1_000_000_007;
  const primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
  const freq = new Array(31).fill(0);
  for (const x of nums) freq[x]++;
  const masks = new Array(31).fill(0);
  for (let x = 2; x <= 30; x++) {
    let y = x,
      mask = 0,
      ok = true;
    for (let b = 0; b < 10; b++) {
      const p = primes[b];
      if (y % (p * p) === 0) {
        ok = false;
        break;
      }
      if (y % p === 0) mask |= 1 << b;
    }
    if (ok) masks[x] = mask;
  }
  const dp = new Array(1024).fill(0);
  dp[0] = 1;
  for (let x = 2; x <= 30; x++) {
    const mask = masks[x];
    if (mask === 0 || freq[x] === 0) continue;
    for (let state = 1023; state >= 0; state--) {
      if ((state & mask) === 0) {
        const next = state | mask;
        dp[next] = (dp[next] + dp[state] * freq[x]) % mod;
      }
    }
  }
  let ans = 0;
  for (let state = 1; state < 1024; state++) ans = (ans + dp[state]) % mod;
  for (let i = 0; i < freq[1]; i++) ans = (ans * 2) % mod;
  return ans;
}
