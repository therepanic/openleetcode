function numSub(s: string): number {
  let cnt = 0;
  let total = 0;
  const mod = 1000000007;
  for (const a of s) {
    if (a === "1") {
      cnt++;
    } else {
      cnt = 0;
    }
    total = (total + cnt) % mod;
  }
  return total;
}
