function findContentChildren(g: number[], s: number[]): number {
  g.sort((a, b) => a - b);
  s.sort((a, b) => a - b);
  let i = 0,
    j = 0,
    count = 0;
  while (i < g.length && j < s.length) {
    if (s[j] >= g[i]) {
      count++;
      i++;
    }
    j++;
  }
  return count;
}
