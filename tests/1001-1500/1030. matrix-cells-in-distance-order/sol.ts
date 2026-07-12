function allCellsDistOrder(
  rows: number,
  cols: number,
  rCenter: number,
  cCenter: number,
): number[][] {
  const result: number[][] = [];
  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      result.push([r, c]);
    }
  }
  result.sort((a, b) => {
    const d1 = Math.abs(a[0] - rCenter) + Math.abs(a[1] - cCenter);
    const d2 = Math.abs(b[0] - rCenter) + Math.abs(b[1] - cCenter);
    if (d1 !== d2) return d1 - d2;
    if (a[0] !== b[0]) return a[0] - b[0];
    return a[1] - b[1];
  });
  return result;
}
