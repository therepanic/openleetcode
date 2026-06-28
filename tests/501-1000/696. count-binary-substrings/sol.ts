function countBinarySubstrings(s: string): number {
  let ans = 0,
    prev = 0,
    cur = 1;
  for (let i = 1; i < s.length; i++) {
    if (s[i - 1] !== s[i]) {
      ans += Math.min(prev, cur);
      prev = cur;
      cur = 1;
    } else {
      cur++;
    }
  }
  return ans + Math.min(prev, cur);
}
