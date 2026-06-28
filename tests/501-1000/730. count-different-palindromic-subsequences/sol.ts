function countPalindromicSubsequences(s: string): number {
  const MOD = 1000000007;
  const n = s.length;
  const memo: number[][] = Array.from({ length: n + 1 }, () =>
    Array(n + 1).fill(-1),
  );

  function dp(left: number, right: number): number {
    if (left >= right) return 0;
    if (memo[left][right] !== -1) return memo[left][right];
    let res = 0;
    for (const ch of "abcd") {
      const l = s.indexOf(ch, left);
      if (l === -1 || l >= right) continue;
      const r = s.lastIndexOf(ch, right - 1);
      if (r === -1 || r < left) continue;
      if (l === r) {
        res += 1;
      } else {
        res += dp(l + 1, r) + 2;
      }
    }
    res %= MOD;
    memo[left][right] = res;
    return res;
  }

  return dp(0, n);
}
