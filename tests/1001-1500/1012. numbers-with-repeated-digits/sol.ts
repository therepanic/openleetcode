function numDupDigitsAtMostN(n: number): number {
  const digits = String(n + 1)
    .split("")
    .map(Number);
  const nl = digits.length;
  let res = 0;
  for (let i = 0; i < nl - 1; i++) {
    res += 9 * perm(9, i);
  }
  const used = new Array(10).fill(false);
  for (let i = 0; i < nl; i++) {
    const x = digits[i];
    const start = i === 0 ? 1 : 0;
    for (let y = start; y < x; y++) {
      if (!used[y]) {
        res += perm(9 - i, nl - i - 1);
      }
    }
    if (used[x]) break;
    used[x] = true;
  }
  return n - res;
}

function perm(n: number, k: number): number {
  if (k < 0 || k > n) return 0;
  let ans = 1;
  for (let i = 0; i < k; i++) {
    ans *= n - i;
  }
  return ans;
}
