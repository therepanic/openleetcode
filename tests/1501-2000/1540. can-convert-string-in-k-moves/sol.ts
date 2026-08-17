function canConvertString(s: string, t: string, k: number): boolean {
  if (s.length !== t.length) return false;
  const shiftCount: number[] = new Array(26).fill(0);
  for (let i = 0; i < s.length; i++) {
    if (s[i] === t[i]) continue;
    const diff = (t.charCodeAt(i) - s.charCodeAt(i) + 26) % 26;
    shiftCount[diff]++;
    if (diff + 26 * (shiftCount[diff] - 1) > k) return false;
  }
  return true;
}
