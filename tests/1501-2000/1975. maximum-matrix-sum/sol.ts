function maxMatrixSum(matrix: number[][]): number {
  let totalSum = 0;
  let neg = 0;
  let minAbs = Number.MAX_SAFE_INTEGER;
  for (const row of matrix) {
    for (const v of row) {
      if (v < 0) neg++;
      const av = Math.abs(v);
      totalSum += av;
      minAbs = Math.min(minAbs, av);
    }
  }
  return neg % 2 === 0 ? totalSum : totalSum - 2 * minAbs;
}
