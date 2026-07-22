function kthSmallest(mat: number[][], k: number): number {
  let sums = mat[0].slice(0, k);
  for (let i = 1; i < mat.length; i++) {
    const row = mat[i].slice(0, k);
    const next: number[] = [];
    for (const a of sums) {
      for (const b of row) {
        next.push(a + b);
      }
    }
    next.sort((x, y) => x - y);
    sums = next.slice(0, k);
  }
  return sums[k - 1];
}
