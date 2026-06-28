function numDecodings(s: string): number {
  const M = 1000000007;
  const n = s.length - 1;

  const d: Map<string, number> = new Map();
  for (let i = 1; i <= 26; i++) d.set(String(i), 1);
  for (let i = 0; i <= 9; i++) d.set("*" + i, 1 + (i < 7 ? 1 : 0));
  d.set("*", 9);
  d.set("**", 15);
  d.set("1*", 9);
  d.set("2*", 6);

  const dp: number[] = new Array(n + 2).fill(0);
  dp[0] = d.get(s[0]) ?? 0;
  dp[n + 1] = 1;

  for (let i = 0; i < n; i++) {
    const one = s[i + 1];
    const two = s[i] + s[i + 1];

    let count = ((d.get(one) ?? 0) * dp[i]) % M;
    count = (count + (d.get(two) ?? 0) * (i > 0 ? dp[i - 1] : 1)) % M;
    dp[i + 1] = count;

    if (dp[i + 1] === 0) return 0;
  }

  return dp[n];
}
