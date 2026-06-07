function lengthOfLongestSubstring(s: string): number {
  const lastSeen = new Map<string, number>();
  let start = 0;
  let res = 0;
  for (let end = 0; end < s.length; end++) {
    const char = s[end];
    const prev = lastSeen.get(char);
    if (prev !== undefined && prev >= start) {
      start = prev + 1;
    }
    const current = end - start + 1;
    if (current > res) {
      res = current;
    }
    lastSeen.set(char, end);
  }
  return res;
}
