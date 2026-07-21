function oddCells(m: number, n: number, indices: number[][]): number {
  const a: number[][] = Array.from({ length: m }, () => Array(n).fill(0));
  let c: number = 0;
  for (const k of indices) {
    for (let u = 0; u < n; u++) {
      a[k[0]][u]++;
    }
    for (let l = 0; l < m; l++) {
      a[l][k[1]]++;
    }
  }
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (a[i][j] % 2 !== 0) {
        c++;
      }
    }
  }
  return c;
}
