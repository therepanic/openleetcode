function countHomogenous(s: string): number {
  const mod = 1000000007;
  const n = s.length;
  let res = 1;
  let cnt = 1;
  for (let i = 1; i < n; i++) {
    if (s[i] !== s[i - 1]) {
      cnt = 0;
    }
    cnt++;
    res = (res + cnt) % mod;
  }
  return res;
}
