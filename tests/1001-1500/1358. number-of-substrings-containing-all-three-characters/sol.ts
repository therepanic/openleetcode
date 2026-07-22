function numberOfSubstrings(s: string): number {
  let res = 0;
  const p: number[] = [50000, -1, -1, -1];
  for (let i = 0; i < s.length; i++) {
    p[s.charCodeAt(i) & 31] = i;
    res += Math.min(p[1], p[2], p[3]) + 1;
  }
  return res;
}
