function hammingDistance(x: number, y: number): number {
  let count = 0;
  if (x === y) {
    return count;
  }
  while (x > 0 || y > 0) {
    let x_bit = 0;
    let y_bit = 0;
    if (x > 0) {
      x_bit = x % 2;
      x = Math.floor(x / 2);
    }
    if (y > 0) {
      y_bit = y % 2;
      y = Math.floor(y / 2);
    }
    if (x_bit !== y_bit) {
      count++;
    }
  }
  return count;
}
