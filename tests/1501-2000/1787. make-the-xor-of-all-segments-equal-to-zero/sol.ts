function minChanges(nums: number[], k: number): number {
  const freq: Map<number, Map<number, number>> = new Map();
  for (let i = 0; i < nums.length; i++) {
    const rem = i % k;
    if (!freq.has(rem)) freq.set(rem, new Map());
    const map = freq.get(rem)!;
    map.set(nums[i], (map.get(nums[i]) || 0) + 1);
  }

  const n = 1 << 10;
  let dp: number[] = Array(n).fill(-Infinity);
  dp[0] = 0;
  for (let i = 0; i < k; i++) {
    const mx = Math.max(...dp);
    const tmp = new Array(n).fill(0);
    for (let x = 0; x < n; x++) {
      const c = dp[x];
      if (freq.has(i)) {
        for (const [xx, cc] of freq.get(i)!.entries()) {
          const idx = x ^ xx;
          tmp[idx] = Math.max(tmp[idx], c + cc, mx);
        }
      }
    }
    dp = tmp;
  }
  return nums.length - dp[0];
}
