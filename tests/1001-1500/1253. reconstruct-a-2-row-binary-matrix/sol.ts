function reconstructMatrix(
  upper: number,
  lower: number,
  colsum: number[],
): number[][] {
  const sum = colsum.reduce((a, b) => a + b, 0);
  if (upper + lower !== sum) return [];

  const n = colsum.length;
  const row1: number[] = new Array(n).fill(0);
  const row2: number[] = new Array(n).fill(0);

  for (let i = 0; i < n; i++) {
    if (colsum[i] === 2) {
      row1[i] = 1;
      row2[i] = 1;
      upper--;
      lower--;
    } else if (colsum[i] === 1) {
      if (upper > lower) {
        row1[i] = 1;
        upper--;
      } else {
        row2[i] = 1;
        lower--;
      }
    }
  }

  return lower === 0 && upper === 0 ? [row1, row2] : [];
}
