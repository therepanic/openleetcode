function maxScore(nums: number[]): number {
  const n = nums.length;
  const dp: number[][] = Array.from({ length: 1 << n }, () =>
    Array(Math.floor(n / 2) + 1).fill(-1),
  );

  const gcd = (a: number, b: number): number => (b === 0 ? a : gcd(b, a % b));

  const dfs = (mask: number, op: number): number => {
    if (mask === (1 << n) - 1) return 0;
    if (dp[mask][op] !== -1) return dp[mask][op];
    let ans = 0;
    for (let i = 0; i < n; i++) {
      if ((mask & (1 << i)) === 0) {
        for (let j = 0; j < n; j++) {
          if (j !== i && (mask & (1 << j)) === 0) {
            const nmask = mask | (1 << i) | (1 << j);
            const val = dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op;
            ans = Math.max(ans, val);
          }
        }
      }
    }
    dp[mask][op] = ans;
    return ans;
  };

  return dfs(0, 1);
}
