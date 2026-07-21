function maxAbsValExpr(arr1: number[], arr2: number[]): number {
  let res = 0;
  const n = arr1.length;
  const signs: [number, number][] = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
  ];

  for (const [p, q] of signs) {
    let maxVal = -Infinity;
    let minVal = Infinity;
    for (let i = 0; i < n; i++) {
      const value = p * arr1[i] + q * arr2[i] + i;
      maxVal = Math.max(maxVal, value);
      minVal = Math.min(minVal, value);
    }
    res = Math.max(res, maxVal - minVal);
  }

  return res;
}
