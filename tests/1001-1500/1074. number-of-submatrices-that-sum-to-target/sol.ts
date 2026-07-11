function numSubmatrixSumTarget(matrix: number[][], target: number): number {
  const m = matrix.length,
    n = matrix[0].length;
  for (let row = 0; row < m; row++) {
    for (let col = 1; col < n; col++) {
      matrix[row][col] += matrix[row][col - 1];
    }
  }
  let count = 0;
  for (let c1 = 0; c1 < n; c1++) {
    for (let c2 = c1; c2 < n; c2++) {
      const prefixSumMap = new Map<number, number>();
      prefixSumMap.set(0, 1);
      let sumVal = 0;
      for (let row = 0; row < m; row++) {
        sumVal += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0);
        count += prefixSumMap.get(sumVal - target) ?? 0;
        prefixSumMap.set(sumVal, (prefixSumMap.get(sumVal) ?? 0) + 1);
      }
    }
  }
  return count;
}
