function largestAltitude(gain: number[]): number {
  let ans = 0,
    acc = 0;
  for (const it of gain) {
    acc += it;
    const d = acc - ans;
    ans += d & ~(d >> 31);
  }
  return ans;
}
