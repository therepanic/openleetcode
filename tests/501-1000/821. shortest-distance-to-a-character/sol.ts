function shortestToChar(s: string, c: string): number[] {
  const n = s.length;
  const ans: number[] = new Array(n).fill(n);
  let prev = -n;
  for (let i = 0; i < n; i++) {
    if (s[i] === c) {
      prev = i;
    }
    ans[i] = i - prev;
  }
  prev = 2 * n;
  for (let i = n - 1; i >= 0; i--) {
    if (s[i] === c) {
      prev = i;
    }
    ans[i] = Math.min(ans[i], prev - i);
  }
  return ans;
}
