function spiralMatrixIII(
  rows: number,
  cols: number,
  rStart: number,
  cStart: number,
): number[][] {
  const total = rows * cols;
  const res: number[][] = [];
  res.push([rStart, cStart]);
  let top = rStart,
    bottom = rStart;
  let left = cStart,
    right = cStart;
  while (res.length < total) {
    right++;
    for (let i = left + 1; i <= right; i++) {
      if (top >= 0 && top < rows && i >= 0 && i < cols) {
        res.push([top, i]);
        if (res.length === total) return res;
      }
    }
    bottom++;
    for (let i = top + 1; i <= bottom; i++) {
      if (right >= 0 && right < cols && i >= 0 && i < rows) {
        res.push([i, right]);
        if (res.length === total) return res;
      }
    }
    left--;
    for (let i = right - 1; i >= left; i--) {
      if (i >= 0 && i < cols && bottom >= 0 && bottom < rows) {
        res.push([bottom, i]);
        if (res.length === total) return res;
      }
    }
    top--;
    for (let i = bottom - 1; i >= top; i--) {
      if (i >= 0 && i < rows && left >= 0 && left < cols) {
        res.push([i, left]);
        if (res.length === total) return res;
      }
    }
  }
  return res;
}
