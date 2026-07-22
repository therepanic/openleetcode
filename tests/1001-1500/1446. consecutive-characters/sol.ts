function maxPower(s: string): number {
  let maxcnt = 0;
  let cnt = 0;
  for (let i = 1; i < s.length; i++) {
    if (s[i] === s[i - 1]) {
      cnt++;
    } else {
      cnt = 0;
    }
    maxcnt = Math.max(cnt, maxcnt);
  }
  return maxcnt + 1;
}
