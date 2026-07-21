function kWeakestRows(mat: number[][], k: number): number[] {
  const d: { [key: number]: number } = {};
  for (let i = 0; i < mat.length; i++) {
    d[i] = mat[i].reduce((a, b) => a + b, 0);
  }
  return Object.keys(d)
    .map(Number)
    .sort((a, b) => (d[a] === d[b] ? a - b : d[a] - d[b]))
    .slice(0, k);
}
