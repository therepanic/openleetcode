function generateMatrix(n: number): number[][] {
  const res: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  let top = 0;
  let bottom = n - 1;
  let left = 0;
  let right = n - 1;
  let val = 1;

  while (top <= bottom && left <= right) {
    for (let col = left; col <= right; col++) {
      res[top][col] = val++;
    }
    top++;

    for (let row = top; row <= bottom; row++) {
      res[row][right] = val++;
    }
    right--;

    if (top <= bottom) {
      for (let col = right; col >= left; col--) {
        res[bottom][col] = val++;
      }
      bottom--;
    }

    if (left <= right) {
      for (let row = bottom; row >= top; row--) {
        res[row][left] = val++;
      }
      left++;
    }
  }

  return res;
}
