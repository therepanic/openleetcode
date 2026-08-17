function construct2DArray(
  original: number[],
  m: number,
  n: number,
): number[][] {
  const k = original.length;
  if (m * n !== k) return [];
  const ans: number[][] = Array.from({ length: m }, () => new Array(n).fill(0));
  let idx = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      ans[i][j] = original[idx++];
    }
  }
  return ans;
}
